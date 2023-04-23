Mutual TLS authentication
==========================

iPXE supports certificate based authentication

## Add Certfificates ##

File: `build.conf`

```
IPXE_OPT="TRUST=/crt/ca.crt CERT=/crt/ca.crt,/crt/client.crt PRIVKEY=/crt/client.key"
```


## Debugging ##

File: `build.conf`

```
IPXE_OPT="DEBUG=tls,x509,validator"
```