
# Create JKS truststore
./create-trustore.sh cacerts.pem mystorepassword

# Create JKS keystore
./create-keystore.sh kafka-server.pem kafka-server-key.pem mystorepassword

#Convert the JKS file to base64 format using the following command
openssl base64 -A -in truststore.jks > truststore-jks-base64

#Upload the file in base64 format to AKV
az keyvault secret set --vault-name "akv-name" \
--name "truststore-jks" --file "truststore-jks-base64"
