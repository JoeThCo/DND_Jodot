extends Node
class_name Move

@export var unit: Unit
@export var moveTimer: Timer

signal on_move_start
signal on_move_end
signal on_tile_moved

var move_range: int = 0

func init(start_range) -> void:
    move_range = start_range
      
func move_to_mouse():
    var path: PackedVector2Array = unit.board.get_a_star_path(unit)
    
    on_move_start.emit()
    for coord in path:
        unit.position = unit.board.local_to_world(coord)
        moveTimer.start()
        await moveTimer.timeout
        on_tile_moved.emit()
        
    on_move_end.emit()
