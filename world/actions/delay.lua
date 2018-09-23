local BaseAction = require("libs.world.actions.base_action")
local M = BaseAction:subclass("MoveToAction")

function M:initialize(model, time)
	BaseAction.initialize(self, model, time)
end

return M