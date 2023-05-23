extends CharacterBody2D

class_name Enemy

var gravity = 10
var is_moving_left = true
var speed = 300
var health = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_character()
	detect_turn_around()
	if health == 0:
		death()

func move_character():
	velocity.x = -speed if is_moving_left else speed
	
	if is_moving_left:
		velocity.x = -speed
	else:
		velocity.x = speed
	
	velocity.y += gravity	
	move_and_slide()
	
func detect_turn_around():
	if not $RayCast2D.is_colliding() and is_on_floor():
		is_moving_left = !is_moving_left
		scale.x = -scale.x
		print("Turn")

func death():
	queue_free()

func _on_area_2d_area_entered(area):
	if area.is_in_group("Bullet"):
		health -= 1
		print(area)
