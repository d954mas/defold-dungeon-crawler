local BaseAction = require("world.actions.base_action")
local M = BaseAction:subclass("MoveToAction")

function M:initialize(model, time, move_to_position)
	BaseAction.initialize(self, model, time)
	self.move_to_position = move_to_position
	self.start_position = self.model.position
	self.delta_move = self.move_to_position - self.start_position
end

function M:act(percent)
	self.model.position = self.start_position + percent * self.delta_move
end	

return M