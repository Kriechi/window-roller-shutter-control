#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>
#include <PubSubClient.h>
#include <ArduinoOTA.h>
#include <Ticker.h>

#include "credentials.h"

const int WINDOW_1_A = D1;
const int WINDOW_1_B = D0;
const int WINDOW_2_A = D7;
const int WINDOW_2_B = D2;
const int WINDOW_3_A = D5;
const int WINDOW_3_B = D6;

// B=LOW, A=HIGH => window shutter going up
// A=LOW, B=HIGH => window shutter going down

float DEFAULT_POSITION_TIME = 30.0;

WiFiClient wifi_client;
PubSubClient mqtt_client(wifi_client);
unsigned int mqtt_reconnect_counter = 0;
ESP8266WebServer server(80);
Ticker deenergize_ticker[6];

bool presets_mqtt_enabled = true;

void setup_wifi();
void setup_relays();
void setup_webserver();
void setup_ota();
void handleHTTPRoot();
void handleHTTPAction();
void handleHTTPStop();
void handleHTTPEnable();
void handleHTTPDisable();
void handleHTTPRestart();
void mqttCallback(char *topic, byte *payload, unsigned int length);
void reconnect();
void action(char window, char direction);
void action(char window, char direction, float position);
void toggle_shutter(int inactive, int active);
void toggle_shutter(int inactive, int active, float position);
void deenergize(int active);
void preset_work_day();
void preset_normal_day();
void preset_night();

unsigned int translate_pin(unsigned int pin)
{
  switch (pin)
  {
  case WINDOW_1_A:
    return 0;
  case WINDOW_1_B:
    return 1;
  case WINDOW_2_A:
    return 2;
  case WINDOW_2_B:
    return 3;
  case WINDOW_3_A:
    return 4;
  case WINDOW_3_B:
    return 5;
  default:
    return UINT32_MAX;
  }
}

void setup()
{
  Serial.begin(115200);
  Serial.println();
  Serial.println();

  setup_wifi();

  randomSeed(micros());

  setup_relays();

  mqtt_client.setServer(mqtt_server, 1883);
  mqtt_client.setCallback(mqttCallback);
  mqtt_reconnect_counter = 0;

  setup_webserver();
  setup_ota();

  Serial.println("Setup complete.");
}

void setup_wifi()
{
  Serial.print("Connecting to ");
  Serial.println(ssid);

  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, wifi_password);

  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
}

void setup_relays()
{
  pinMode(WINDOW_1_B, OUTPUT);
  digitalWrite(WINDOW_1_B, LOW);
  pinMode(WINDOW_1_A, OUTPUT);
  digitalWrite(WINDOW_1_A, LOW);
  pinMode(WINDOW_2_B, OUTPUT);
  digitalWrite(WINDOW_2_B, LOW);
  pinMode(WINDOW_2_A, OUTPUT);
  digitalWrite(WINDOW_2_A, LOW);
  pinMode(WINDOW_3_B, OUTPUT);
  digitalWrite(WINDOW_3_B, LOW);
  pinMode(WINDOW_3_A, OUTPUT);
  digitalWrite(WINDOW_3_A, LOW);
}

void setup_webserver()
{
  server.on("/", handleHTTPRoot);
  server.on("/action", handleHTTPAction);
  server.on("/stop", handleHTTPStop);
  server.on("/enable", handleHTTPEnable);
  server.on("/disable", handleHTTPDisable);
  server.on("/restart", handleHTTPRestart);
  server.begin();
  Serial.println("HTTP server started");
}

void setup_ota()
{
  // ArduinoOTA.setPassword(ota_password);
  ArduinoOTA.onStart([]()
                     {
                       String type;
                       if (ArduinoOTA.getCommand() == U_FLASH)
                       {
                         type = "sketch";
                       }
                       else
                       { // U_FS
                         type = "filesystem";
                       }
                       // NOTE: if updating FS this would be the place to unmount FS using FS.end()
                       Serial.println("Start updating " + type);
                     });
  ArduinoOTA.onEnd([]()
                   { Serial.println("\nEnd"); });
  ArduinoOTA.onProgress([](unsigned int progress, unsigned int total)
                        { Serial.printf("Progress: %u%%\r", (progress / (total / 100))); });
  ArduinoOTA.onError([](ota_error_t error)
                     {
                       Serial.printf("Error[%u]: ", error);
                       if (error == OTA_AUTH_ERROR)
                       {
                         Serial.println("Auth Failed");
                       }
                       else if (error == OTA_BEGIN_ERROR)
                       {
                         Serial.println("Begin Failed");
                       }
                       else if (error == OTA_CONNECT_ERROR)
                       {
                         Serial.println("Connect Failed");
                       }
                       else if (error == OTA_RECEIVE_ERROR)
                       {
                         Serial.println("Receive Failed");
                       }
                       else if (error == OTA_END_ERROR)
                       {
                         Serial.println("End Failed");
                       }
                     });
  ArduinoOTA.begin();
}

