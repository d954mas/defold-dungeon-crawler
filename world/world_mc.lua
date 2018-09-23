local BaseMC = require("libs.base_mc")
local M = BaseMC:subclass("WorldModelControlled")
local LOG = require "libs.log"
local TAG = "WORLD_MC"
local Sprite = require "libs.sprite"
function M:initialize(world, events)
	BaseMC.initialize(self, world, events)
end

function M:change_map(map)
	self:notify(self.events.MAP_CHANGED)
	LOG.i("change map", TAG)
	self.model.map = map
	native_raycasting.set_map(map)
end


return M