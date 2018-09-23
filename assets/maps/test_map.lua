local M = {}
local Sprite = require "libs.sprite"
M.WIDTH = 24
M.HEIGHT = 24
M.MAP = {
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,2,1,2,1,1,1,1},
	{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,0,0,0,0,2,2,2,2,2,0,0,0,0,3,0,3,0,3,0,0,0,1},
	{1,0,0,0,0,0,2,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,0,0,0,0,2,0,0,0,2,0,0,0,0,3,0,0,0,3,0,0,0,1},
	{1,0,0,0,0,0,2,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,0,0,0,0,2,2,0,2,2,0,0,0,0,3,0,3,0,3,0,0,0,1},
	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,4,4,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,4,0,4,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,4,0,0,0,0,4,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,4,0,4,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,4,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,1},
	{1,4,4,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,2,1,1,1,2,1,1,1,1}
}

local trees = {{x=5, y=5},{x=20, y=21},{x=18, y=21}}
M.ENEMIES = {{x=16, y=16}}
local signs = {{x=17, y=16}}
local signs_walls = {{x=19, y=22, side = 1},{x=19, y=22, side = 2},{x=19, y=22, side = 3},{x=19, y=22, side = 4}}
M.CELLS = {}
for y=1, M.HEIGHT do
	M.CELLS[y] = {}
	for x=1,M.WIDTH do
		local wall_id =  M.MAP[y][x]
		local cell = {north={}, east={}, west={}, south={}, other={}, enemies = {}, blocked = false}
		M.CELLS[y][x] = cell
	end	
end
--add floors 
for y=1, M.HEIGHT do
	for x=1,M.WIDTH do
		local cell = M.CELLS[y][x]
		table.insert(cell.other, Sprite.new(vmath.vector3(x-0.5,y-0.5,0),1,1, "floor", "grass"))	
	end	
end
--add trees
for _,tree in ipairs(trees) do
	local cell = M.CELLS[tree.y][tree.x]
	local width = 1
	local height = width * 1.1940298
	cell.blocked = true
	--table.insert(cell.other, Sprite.new(vmath.vector3(tree.x-0.5,tree.y-0.5,height/2),width,height, "player", "tree"))
end	

for _,sign in ipairs(signs) do
	local cell = M.CELLS[sign.y][sign.x]
	local height = 0.5
	local width = height * 1
	cell.blocked = true
--	table.insert(cell.other, Sprite.new(vmath.vector3(sign.x-0.5,sign.y-0.5,height/2),width,height, "player", "sign"))
end

for _,sign in ipairs(signs_walls) do
	local cell = M.CELLS[sign.y][sign.x]
	local height = 0.3
	local width = height * 1.7058823
	cell.blocked = true
	if sign.side == 1 then
	--	table.insert(cell.north, Sprite.new(vmath.vector3(sign.x-0.5,sign.y+0.005,0.5),width,height, "north", "sign_wall"))
	elseif sign.side  == 2 then
		--table.insert(cell.east, Sprite.new(vmath.vector3(sign.x + 0.005,sign.y-0.5,0.5),width,height, "east", "sign_wall"))
	elseif sign.side == 3 then
		table.insert(cell.south, Sprite.new(vmath.vector3(sign.x-0.5,sign.y-1 -0.005,0.5),width,height, "south", "sign_wall"))
	elseif sign.side == 4 then
		table.insert(cell.west, Sprite.new(vmath.vector3(sign.x -1 - 0.005,sign.y-0.5,0.5),width,height, "west", "sign_wall"))
	else
		assert(true, "unknown side:" .. sign.side)
	end		
end	


--add walls
for y=1, M.HEIGHT do
	for x=1,M.WIDTH do
		local wall_id =  M.MAP[y][x]
		local cell = M.CELLS[y][x]
		if wall_id~=0 then
			local texture_id = "wall" .. wall_id
			table.insert(cell.north, Sprite.new(vmath.vector3(x-0.5,y,0.5),1,1, "north", texture_id))
			table.insert(cell.south, Sprite.new(vmath.vector3(x-0.5,y-1,0.5),1,1, "south", texture_id))
			table.insert(cell.east, Sprite.new(vmath.vector3(x,y-0.5,0.5),1,1, "east", texture_id))
			table.insert(cell.west, Sprite.new(vmath.vector3(x-1,y-0.5,0.5),1,1, "west", texture_id))
			table.insert(cell.other, Sprite.new(vmath.vector3(x-0.5,y-0.5,1),1,1, "ceil", texture_id))
			--add roof
			cell.blocked = true
		end	
		M.CELLS[y][x] = cell
	end	
end	

--NORTH EAST SOUTH WEST FLOORS CEILS STATIC_SPRITES
--NORTH = {SPRITES(x, y, width, height, texture) ... rotation = 1 or -1; enabled = true, need_destroy = false;


return M