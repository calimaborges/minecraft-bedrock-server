# minecraft-bedrock-server

```
docker run -p 0.0.0.0:19132:19132 ghcr.io/calimaborges/minecraft-bedrock-server/main:latest
```

## docker-compose example

```
services:
  minecraft:
    image: "ghcr.io/calimaborges/minecraft-bedrock-server/main:4d35e06fb07c87fcc822854a01ac7caf0d6a61e1"
    restart: always
    network_mode: host
    volumes:
      - ./permissions.json:/opt/minecraft/permissions.json
      - ./allowlist.json:/opt/minecraft/allowlist.json
      - ./server.properties:/opt/minecraft/server.properties
      - minecraft-data:/opt/minecraft/worlds
    stdin_open: true
    tty: true
volumes:
  minecraft-data:
```

## `allowlist.json` example

```
[{"name":"playername"},{"name":"player2name"}]
```


## `permissions.json` example

```
[
   {
      "permission" : "operator",
      "xuid" : "9999999999999999"
   },
   {
      "permission" : "operator",
      "xuid" : "9999999999999999"
   }
]

```

## `server.properties` example

```
server-name=Dedicated Server
# Used as the server name
# Allowed values: Any string without semicolon symbol.

gamemode=survival
# Sets the game mode for new players.
# Allowed values: "survival", "creative", or "adventure"

force-gamemode=false
# force-gamemode=false (or force-gamemode is not defined in the server.properties)
# prevents the server from sending to the client gamemode values other
# than the gamemode value saved by the server during world creation
# even if those values are set in server.properties after world creation.
#
# force-gamemode=true forces the server to send to the client gamemode values
# other than the gamemode value saved by the server during world creation
# if those values are set in server.properties after world creation.

difficulty=easy
# Sets the difficulty of the world.
# Allowed values: "peaceful", "easy", "normal", or "hard"

allow-cheats=false
# If true then cheats like commands can be used.
# Allowed values: "true" or "false"

max-players=10
# The maximum number of players that can play on the server.
# Allowed values: Any positive integer

online-mode=true
# If true then all connected players must be authenticated to Xbox Live.
# Clients connecting to remote (non-LAN) servers will always require Xbox Live authentication regardless of this setting.
# If the server accepts connections from the Internet, then it's highly recommended to enable online-mode.
# Allowed values: "true" or "false"

allow-list=true
# If true then all connected players must be listed in the separate allowlist.json file.
# Allowed values: "true" or "false"

server-port=19132
# Which IPv4 port the server should listen to.
# Allowed values: Integers in the range [1, 65535]

server-portv6=19133
# Which IPv6 port the server should listen to.
# Allowed values: Integers in the range [1, 65535]

enable-lan-visibility=true
# Listen and respond to clients that are looking for servers on the LAN. This will cause the server
# to bind to the default ports (19132, 19133) even when `server-port` and `server-portv6`
# have non-default values. Consider turning this off if LAN discovery is not desirable, or when
# running multiple servers on the same host may lead to port conflicts.
# Allowed values: "true" or "false"

view-distance=32
# The maximum allowed view distance in number of chunks.
# Allowed values: Positive integer equal to 5 or greater.

tick-distance=4
# The world will be ticked this many chunks away from any player.
# Allowed values: Integers in the range [4, 12]

player-idle-timeout=30
# After a player has idled for this many minutes they will be kicked. If set to 0 then players can idle indefinitely.
# Allowed values: Any non-negative integer.

max-threads=8
# Maximum number of threads the server will try to use. If set to 0 or removed then it will use as many as possible.
# Allowed values: Any positive integer.

level-name=Bedrock level
# Allowed values: Any string without semicolon symbol or symbols illegal for file name: /\n\r\t\f`?*\\<>|\":

level-seed=
# Use to randomize the world
# Allowed values: Any string

default-player-permission-level=operator
# Permission level for new players joining for the first time.
# Allowed values: "visitor", "member", "operator"

texturepack-required=false
# Force clients to use texture packs in the current world
# Allowed values: "true" or "false"

content-log-file-enabled=false
# Enables logging content errors to a file
# Allowed values: "true" or "false"

