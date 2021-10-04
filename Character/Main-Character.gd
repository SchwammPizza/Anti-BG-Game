class_name MainCharacter

extends KinematicBody2D

const max_speed = 400;
var velocity = Vector2(0, 0);

func _physics_process(delta):
	velocity = move_and_slide(velocity)
	
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -max_speed;
	
	elif Input.is_action_just_pressed("ui_down"):
		velocity.y = max_speed;
	
	if not (Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_up")):
		velocity.x = 0
	
	if Input.is_action_just_pressed("ui_left"):
		velocity.x = -max_speed;
	
	elif Input.is_action_just_pressed("ui_right"):
		velocity.x = max_speed;
	
	if not (Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right")):
		velocity.x = 0
	
	if velocity.length() > max_speed:
		if abs(velocity.y) > max_speed:
			velocity.y = max_speed*sign(velocity.y)
		
		elif abs(velocity.x) > max_speed:
			velocity.x = max_speed*sign(velocity.x)
		
		else:
			velocity = Vector2(max_speed/sqrt(2)*sign(velocity.x), max_speed/sqrt(2)*sign(velocity.y))
	
	animation_handling()

func animation_handling():
	if velocity.x > 0:
		$AnimatedSprite.flip_h = true
	elif velocity.x < 0:
		$AnimatedSprite.flip_h = false
