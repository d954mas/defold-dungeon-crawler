local BaseAction = require("world.actions.base_action")
local M = BaseAction:subclass("RotateToAction")

function M:initialize(model, time, rotate_to)
	BaseAction.initialize(self, model, time)
	self.rotate_to = rotate_to
	self.start_rotation  = self.model.angle
	self.delta_rotation = self.rotate_to - self.start_rotation
end

function M:act(percent)
	self.model.angle = self.start_rotation + percent * self.delta_rotation
end	

return M