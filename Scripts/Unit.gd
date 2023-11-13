extends Node2D
class_name Unit

func _ready() -> void:
    $Health.init(10)
    $Move.init(4)
    $Attack.init(3)