void loop()
{
  if (!mqtt_client.connected())
  {
    reconnect();
  }
  mqtt_client.loop();
  server.handleClient();
  ArduinoOTA.handle();
}

void reconnect()
{
  // Loop until we're reconnected
  while (!mqtt_client.connected())
  {
    Serial.print("Attempting MQTT connection...");
    // Create a random client ID
    String clientId = "ESP8266Client-";
    clientId += String(random(0xffff), HEX);
    // Attempt to connect
    if (mqtt_client.connect(clientId.c_str(), mqtt_username, mqtt_password))
    {
      mqtt_reconnect_counter += 1;
      Serial.println(" connected.");
      String msg = "Fiat Lux for the " + String(mqtt_reconnect_counter) + "th time! My IP is " + WiFi.localIP().toString() + " an I'm up for " + millis() + "millisec.";
      mqtt_client.publish("window_shutter_status", msg.c_str());
      mqtt_client.subscribe("window_shutter");
    }
    else
    {
      Serial.print("failed, rc=");
      Serial.print(mqtt_client.state());
      delay(5000);
    }
  }
}

void action(char window, char direction)
{
  action(window, direction, DEFAULT_POSITION_TIME);
}

void action(char window, char direction, float position)
{
  if (window == '1' && direction == 'd')
  {
    Serial.println("Window 1 down...");
    mqtt_client.publish("window_shutter_status", "Window 1 down...");
    toggle_shutter(WINDOW_1_A, WINDOW_1_B, position);
  }
  else if (window == '1' && direction == 'u')
  {
    Serial.println("Window 1 up...");
    mqtt_client.publish("window_shutter_status", "Window 1 up...");
    toggle_shutter(WINDOW_1_B, WINDOW_1_A, position);
  }
  else if (window == '2' && direction == 'd')
  {
    Serial.println("Window 2 down...");
    mqtt_client.publish("window_shutter_status", "Window 2 down...");
    toggle_shutter(WINDOW_2_A, WINDOW_2_B, position);
  }
  else if (window == '2' && direction == 'u')
  {
    Serial.println("Window 2 up...");
    mqtt_client.publish("window_shutter_status", "Window 2 up...");
    toggle_shutter(WINDOW_2_B, WINDOW_2_A, position);
  }
  else if (window == '3' && direction == 'd')
  {
    Serial.println("Window 3 down...");
    mqtt_client.publish("window_shutter_status", "Window 3 down...");
    toggle_shutter(WINDOW_3_A, WINDOW_3_B, position);
  }
  else if (window == '3' && direction == 'u')
  {
    Serial.println("Window 3 up...");
    mqtt_client.publish("window_shutter_status", "Window 3 up...");
    toggle_shutter(WINDOW_3_B, WINDOW_3_A, position);
  }
}

void action_stop()
{
  digitalWrite(WINDOW_1_A, LOW);
  digitalWrite(WINDOW_1_B, LOW);
  digitalWrite(WINDOW_2_A, LOW);
  digitalWrite(WINDOW_2_B, LOW);
  digitalWrite(WINDOW_3_A, LOW);
  digitalWrite(WINDOW_3_B, LOW);

  for (auto &&t : deenergize_ticker)
  {
    t.detach();
  }

  mqtt_client.publish("window_shutter_status", "stopped");
}

void handleHTTPRoot()
{
  // minify index.html and replace in between rawliteral here
  String index_html = R"rawliteral(
      <!DOCTYPE html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"><meta name="apple-mobile-web-app-capable" content="yes"><title>Window Roller Shutters</title><style>body{text-align:center;font-family:sans-serif;background:#2c2c2c}#main{text-align:center;display:inline-block;color:#f0f0f0;min-width:340px}table{width:100%}a{color:#f0f0f0;text-decoration:none}button{border:0;border-radius:.5rem;background:#25abf3;color:#f0f0f0;line-height:3rem;font-size:1.3rem;width:100%}button:hover{background:#1377ad}</style></head><body><div id="main"><h2>Window Roller Shutters</h2><table><tr><td colspan="3"><button class="action" name="preset_work_day">Work Day</button></td></tr><tr><td colspan="3"><button class="action" name="preset_normal_day">Day</button></td></tr></table><hr><table><tr><td><button class="action" name="1u">1 Up</button></td><td><button class="action" name="2u">2 Up</button></td><td><button class="action" name="3u">3 Up</button></td></tr><tr><td><button class="action" name="1d">1 Down</button></td><td><button class="action" name="2d">2 Down</button></td><td><button class="action" name="3d">3 Down</button></td></tr></table><hr><table><tr><td colspan="3"><button class="action" name="preset_night">Night</button></td></tr></table><hr><table><tr><td><button class="action" name="stop">Stop</button></td></tr></table><hr><table><tr><td><a href="{{enable_action}}"><button>{{enable_state}}</button></a></td></tr></table><hr><p><a href="/restart">Restart</a></p><script>els = document.getElementsByClassName("action");Array.from(els).forEach((el) => {el.addEventListener("click", function (e) {var xhttp = new XMLHttpRequest();xhttp.open("GET", "/action?q=" + e.target.name, true);xhttp.send();});});</script></div></body></html>
    )rawliteral";

  index_html.replace("{{enable_state}}", presets_mqtt_enabled ? "Disable presets (currently enabled)" : "Enable presets (currently disabled)");
  index_html.replace("{{enable_action}}", presets_mqtt_enabled ? "disable" : "enable");

  server.send(200, "text/html", index_html);
}

