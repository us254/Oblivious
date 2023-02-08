## [Xray](https://github.com/XTLS/Xray-core/releases) [XTLS Vision](https://github.com/XTLS/Xray-core/discussions/1295) without fallbacks ) Installation Guide

1. Installer

```
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install --beta
```

2. Download configuration

```
curl -Lo /usr/local/etc/xray/config.json https://raw.githubusercontent.com/chika0801/Xray-examples/main/VLESS-TCP-XTLS-Vision/config_server.json
```

3. Upload the certificate and private key

- Rename the certificate file to `fullchain.cer`, rename the private key file to `private.key`, upload them to the `/etc/ssl/private` directory, and execute the following command.

```
chown -R nobody:nogroup /etc/ssl/private
```

4. Start the program

```
systemctl restart xray
```

```
systemctl status xray
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

| option | value |
| :--- | :--- |
| Address | IP of the VPS |
| port (prot) | 16387 |
| User ID(id) | chika |
| Flow | xtls-rprx-vision |
| transport protocol (network) | tcp |
| TLS | tls |
| SNI | The domain name included in the certificate |
| uTLS | chrome |

</details>

Tip: As long as the certificate is within the validity period, the domain name contained in the certificate does not need to be resolved to the IP of the VPS. One certificate, used on multiple VPS.

## v2rayNG configuration guide

<details><summary>Click to view</summary><br>

| option | value |
| :--- | :--- |
| Address | IP of the VPS |
| port (prot) | 16387 |
| User ID(id) | chika |
| Flow | xtls-rprx-vision |
| transport protocol (network) | tcp |
| Transport Layer Security (tls) | tls |
| SNI | The domain name included in the certificate |
| uTLS | chrome |

</details>
