# Demo - Using AES encryption with wlp.password.encryption.key property 

## Building the docker image, and starting the container
```
$ docker build -t dbcs . 
$ docker run -it -p 9043:9043 -p 9080:9080 aes
```
## On the container, run the test.sh

```
root@0e314576208c:/# ./test.sh
Removing keystore.xml so we can try aes encryption
starting default server

Starting server defaultServer.
Server defaultServer started with process ID 42.
Server started. Checking  /logs directory to see keystores are opened fine
```
## Confirm LTPA keyfile was opened successfully using the aes encrypted password
```
root@bb63618a2c5b:/# grep LTPA /logs/messages.log
[8/26/20 1:37:43:346 GMT] 00000038 com.ibm.ws.security.token.ltpa.internal.LTPAKeyInfoManager   I CWWKS4103I: Creating the LTPA keys. This may take a few seconds.
[8/26/20 1:37:43:571 GMT] 00000038 com.ibm.ws.security.token.ltpa.internal.LTPAKeyInfoManager   A CWWKS4104A: LTPA keys created in 0.225 seconds. LTPA key file: /opt/ibm/wlp/output/defaultServer/resources/security/ltpa.keys
[8/26/20 1:37:43:573 GMT] 00000038 com.ibm.ws.security.token.ltpa.internal.LTPAKeyCreateTask    I CWWKS4105I: LTPA configuration is ready after 0.689 seconds.
```
## Confirm key.p12 file was opened successfully using the aes encrypted password
```
root@bb63618a2c5b:/# grep key.p12 /logs/messages.log
[8/26/20 1:37:45:459 GMT] 0000002b com.ibm.ws.ssl.config.WSKeyStore                             A CWPKI0803A: SSL certificate created in 2.108 seconds. SSL key file: /opt/ibm/wlp/output/defaultServer/resources/security/key.p12
[8/26/20 1:37:45:459 GMT] 0000002b com.ibm.ws.ssl.config.WSKeyStore                             I Successfully loaded default keystore: /opt/ibm/wlp/output/defaultServer/resources/security/key.p12 of type: PKCS12
```
## Reference

https://www.ibm.com/support/knowledgecenter/SS7K4U_liberty/com.ibm.websphere.wlp.zseries.doc/ae/cwlp_pwd_encrypt.html
