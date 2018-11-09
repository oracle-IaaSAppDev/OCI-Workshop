#Get Terraform
# update the terraform binary to 0.11.8
version=terraform_0.11.8_linux_amd64.zip
wget "https://releases.hashicorp.com/terraform/0.11.8/$version"

# installing the terraform binary into /usr/local/bin so it can referenced by bas
sudo unzip $version -d /usr/local/bin
rm $version

# With the recent terraform oci provider you no longer
# need to manually install the provider
# when you do 
# $ terraform init
# terraform will automatically install the terraform oci provider

# Get all necessary keys
# Generate the API Key and the SSH Keys
mkdir userdata/keys
openssl genrsa -out userdata/keys/APIkey.pem 2048
openssl rsa -pubout -in userdata/keys/APIkey.pem -out userdata/keys/APIkey_public.txt
ssh-keygen -t rsa -N "" -C "rsa-key-MEAN" -f userdata/keys/rsa-key-MEAN.ssh
