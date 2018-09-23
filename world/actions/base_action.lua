local CLASS = require "libs.middleclass"

local M = CLASS("BaseMC")
local LUME = require "libs.lume"
function M:initialize(model, time)
	self.model = model
	self.time = time
	self.current_time = 0
	self.done = false
	self.last_update = false
end

function M:act(percent)
end	

function M:update(dt)
	if self.done then return end
	self.current_time = self.current_time + dt
	local percent = LUME.clamp(self.current_time/self.time, 0, 1)
	self.act(self, percent)
	if percent == 1 then
		self.done = true	
	end
end	

return M