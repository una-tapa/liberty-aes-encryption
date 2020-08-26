echo "Removing keystore.xml so we can try aes encryption" 
rm -f /opt/ibm/wlp/usr/servers/defaultServer/configDropins/defaults/keystore.xml
echo "starting default server"
/opt/ibm/wlp/bin/server start defaultServer
echo "Server started. Checking  /logs directory to see keystores are opened fine"
echo "grep LTPA /logs/messages.log"
echo "grep key.p12 /logs/messages.log"


