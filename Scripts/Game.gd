extends Node

var turn: int = 0
signal on_new_turn

@export var game_board: Board

func _ready() -> void:
    game_setup()
    game_board.board_setup()
    $Camera2D.position = game_board.get_camera_position()

func game_setup():
    pass

func new_turn():
    turn += 1
    on_new_turn.emit()
