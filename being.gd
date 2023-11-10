extends RigidBody2D

class_name Being

signal on_dead 

var health: int

func changeHealth(change: int):
    health += change
    
    if(health <= 0):
        on_dead.emit()
