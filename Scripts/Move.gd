extends Node
class_name Move

signal on_move_start
signal on_move_end

signal on_tile_moved


var move_range: int = 0

func init(start_range) -> void:
    move_range = start_range
    
func Move():
    pass
