```lua
-- server.lua

local bridge = exports['luman-bridge']

bridge:getCharacterName(playerId)

bridge:hasItem(playerId, item, amount)

bridge:takeItem(playerId, item, amount)

bridge:giveItem(playerId, item, amount)

bridge:hasMoney(playerId, amount)

bridge:takeMoney(playerId, amount)

bridge:giveMoney(playerId, amount)

bridge:showNotification(playerId, message)

```

```lua
-- client.lua

local bridge = exports['luman-bridge']

bridge:showNotification(message)
```