void handleHTTPAction()
{
  if (server.hasArg("q") && server.arg("q").length() == 2 && (server.arg("q").charAt(0) == '1' || server.arg("q").charAt(0) == '2' || server.arg("q").charAt(0) == '3'))
  {
    action(server.arg("q").charAt(0), server.arg("q").charAt(1));
    server.send(200, "text/plain", "ok");
  }
  else if (server.hasArg("q") && server.arg("q") == "preset_work_day")
  {
    preset_work_day();
    server.send(200, "text/plain", "ok");
  }
  else if (server.hasArg("q") && server.arg("q") == "preset_normal_day")
  {
    preset_normal_day();
    server.send(200, "text/plain", "ok");
  }
  else if (server.hasArg("q") && server.arg("q") == "preset_night")
  {
    preset_night();
    server.send(200, "text/plain", "ok");
  }
  else if (server.hasArg("q") && (server.arg("q") == "s" || server.arg("q") == "stop"))
  {
    action_stop();
    server.send(200, "text/plain", "ok");
  }
  else
  {
    server.send(500, "text/plain", "error");
  }
}

void handleHTTPStop()
{
  action_stop();
  server.send(200, "text/plain", "ok");
}

void handleHTTPEnable()
{
  presets_mqtt_enabled = true;
  Serial.println("Enabled all actions.");
  handleHTTPRoot();
}

void handleHTTPDisable()
{
  presets_mqtt_enabled = false;
  Serial.println("Disabled all actions.");
  handleHTTPRoot();
}

void handleHTTPRestart()
{
  server.send(200, "text/plain", "ok");
  Serial.println("Restarting ESP...");
  ESP.restart();
}

void mqttCallback(char *t, byte *p, unsigned int length)
{
  String topic = String(t);
  String payload;
  for (size_t i = 0; i < length; i++)
  {
    payload.concat((char)p[i]);
  }

  if (topic != "window_shutter")
  {
    return;
  }

  String msg = payload + " " + payload.length();
  mqtt_client.publish("window_shutter_status", msg.c_str());

  if (payload == "restart")
  {
    Serial.println("Restarting ESP...");
    ESP.restart();
    return;
  }
  else if (payload == "s" || payload == "st" || payload == "sto" || payload == "stop")
  {
    Serial.println("Stopping all window shutters...");
    action_stop();
    return;
  }

  if (presets_mqtt_enabled && (payload == "preset_work_day" || payload == "work_day" || payload == "work" || payload == "w"))
  {
    preset_work_day();
  }
  else if (presets_mqtt_enabled && (payload == "preset_normal_day" || payload == "normal_day" || payload == "normal" || payload == "up" || payload == "u"))
  {
    preset_normal_day();
  }
  else if (presets_mqtt_enabled && (payload == "preset_night" || payload == "night" || payload == "down" || payload == "d"))
  {
    preset_night();
  }
  else if (payload.length() >= 2)
  {
    action((char)payload[0], (char)payload[1]);
  }
  else
  {
    Serial.println("WARN: unknown message!");
    Serial.println(payload);
  }
}

void toggle_shutter(int inactive, int active)
{
  toggle_shutter(inactive, active, DEFAULT_POSITION_TIME);
}

void toggle_shutter(int inactive, int active, float position)
{
  digitalWrite(inactive, LOW);
  deenergize_ticker[translate_pin(inactive)].detach();

  delay(250);

  digitalWrite(active, HIGH);
  deenergize_ticker[translate_pin(active)].once(position, deenergize, active);

  String msg = String("set relays ") + inactive + String("=OFF and ") + active + String("=ON");
  mqtt_client.publish("window_shutter_status", msg.c_str());
}

void deenergize(int active)
{
  digitalWrite(active, LOW);
  String msg = String("deenergized ") + active;
  mqtt_client.publish("window_shutter_status", msg.c_str());
}

void preset_work_day()
{
  mqtt_client.publish("window_shutter_status", "setting preset: work day...");
  action('1', 'u');
  action('2', 'u');
  action('3', 'u', 13.0);
}

void preset_normal_day()
{
  mqtt_client.publish("window_shutter_status", "setting preset: normal day...");
  action('1', 'u');
  action('2', 'u');
  action('3', 'u');
}

void preset_night()
{
  mqtt_client.publish("window_shutter_status", "setting preset: night...");
  action('1', 'd');
  action('2', 'd');
  action('3', 'd');
}
