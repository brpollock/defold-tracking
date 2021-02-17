# Tracking Defold Objects

This module keeps track of active game objects.

## To track an object

You need to `require` this module in the object's
script and call `track()` to start tracking, and `untrack()`
to stop.

```lua
trk = require('main.tracking')

local function init(self)
    trk.track()
    -- ...
end

local function final(self)
    trk.untrack()
    -- ...
end

```
## To iterate over tracked objects

`get()` returns a table of tracked IDs as keys.

```lua
    local objs = trk.get()
    for id, _ in pairs(objs) do
        local pos = go.get_position(id)
        print(pos)
    end
```

## Using classes

All objects are tracked in one table.

You can, also track 'classes' (groups) of objects
separately, by specifying a 'class' when calling `track()`.

```lua
    trk.track("enemy")
```

And you can specify a class when calling `get()`.

```lua
    local enemies = trk.get("enemy")
    local friends = trk.get("friends")
```

But, note that all objects are still tracked as one list.

```lua
    local everypone = trk.get()
```




---
