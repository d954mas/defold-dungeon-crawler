local PLAYER = require "world.player"
local WorldMc = require "world.world_mc"
local LOG = require "libs.log"
local M = {}

M.EVENTS = {
	MAP_CHANGED=hash("WORLD_map_changed"),
}
M.mc = WorldMc:new(M, M.EVENTS)
M.map = nil
M.PLAYER = PLAYER

function M.is_blocked(x, y)
	local cell = M.get_cell_save(x,y)
	if cell then return cell.blocked else return true end
end	

function M.can_move(x, y)
	local cell =M.get_cell_save(x,y)
	--[[	for _, obj in pairs(DYNAMICS_OBJ.objs) do
			if x == math.ceil(obj.sprite.position.x) and y == math.ceil(obj.sprite.position.y) then
				return false
			end		
		end	--]]
	if cell then return not cell.blocked else return false end
end

function M.get_cell_save(x,y)
	x = math.ceil(x)
	y = math.ceil(y)
	if x > 0 and x <= M.map.WIDTH and y>0 and y<= M.map.HEIGHT then
		return M.map.CELLS[y][x]
	else
		return nil
	end
end

function M.update(dt)
	local move = vmath.vector3(-1,0,0)
	--for _,enemy in ipairs(DYNAMICS_OBJ.objs) do
		--enemy.sprite.position = enemy.sprite.position + move * 0.5 * dt
--	end
	if(PLAYER.action ~= nil) then
		PLAYER.action:update(dt)
	end	
	if PLAYER.action ~= nil and PLAYER.action.done then
		PLAYER.action = nil
	end



	go.set_position(vmath.vector3(PLAYER.position.x,0.5,-PLAYER.position.y),"/player")
	go.set_rotation(vmath.quat_rotation_y(-PLAYER.angle),"/player")
end


return M