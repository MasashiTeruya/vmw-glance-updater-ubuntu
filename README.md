# vmw-glance-updater-ubuntu
Upload the lastest ubuntu cloud image to VMware based OpenStack cloud.
## How to run?
### Run on bash
Before run this script, make sure OpenStack environment variables such as OS_USERNAME are set and the account has privilege to upload an image to glance.
```
git clone https://github.com/MasashiTeruya/vmw-glance-updater-ubuntu.git
cd vmw-glance-updater-ubuntu
./run.sh
```
### Run on Docker
Public docker image is available on DockerHub.
```
docker run \
-e OS_AUTH_URL=<OS_AUTH_URL> \
-e OS_PROJECT_ID=<OS_PROJECT_ID> \
-e OS_PROJECT_NAME=<OS_PROJECT_NAME> \
-e OS_USER_DOMAIN_NAME=<OS_USER_DOMAIN_NAME> \
-e OS_PROJECT_DOMAIN_ID=<OS_PROJECT_DOMAIN_ID> \
-e OS_USERNAME=<OS_USERNAME> \
-e OS_PASSWORD=<OS_PASSWORD> \
-e OS_REGION_NAME=<OS_REGION_NAME> \
-e OS_INTERFACE=public \
-e OS_IDENTITY_API_VERSION=3 \
teruya/vmw-glance-updater-ubuntu
```

## Build custom image with your CA certificate
In case you have internal CA for your VMware based OpenStack, you can include your CA certificate and build your own image.
As vmw-glance-updater-ubuntu is based on ubuntu image, run update-ca-certificates command.
### Dockerfile
```
FROM teruya/vmw-glance-updater-ubuntu
COPY custom-ca-certificate.pem /usr/local/share/ca-certificates/custom-ca-certificate.crt
RUN update-ca-certificates
```
