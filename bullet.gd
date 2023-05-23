extends CharacterBody2D

class_name bullet
signal bullet

var speed = 3000

func _physics_process(_delta):
	var _collision_info = move_and_collide(velocity.normalized() * _delta * speed)
	
func _on_area_2d_area_entered(area):
	queue_free()
