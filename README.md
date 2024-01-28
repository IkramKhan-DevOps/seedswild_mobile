# How to Run

## Hot To Run First Time
1. Download java
2. You must have keytool in java/jdk/bin/
3. go inside bin folder run this command - and add all required details ".."
````bash
keytool -importkeystore -srckeystore C:\debug.keystore -destkeystore C:\debug.keystore -deststoretype pkcs12
````
1. 
2. Open Google Cloud > Credentials > Visit your app.
3. Add SHA1 from your generate jks file by using this command to your google app
````bash
.\keytool -keystore C:\debug.keystore -list -v
````

1. Create a file name "key.properties" in android dir (different for IOS)
2. place the given details
3. 
````properties
storeFile=C:\\debug.keystore
storePassword=markmark
keyPassword=markmark
keyAlias=debug
````

````bash

flutter pub get
flutter run

````

