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
M.CELLS = {}
for y=1, M.HEIGHT do
	M.CELLS[y] = {}
	for x=1,M.WIDTH do
		local wall_id =  M.MAP[y][x]
		local cell = {north={}, east={}, west={}, south={}, sprites={}}
		table.insert(cell.other, Sprite.new(vmath.vector3(x-0.5,y-0.5,0),1,1, "floor", "wall1"))	
	--	table.insert(cell.sprites, Sprite.new(vmath.vector3(x-0.5,y-0.5,1),1,1, "ceil", "wall1"))		
		if wall_id~=0 then
			local texture_id = "wall" .. wall_id
			table.insert(cell.north, Sprite.new(vmath.vector3(x-0.5,y,0.5),1,1, "north", texture_id))
			table.insert(cell.south, Sprite.new(vmath.vector3(x-0.5,y-1,0.5),1,1, "south", texture_id))
			table.insert(cell.west, Sprite.new(vmath.vector3(x,y-0.5,0.5),1,1, "west", texture_id))
			table.insert(cell.east, Sprite.new(vmath.vector3(x-1,y-0.5,0.5),1,1, "east", texture_id))
			table.insert(cell.other, Sprite.new(vmath.vector3(x-0.5,y-0.5,1),1,1, "ceil", texture_id))
			--add roof
			table.insert(cell.north, Sprite.new(vmath.vector3(x-0.5,y,0.5),1,1, "north", texture_id))
		end	
		M.CELLS[y][x] = cell
	end	
end	
--NORTH EAST SOUTH WEST FLOORS CEILS STATIC_SPRITES
--NORTH = {SPRITES(x, y, width, height, texture) ... rotation = 1 or -1; enabled = true, need_destroy = false;


return M