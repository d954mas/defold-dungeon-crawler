local M = {}

M.objs = {}

local id = 0

function M.add_dynamics(sprite)
	assert(sprite, "sprite can't be nil")
	id = id + 1
	M.objs[id] = {sprite_url = nil, sprite = sprite}
	return id
end	

function M.delete(id)
	assert(M.objs[id], "no obj with id:" .. id)
	M.objs[id].need_delete = true
end

function M.clear()
	M.objs = {}
	id = 0
end	



return M