extends TileMap

var aStar: AStar2D
#https://escada-games.itch.io/randungeon/devlog/261991/how-to-use-godots-astar2d-for-path-finding

func _ready() -> void:
    set_process(true)

func _input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.is_pressed():
        print_debug(mouse_to_local())
        print_debug(local_to_world(Vector2i(0,0)))
        
func mouse_to_local():
    return world_to_local(get_global_mouse_position())

func local_to_mouse():
    return local_to_world(get_global_mouse_position()) 
        
func world_to_local(vector: Vector2) -> Vector2:
    return local_to_map(to_local(vector))

func local_to_world(vector: Vector2i) -> Vector2i:
    return map_to_local(to_global(vector))
