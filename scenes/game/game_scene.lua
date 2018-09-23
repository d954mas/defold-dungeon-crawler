local ProxyScene = require "Jester.proxy_scene"
local Scene = ProxyScene:subclass("LogoScene")
local WORLD = require "world.world"
local COMMON = require "libs.common"
local rendercam = require "rendercam.rendercam"
--- Constructor
-- @param name Name of scene.Must be unique
function Scene:initialize()
    ProxyScene.initialize(self, "GameScene", "/game#proxy", "game:/scene_controller")
end

function Scene:init_camera()
    native_raycasting.set_camera_rays(320)
    native_raycasting.set_camera_max_dist(20)
    native_raycasting.set_camera_fov(1.88)
end

function Scene:on_show(input)
    self:init_camera()
    local MAP = require "assets.maps.test_map"
    WORLD.mc:change_map(MAP)
end

function Scene:init(go_self)
    COMMON.input_acquire()
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
    print("on input")
    if action_id == hash("up") and action.pressed then
        go.set_position( go.get_position("/camera")+vmath.vector3(0,0,-1), "/camera")
    end
    if action_id == hash("down") and action.pressed then
        go.set_position( go.get_position("/camera")+vmath.vector3(0,0,1), "/camera")
    end
    if action_id == hash("left") and action.pressed then
        go.set_position( go.get_position("/camera")+vmath.vector3(-1,0,0), "/camera")
    end
    if action_id == hash("right") and action.pressed then
        go.set_position( go.get_position("/camera")+vmath.vector3(1,0,0), "/camera")
    end
end    
return Scene