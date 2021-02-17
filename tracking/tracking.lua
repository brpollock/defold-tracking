-- Keep track of Defold object IDs
-- https://bitbucket.org/brpollock/deftracking/

local M = {}

local ids = {}
local classes = {}

function M.dump()
	print("IDs ---")
	for inst, cla in pairs(ids) do
		print(" " .. inst, cla or "-")
	end
	print("classes  ----")
	for cla, tab in pairs(classes) do
		print(" " .. cla)
		for ins in pairs(tab) do
			print("  " .. ins)
		end
	end
	print("==============")
end

function M.reset()
	-- Clear all tracking lists.
	ids = {}
	classes = {}
end

function M.get(cla)
	-- Get all tracked IDs OR all tracked IDs of specifed classes.
	if cla then
		return classes[cla] or {}
	else
		return ids
	end
end

function M.track(optional_class)
	-- Add caller's ID to list of tracked IDs.
	-- If an optional_class is specified, the ID will 
	-- also be added to that class's tracking list.
	local cla = optional_class or false
	local caller_id = go.get_id()
	ids[caller_id] = cla
	if cla then
		classes[cla] = M.get(cla)
		classes[cla][caller_id] = false
	end
end

function M.untrack()
	-- Stop tracking the caller.
	-- Its ID is removed from both the main tracking list
	-- and (if necessary) from its class's tracking list.
	local caller_id = go.get_id()
	local cla = ids[caller_id]
	ids[caller_id] = nil
	if classes[cla] then
		classes[cla][caller_id] = nil
	end
end


return M
