local SceneManager = require "Jester.scene_stack"

local M = {}
M.MANAGER = SceneManager()

function M.register(scenes)
	M.MANAGER:register(scenes)
end

function M.show(name, input, options)
	M.MANAGER:show(name, input, options)
end

function M.popup(name, input, options)
	M.MANAGER:popup(name, input, options)
end

function M.back()
	M.MANAGER:back()
end

function M.reload()
	M.MANAGER:reload()
end

function M.get_scene_by_name(name)
	return M.MANAGER:get_scene_by_name(name)
end

return M