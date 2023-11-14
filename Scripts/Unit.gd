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
    
func unit_setup(world: Vector2i, board: Board):
    position = world
    self.board = board
