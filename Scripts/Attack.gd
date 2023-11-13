extends Node
class_name Attack

signal on_attack

var attack: int

func init(start_attack:int) -> void:
    attack = start_attack
    
func attack_unit(other_health: Health):
    other_health.change_health(attack)
    on_attack.emit()
