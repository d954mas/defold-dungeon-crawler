local ProxyScene = require "Jester.proxy_scene"
local Scene = ProxyScene:subclass("LogoScene")
local WORLD = require "world.world"
local PLAYER = WORLD.PLAYER
local ACTIONS = require "world.actions.actions"
local COMMON = require "libs.common"
local rendercam = require "rendercam.rendercam"

--region input
local move_up = vmath.vector3(0,1,0)
local move_down = vmath.vector3(0,-1,0)
local move_left = vmath.vector3(-1,0,0)
local move_right = vmath.vector3(1,0,0)

local function move_if_can(move_vector)
    local move = PLAYER.position + vmath.rotate(vmath.quat_rotation_z(-PLAYER.angle), move_vector)
    if WORLD.can_move(move.x, move.y) and not PLAYER.action then
        PLAYER.action = ACTIONS.move_to(PLAYER, 0.3, move)
    end
end

local function up(self)
    move_if_can(move_up)
end

local function down(self)
    move_if_can(move_down)
end

local function left(self)
    move_if_can(move_left)
end

local function right(self)
    move_if_can(move_right)
end

local rot = math.pi/2
local function rotate_if_can(rotation)
    if not PLAYER.action then
        PLAYER.action = ACTIONS.rotate_to(PLAYER, 0.3, rotation)
    end
end

local function rotate_left(self)
    rotate_if_can(PLAYER.angle - rot)
end

local function rotate_right(self)
    rotate_if_can(PLAYER.angle + rot)
end


function Scene:init_input()
    COMMON.input_acquire()
    self.input_receiver = COMMON.INPUT()
    self.input_receiver:add("up", up, true, true)
    self.input_receiver:add("down", down, true, true)
    self.input_receiver:add("left", left, true, true)
    self.input_receiver:add("right", right, true, true)
    self.input_receiver:add("rotate_left", rotate_left, true, true)
    self.input_receiver:add("rotate_right", rotate_right, true, true)
end
--endregion

function Scene:initialize()
    ProxyScene.initialize(self, "GameScene", "/game#proxy", "game:/scene_controller")
end

function Scene:init_camera()
    --todo use 2 rays
    native_raycasting.set_camera_rays(256)
    native_raycasting.set_camera_max_dist(50)
    native_raycasting.set_camera_fov(1.88)
end

function Scene:on_show(input)
    self:init_camera()
    local MAP = require "assets.maps.test_map"
    WORLD.mc:change_map(MAP)
end



function Scene:init(go_self)
    self:init_input()
end

function Scene:final(go_self)
    COMMON.input_release()
end

function Scene:update(go_self, dt)
    WORLD.update(dt)
end

function Scene:show_out(co)
end

function Scene:on_input(go_self, action_id, action, sender)
   self.input_receiver:on_input(go_self,action_id,action,sender)
end    
return Scene