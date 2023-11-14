extends Node
class_name Move

@export var unit: Unit

signal on_move_start
signal on_move_end
signal on_tile_moved

var move_range: int = 0

func init(start_range) -> void:
    move_range = start_range
    
func Move():
    var path = unit.unit_board.get_a_star_path(unit)
    print_debug(path[0])
    print_debug(path[path.size() - 1])
