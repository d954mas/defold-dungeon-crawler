local COMMON = require "libs.common"
local M = COMMON.class("Dynamic_objects")

function M:initialize()
	self.objs = {}
	self.id = 1
end

function M:add_dynamics(sprite)
	assert(sprite, "sprite can't be nil")
	self.id = self.id + 1
	self.objs[self.id] = {sprite_url = nil, sprite = sprite}
	return self.id
end	

function M:delete(id)
	assert(M.objs[id], "no obj with id:" .. id)
	self.objs[id].need_delete = true
end

function M:clear()
	self.objs = {}
	self.id  = 0
end	



return M