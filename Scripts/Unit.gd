extends Node2D
class_name Unit

@export var Health: Health
@export var Move: Move
@export var Attack: Attack

var board: Board

func _ready() -> void:
    Health.init(10)
    Move.init(5)
    Attack.init(3)
    
func unit_setup(local: Vector2i, input_board: Board):
    position = local
    self.board = input_board
    
func _input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.is_pressed():
        Move.move_to_mouse()
