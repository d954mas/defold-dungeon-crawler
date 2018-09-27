local COMMON = require "libs.common"
local Map = COMMON.class("Minimap")

---@class MinimapCell
---@field root_node
---@field root_nodes
---@field lbl_cell
---@field x
---@field y

function Map:initialize(cell_node)
	self.node_map = {}
	self.free_cells = {}
	self.cell_node = assert(cell_node)
	self.cell_size = gui.get_size(cell_node) + vmath.vector3(2,2,0)
	gui.set_enabled(cell_node, false)
	self:set_size(5,5)
end

function Map:get_cell_id(x,y)
	return (y-1) * (self.cell_size.x+10) + x
end

function Map:set_size(w, h)
	self.width = assert(w)
	self.height = assert(h)
	if self.node_map then
		for id, node in pairs(self.node_map) do
			gui.delete_node(node)
		end
	end
	self.node_map = {}
end

---@return MinimapCell
function Map:get_free_node()
	if #self.free_cells>0 then
		return table.remove(self.free_cells)
	else
		return self:new_node()
	end
end

---@return MinimapCell
function Map:new_node()
	local root_nodes =  gui.clone_tree(self.cell_node)
	local root_node = root_nodes[hash("minimap_cell")]
	local lbl_cell = root_nodes[hash("minimap_cell/lbl_pos")]

	return {root_node = root_node,root_nodes = root_nodes, lbl_cell = lbl_cell}
end

function Map:free_cell(cell)
	gui.set_enabled(cell.root_node, false)
	table.insert(self.free_cells, cell)
end

function Map:set_position(pos)
	pos = vmath.vector3(pos.x, pos.y,0)
--	print(pos.x)
	local h_w, h_h = self.width/2, self.height/2
--	print(pos.x - h_w)
--	print(pos.x + h_w)
	local min_x, max_x = math.floor(pos.x - h_w), math.ceil(pos.x + h_w)-1
	local min_y, max_y = math.floor(pos.y - h_h), math.ceil(pos.y + h_h)

	local dx, dy = -(pos.x - h_w-min_x), -(pos.y - h_w-min_y)
--	print("X:" .. min_x .. "-" .. max_x)
	for cell_id, cell in pairs(self.node_map) do
		--update_pos
		if cell.x < min_x or cell.x > max_x or cell.y < min_y or cell.y > max_y then
			self.node_map[cell_id] = nil
			self:free_cell(cell)
		end
	end

	
	
	for y = min_y, max_y do
		for x=min_x, max_x do
			local cell_id = self:get_cell_id(x,y)
			---@type MinimapCell
			local cell
			if self.node_map[cell_id] then
				cell = self.node_map[cell_id]
			else
				cell = self:get_free_node()
				cell.x, cell.y = x, y
				gui.set_enabled(cell.root_node, true)
				gui.set_text(cell.lbl_cell, "x:" .. x .. "\ny:" .. y)
				self.node_map[cell_id] = cell
			end
			local pos_x = (x-min_x+dx) * self.cell_size.x
			local pos_y = -(self.height*self.cell_size.y -(y-min_y+dy) * self.cell_size.y)
			local cell_pos = vmath.vector3(pos_x,pos_y,0)
			gui.set_position(cell.root_node, cell_pos)
		end
	end
end


return Map