extends Node

@onready var unit: PackedScene = load('res://Scenes/Unit.tscn')

func _ready() -> void:
    spawn_a_unit(Vector2i(0,0))
    
func spawn_a_unit(position: Vector2i):
    var new_unit = unit.instantiate()
    new_unit.position = $Board.local_to_world(Vector2i(0,0))
    
    add_child(new_unit)
