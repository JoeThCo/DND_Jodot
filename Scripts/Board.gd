extends TileMap

func _ready() -> void:
    set_process(true)

func _input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.is_pressed():
        print_debug(mouse_to_local())
        
func mouse_to_local() -> Vector2:
    return local_to_map(to_local(get_global_mouse_position()))
