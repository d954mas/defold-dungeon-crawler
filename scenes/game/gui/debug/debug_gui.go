components {
  id: "debug_game_gui"
  component: "/scenes/game/gui/debug/debug_game_gui.gui"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
components {
  id: "debug_gui"
  component: "/scenes/game/gui/debug/debug_gui.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "debug_fov_map_sprite"
  type: "sprite"
  data: "tile_set: \"/scenes/game/gui/debug/debug_fov_map.atlas\"\n"
  "default_animation: \"empty\"\n"
  "material: \"/resizer/assets/sprite_nearest.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
  position {
    x: 1398.0
    y: 936.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
