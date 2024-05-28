# minecraft-bedrock-server

```
docker run -p 0.0.0.0:19132:19132 ghcr.io/calimaborges/minecraft-bedrock-server/main:cab6ea281e6e4af3376b2b1a16ccae681688ee97
```

## docker-compose example

```
services:
  minecraft:
    image: "ghcr.io/calimaborges/minecraft-bedrock-server/main:3b1d2206cc57deefe6345e14191de927a5d3e573"
    network_mode: host
    ports:
      - "19132:19132"
    volumes:
      - ./permissions.json:/opt/minecraft/permissions.json
      - ./server.properties:/opt/minecraft/server.properties
      - minecraft-data:/opt/minecraft/worlds
    stdin_open: true
    tty: true
volumes:
  minecraft-data:
```
