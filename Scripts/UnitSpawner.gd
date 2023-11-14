extends Node
class_name UnitSpawner

@export var board: Board
 
@onready var unit: PackedScene = load('res://Scenes/Unit.tscn')
signal on_unit_spawned

func _ready() -> void:
    spawn_a_unit(0, 0)

func spawn_a_unit(x: int, y: int):
    var new_unit = unit.instantiate()
    new_unit.unit_setup(board.local_to_world(Vector2i(x,y)), board)
    add_child(new_unit)
    on_unit_spawned.emit()
