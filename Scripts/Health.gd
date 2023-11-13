extends Node
class_name Health

signal on_death

signal on_damage
signal on_heal

var health:int  = 0
var maxHealth:int

func init(start_health) -> void:
    health = start_health
    maxHealth = start_health
    print_debug(health)

#changes units health and calls signals
func change_health(change: int):
    health += change
    type_of_change(change)
    
    if(health <= 0):
        on_death.emit()


#heal or damage
func type_of_change(change: int):
    if change == 0: return
    if change < 0:
        on_damage.emit()
    elif change > 0:
        on_heal.emit()
