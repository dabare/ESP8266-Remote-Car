---------------------------------------
--- Set Variables ---
---------------------------------------
--- Set AP Configuration Variables ---
AP_CFG={}
--- SSID: 1-32 chars
AP_CFG.ssid="mandy car"
AP_CFG.pwd="12345678"
AP_CFG.auth=AUTH_OPEN
--- Channel: Range 1-14
AP_CFG.channel = 6
--- Hidden Network? True: 1, False: 0
AP_CFG.hidden = 0
--- Max Connections: Range 1-4
AP_CFG.max=4
--- WiFi Beacon: Range 100-60000
AP_CFG.beacon=100

--- Set AP IP Configuration Variables ---
AP_IP_CFG={}
AP_IP_CFG.ip="192.168.10.1"
AP_IP_CFG.netmask="255.255.255.0"
AP_IP_CFG.gateway="192.168.10.1"

--- Set AP DHCP Configuration Variables ---
--- There is no support for defining last DHCP IP ---
AP_DHCP_CFG ={}
AP_DHCP_CFG.start = "192.168.10.2"
---------------------------------------

--- Configure ESP8266 into AP Mode ---
wifi.setmode(wifi.SOFTAP)
--- Configure 802.11n Standard ---
wifi.setphymode(wifi.PHYMODE_N)

--- Configure WiFi Network Settings ---
wifi.ap.config(AP_CFG)
--- Configure AP IP Address ---
wifi.ap.setip(AP_IP_CFG)

--- Configure DHCP Service ---
wifi.ap.dhcp.config(AP_DHCP_CFG)
--- Start DHCP Service ---
wifi.ap.dhcp.start()
---------------------------------------

collectgarbage();

print("Soft AP started")
print("Heep:(bytes)"..node.heap());
print("MAC:"..wifi.ap.getmac().."\r\nIP:"..wifi.ap.getip());
