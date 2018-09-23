local MoveTo = require "world.actions.move_to"
local RotateTo = require "world.actions.rotate_to"
local Delay = require "world.actions.delay"
local M = {}


function M.move_to(model, time, position)
	return MoveTo:new(model, time, position)
end

function M.rotate_to(model, time, rotation)
	return RotateTo:new(model, time, rotation)
end

function M.delay(model, time)
	return Delay:new(model, time)
end

return M