local BaseMC = require("libs.base_mc")

local LOG = require "libs.log"
local TAG = "WORLD_MC"
local Sprite = require "libs.sprite"

---@class WorldMc
---@field model World
local M = BaseMC:subclass("WorldModelControlled")
function M:initialize(world, events)
	BaseMC.initialize(self, world, events)
end

function M:change_map(map)
	self:notify(self.events.MAP_CHANGED)
	LOG.i("change map", TAG)
	self.model.map = map
	native_raycasting.set_map(map)
	self.model.DYNAMICS_OBJS.clear()
	for _,orc in ipairs(map.ENEMIES) do
		local cell = map.CELLS[orc.y][orc.x]
		local width = 1
		local height = width * 1
		self.model.DYNAMICS_OBJS.add_dynamics(Sprite.new(vmath.vector3(orc.x-0.5,orc.y-0.5,height/2),width,height, "player", "orc"))
	end
end


return M