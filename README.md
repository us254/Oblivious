## [Xray](https://github.com/XTLS/Xray-core/releases) [XTLS Vision](https://github.com/XTLS/Xray-core/discussions/1295) with fallbacks ) Installation Guide

**SSL certificate already exists**

- Rename the certificate file to `fullchain.cer`, rename the private key file to `private.key`, upload them to the `/etc/ssl/private` directory, and execute the following command.

```
chown -R nobody:nogroup /etc/ssl/private
```

- [Insufficient permissions when using certificates](https://github.com/v2fly/fhs-install-v2ray/wiki/Insufficient-permissions-when-using-certificates-zh-Hans-CN)

#### Use [acme](https://github.com/acmesh-official/acme.sh) to apply for an SSL certificate

- You need to purchase a domain name first, then add a subdomain name, and point the subdomain name to your VPS IP. Wait for 5-10 minutes for DNS resolution to take effect. You can check whether the returned IP is correct by pinging your subdomain name. After confirming that the DNS resolution takes effect, execute the following commands (execute each line in sequence). Replace `chika.example.com` with your subdomain.
- When acme uses the standalone mode to apply for/renew a certificate, it will listen to port 80. If port 80 is occupied, it will fail.
- Let's Encrypt [Rate Limits](https://letsencrypt.org/en-us/docs/rate-limits/).


```
apt install -y socat
```

```
curl https://get.acme.sh | sh
```

```
alias acme.sh=~/.acme.sh/acme.sh
```

```
acme.sh --upgrade --auto-upgrade
```

```
acme.sh --set-default-ca --server letsencrypt
```

```
acme.sh --issue -d chika.example.com --standalone --keylength ec-256
```

```
acme.sh --install-cert -d chika.example.com --ecc \
```

```
--fullchain-file /etc/ssl/private/fullchain.cer \
```

```
--key-file /etc/ssl/private/private.key
```

```
chown -R nobody:nogroup /etc/ssl/private
```

</details>

- Back up the applied SSL certificate: enter the `/etc/ssl/private` directory, and download the certificate file `fullchain.cer` and the private key file `private.key`.
- The SSL certificate is valid for 90 days, and acme automatically renews every 60 days.

1. Install [Xray](https://github.com/XTLS/Xray-core/releases)

```
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install --beta
```

2. Install [Nginx](http://nginx.org/en/linux_packages.html)

http://nginx.org/en/linux_packages.html#Ubuntu


3. Download [Configuration](https://github.com/chika0801/Xray-examples/tree/main/VLESS-TCP-XTLS-Vision)

```
curl -Lo /usr/local/etc/xray/config.json https://raw.githubusercontent.com/chika0801/Xray-examples/main/VLESS-TCP-XTLS-Vision/config_server_with_fallbacks.json && curl -Lo /etc /nginx/nginx.conf https://raw.githubusercontent.com/chika0801/Xray-examples/main/VLESS-TCP-XTLS-Vision/nginx.conf
```

4. Download [Enhanced Routing Rules File](https://github.com/Loyalsoldier/v2ray-rules-dat)

```
curl -Lo /usr/local/share/xray/geosite.dat https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat && curl -Lo /usr/local/share /xray/geoip.dat https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat
```

5. Start the program

```
systemctl daemon-reload && systemctl restart xray && systemctl restart nginx
```

```
systemctl status xray && systemctl status nginx
```

| Items | |
| :--- | :--- |
| Programs | /usr/local/bin/xray |
| Configuration | /usr/local/etc/xray/config.json |
| check | xray -test -config /usr/local/etc/xray/config.json |
| Routing rule file | /usr/local/share/xray/ |
| View logs | journalctl -u xray --output cat -e |
| Real-time log | journalctl -u xray --output cat -f |

## v2rayN 6.x configuration guide

<details><summary>Click to view</summary><br>

`server` --> `add [vless server]`

![1](https://user-images.githubusercontent.com/88967758/213372857-49306ebe-f2fc-4426-91df-fd54e096456a.jpg)

</details>

## v2rayN 5.x configuration guide

<details><summary>Click to view</summary><br>

`server` --> `add [vless server]`

![1](https://user-images.githubusercontent.com/88967758/212540248-043ab1ed-af87-4e48-87b7-895018f4a52d.jpg)

</details>

## v2rayNG configuration guide

<details><summary>Click to view</summary><br>

| option | value |
| :--- | :--- |
| address (address) | chika.example.com |
| port (prot) | 443 |
| User ID(id) | chika |
| Flow | xtls-rprx-vision |
| transport protocol (network) | tcp |
| Transport Layer Security (tls) | tls |
| SNI | leave blank |
| uTLS | chrome |

</details>

## ShadowSocksR Plus+ Configuration Guide

<details><summary>Click to view</summary><br>

| option | value |
| :--- | :--- |
| Server node type | V2Ray/
  Xray |
| V2Ray/XRay protocol | VLESS |
| server address | chika.example.com |
| port | 443 |
| Vmess/VLESS ID (UUID) | chika |
| VLESS encryption | none |
| Transport Protocol | TCP |
| Camouflage Type | None |
| TLS | Tick |
| Flow | xtls-rprx-vision |
| fingerprint forgery | chrome |
| TLS hostname | leave blank |
| TLS ALPN | leave blank |
| Allow insecure connections | Uncheck |
| Mux | Unchecked |
| Self-signed certificate | Uncheck |
| Enable auto-switching | Uncheck |
| local port | 1234 |

</details>

## PassWall Configuration Guide

<details><summary>Click to view</summary><br>

| option | value |
| :--- | :--- |
| Type | Xray |
| Transport Protocol | VLESS |
| address (support domain name) | chika.example.com |
| port | 443 |
| encryption method | none |
| ID | chika |
| TLS | Tick |
| flow | xtls-rprx-vision |
| alpn | default |
| Domain Name | Leave Blank |
| Allow insecure connections | Uncheck |
| fingerprint forgery | chrome |
| Transport Protocol | TCP |
| camouflage type | none |
| Mux | Unchecked |

</details>
