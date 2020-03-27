## docker-aria2

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
| `-e PUID=1000` | for UserID - see below for explanation |
| `-e PGID=1000` | for GroupID - see below for explanation |
| `-e TZ=Asia/Shanghai` | Specify a timezone to use EG Europe/London |
| `-v /data` | aria2 Data. |
| `-v /config/ssl` | SSL Key Folder. |
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
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Shanghai \
  -p 4040:4040 \
  -p 6882:6882 \
  -p 6882:6882/udp \
  -v </path/to/appdata>:/data \
  -v </path/to/ssl>:/config/ssl \
  -e WEBUI=aria \
  --restart unless-stopped \
  stuarthua/aria2-webui-ng

# simple
docker create --name=aria2-webui-ng -e TZ=Asia/Shanghai -p 4040:4040 -e -e CUSTOM_RPC_TOKEN=3zr9LT3jg+MyECIfrS1xYhSp1/xjeZPh123nE9sfYVs= --restart unless-stopped lsaria2
```

## Thanks

* [lukasmrtvy/lsiobase-aria2-webui](https://github.com/lukasmrtvy/lsiobase-aria2-webui)
* [johngong/aria2](https://registry.hub.docker.com/r/johngong/aria2/)
