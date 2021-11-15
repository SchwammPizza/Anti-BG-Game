class_name MainCharacter

extends KinematicBody2D

const max_speed = 200;
var velocity = Vector2(0, 0);

func _physics_process(delta):
	velocity = move_and_slide(velocity)
	
	if Input.is_action_pressed("up1"):
		velocity.y = -max_speed;
		velocity.x = 0;
	
	elif Input.is_action_pressed("down1"):
		velocity.y = max_speed;
		velocity.x = 0;
	
	elif Input.is_action_pressed("left1"):
			velocity.x = -max_speed;
			velocity.y = 0;
		
	elif Input.is_action_pressed("right1"):
		velocity.x = max_speed;
		velocity.y = 0;
	
	else:
		velocity = Vector2(0, 0);

	animation_handling()

func animation_handling():
	if velocity.x > 0:
		$AnimatedSprite.play("leftright")
		$AnimatedSprite.flip_h = true
	elif velocity.x < 0:
		$AnimatedSprite.play("leftright")
		$AnimatedSprite.flip_h = false
	elif velocity.y > 0:
		$AnimatedSprite.play("up")
	elif velocity.y < 0:
		$AnimatedSprite.play("down")
