extends Node2D

const PLAYER = 'res://player.tscn'
const BADDIE = 'res://baddie.tscn'

func _ready() -> void:
    spawn_player()
    spawn_baddie(Vector2.ONE)
       
func spawn_player():
    var player_scene = load(PLAYER)
    var player: Node2D = player_scene.instantiate()
    player.global_position = Vector2.ZERO 
    add_child(player)
    
func spawn_baddie(baddie_position):
    var baddie_scene = load(BADDIE)
    var baddie: Node2D = baddie_scene.instantiate()
    baddie.global_position = baddie_position * 8
    add_child(baddie)