compression-threshold=1
# Determines the smallest size of raw network payload to compress
# Allowed values: 0-65535

compression-algorithm=zlib
# Determines the compression algorithm to use for networking
# Allowed values: "zlib", "snappy"

server-authoritative-movement=server-auth
# Allowed values: "client-auth", "server-auth", "server-auth-with-rewind"
# Changes the server authority on movement:
# "client-auth": Server has no authority and accepts all positions from the client.
# "server-auth": Server takes user input and simulates the Player movement but accepts the Client version if there is disagreement.
# "server-auth-with-rewind": The server will replay local user input and will push it to the Client so it can correct the position if it does not match.
#               The clients will rewind time back to the correction time, apply the correction, then replay all the player's inputs since then. This results in smoother and more frequent corrections.
player-position-acceptance-threshold=0.5
# Only used with "server-auth-with-rewind".
# This is the tolerance of discrepancies between the Client and Server Player position. This helps prevent sending corrections too frequently
# for non-cheating players in cases where the server and client have different perceptions about when a motion started. For example damage knockback or being pushed by pistons.
# The higher the number, the more tolerant the server will be before asking for a correction. Values beyond 1.0 have increased chances of allowing cheating.

player-movement-action-direction-threshold=0.85
# The amount that the player's attack direction and look direction can differ.
# Allowed values: Any value in the range of [0, 1] where 1 means that the
# direction of the players view and the direction the player is attacking
# must match exactly and a value of 0 means that the two directions can
# differ by up to and including 90 degrees.

server-authoritative-block-breaking=false
server-authoritative-block-breaking-pick-range-scalar=1.5
# If true, the server will compute block mining operations in sync with the client so it can verify that the client should be able to break blocks when it thinks it can.

chat-restriction=None
# Allowed values: "None", "Dropped", "Disabled"
# This represents the level of restriction applied to the chat for each player that joins the server.
# "None" is the default and represents regular free chat.
# "Dropped" means the chat messages are dropped and never sent to any client. Players receive a message to let them know the feature is disabled.
# "Disabled" means that unless the player is an operator, the chat UI does not even appear. No information is displayed to the player.

disable-player-interaction=false
# If true, the server will inform clients that they should ignore other players when interacting with the world. This is not server authoritative.

client-side-chunk-generation-enabled=true
# If true, the server will inform clients that they have the ability to generate visual level chunks outside of player interaction distances.

block-network-ids-are-hashes=true
# If true, the server will send hashed block network ID's instead of id's that start from 0 and go up.  These id's are stable and won't change regardless of other block changes.

disable-persona=false
# Internal Use Only

disable-custom-skins=false
# If true, disable players customized skins that were customized outside of the Minecraft store assets or in game assets.  This is used to disable possibly offensive custom skins players make.

server-build-radius-ratio=Disabled
# Allowed values: "Disabled" or any value in range [0.0, 1.0]
# If "Disabled" the server will dynamically calculate how much of the player's view it will generate, assigning the rest to the client to build.
# Otherwise from the overridden ratio tell the server how much of the player's view to generate, disregarding client hardware capability.
# Only valid if client-side-chunk-generation-enabled is enabled

allow-outbound-script-debugging=false
# Allows script debugger 'connect' command and script-debugger-auto-attach=connect mode.

allow-inbound-script-debugging=false
# Allows script debugger 'listen' command and script-debugger-auto-attach=listen mode.

#force-inbound-debug-port=19144
# Locks the inbound (listen) debugger port, if not set then default 19144 will be used. Required when using script-debugger-auto-attach=listen mode.

script-debugger-auto-attach=disabled
# Attempt to attach script debugger at level load, requires that either inbound port or connect address is set and that inbound or outbound connections are enabled.
# "disabled" will not auto attach.
# "connect" server will attempt to connect to debugger in listening mode on the specified port.
# "listen" server will listen to inbound connect attempts from debugger using connect mode on the specified port.

#script-debugger-auto-attach-connect-address=localhost:19144
# When auto attach mode is set to 'connect', use this address in the form host:port. Required for script-debugger-auto-attach=connect mode.
```
