## aria2-webui-ng

> Synology Aria2

### Batteries included

* [WebUI] (-e WEBUI=aria) https://github.com/ziahamza/webui-aria2
* [WebUI] (-e WEBUI=ariang) https://github.com/mayswind/AriaNg/
* [Trackerlist] (-e TRACKERSAUTO=NO) https://github.com/ngosang/trackerslist

| Parameter | Function |
| :----: | --- |
| `-p 4040` | http(s) gui |
| `-p 6882` | BT download listened port |
| `-p 6882/udp` | BT download DHT listened port |
| `-e PUID=1026` | for UserID - see below for explanation |
| `-e PGID=100` | for GroupID - see below for explanation |
| `-e TZ=Asia/Shanghai` | Specify a timezone to use EG Europe/London |
| `-v /data/config` | aria2 Data Config Folder. |
| `-v /data/downloads` | aria2 Data Download Folder. |
| `-v /config/keys` | SSL Key Folder. |
| `-e CUSTOM_RPC_TOKEN` | Optional. Specify custom RPC token vaule. If no set, see logs. |
| `-e SKIP_SSL=true` | Optional. Disable HTTPS |
| `-e TRACKERSAUTO=NO` | Optional. Disable Trackers Update, Defaults to YES |
| `-e WEBUI=aria` | Optional. Defaults to ariang |
| `-e CUSTOM_OVERRIDE_OPTIONS` | Optional. Pass arguments to aria2 daemon |

### Usage

Docker

```
docker create \
  --name=aria2-webui-ng \
  -p 4040:4040 \
  -p 6882:6882 \
  -p 6882:6882/udp \
  -e PUID=1026 \
  -e PGID=100 \
  -e TZ=Asia/Shanghai \
  -e CUSTOM_RPC_TOKEN=<rpc token> \
  -v </path/to/aria2_conifg>:/data/config \
  -v </path/to/aria2_downloads>:/data/downloads \
  -v </path/to/ssl>:/config/keys \
  --restart unless-stopped \
  stuarthua/aria2-webui-ng
```

Docker single

```
docker create --name=aria2-webui-ng -p 4040:4040 -p 6882:6882 -p 6882:6882/udp -e PUID=1026 -e PGID=100 -e TZ=Asia/Shanghai -e CUSTOM_RPC_TOKEN=123qwe --restart unless-stopped stuarthua/aria2-webui-ng
```

## Thanks

* [lukasmrtvy/lsiobase-aria2-webui](https://github.com/lukasmrtvy/lsiobase-aria2-webui)
* [johngong/aria2](https://registry.hub.docker.com/r/johngong/aria2/)
