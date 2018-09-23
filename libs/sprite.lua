local M = {}
local TEXTURES = require "libs.textures"
M.__index = M

M.angles = {
	floor = vmath.quat_rotation_x(math.rad(90)),
	ceil = vmath.quat_rotation_x(math.rad(270)),
	north = vmath.quat_rotation_x(math.rad(0)),
	south = vmath.quat_rotation_x(math.rad(0)),
	east = vmath.quat_rotation_y(math.rad(90)),
	west = vmath.quat_rotation_y(math.rad(90)),
}


function M.new(position,width,height, angle,texture_id)
	local self = setmetatable({}, M)
	assert(position, "position can't be nil")
	assert(width, "position can't be nil")
	assert(height, "position can't be nil")
	assert(type(angle) == "string" or type(angle) == "userdata", "must be string or quat")
	local angle_quat = angle
	if(angle == "player") then
		angle_quat = M.angles["north"]
		self.player_angle = true
	elseif(type(angle) == "string") then 
		angle_quat = M.angles[angle]
		assert(angle_quat, "unknown angle:" .. angle)
	end	
	assert(texture_id,"texture_id can't be nil")
	local texture = TEXTURES[texture_id]
	assert(texture, "no texture for id:" .. texture_id)
	self.position = position
	self.width = width
	self.height = height
	self.angle = angle_quat
	self.texture = texture
	return self
end

return M
		