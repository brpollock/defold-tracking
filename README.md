# Tracking Defold Objects

This module keeps track of active game objects.

This allows you to iterate over all objects, or subsets.

## To use this library

1. Add this url to `Assets->game.project->Dependencies`

    - `https://github.com/brpollock/defold-tracking/archive/master.zip`

2. Then select `Project->Fetch Libraries`

## To track an object

You need to `require` this module in the object's
script and call `track()` to start tracking, and `untrack()`
to stop.

```lua
trk = require('tracking.tracking')

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

The function `get()` returns a table of tracked IDs as keys.

```lua
    local objs = trk.get()
    for id, _ in pairs(objs) do
        local pos = go.get_position(id)
        print(pos)
    end
```

## Using classes

All objects are tracked in one table, but you can also 
track 'classes' (groups) of objects separately, by specifying
a 'class' when calling `track()`.

```lua
    trk.track("enemies")
```

And you can specify a class when calling `get()`.

```lua
    local enemies = trk.get("enemies")
    local friends = trk.get("friends")
```

But note that all objects are still tracked as one list.

```lua
    local everyone = trk.get()
```


---
