class_name MainCharacter

extends KinematicBody2D

const max_speed = 200;
var velocity = Vector2(0, 0);

var life = 12;
var shild = 0;

var points = 0;

var counter = 0;
var lifecounter = 0;

var weapon = 0;
var unten = false;
var untencounter = 0;

func _physics_process(delta):
	healthHandling()
	if life <= 0:
		$WinLose.text = "Game Over"
		$AnimatedSprite.play("0")
		lifecounter += delta
		if lifecounter > 5:
			get_tree().change_scene("res://Worlds/Startbildschrim.tscn")
	
	elif points >= 15:
		$WinLose.text = "Game Win"
		lifecounter += delta
		if lifecounter > 5:
			get_tree().change_scene("res://Worlds/Startbildschrim.tscn")
	
	else:
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
		weaponHandling(delta)
		
		$Label.text = str(points)
		
		counter += delta
		if counter >= 15:
			counter = 0
			if shild > 0:
				shild -= 1
			else:
				life -= 1
			
	
		

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

func healthHandling():
	if life > 8:
		$Life/Life1.play("4")
		$Life/Life2.play("4")
		$Life/Life3.play(str((life+3)%4+1))
	elif life > 4:
		$Life/Life1.play("4")
		$Life/Life2.play(str((life+3)%4+1))
		$Life/Life3.play("0")
	elif life > 0:
		$Life/Life1.play(str((life+3)%4+1))
		$Life/Life2.play("0")
		$Life/Life3.play("0")
	else:
		$Life/Life1.play("0")
		$Life/Life2.play("0")
		$Life/Life3.play("0")
		
	if shild > 8:
		$Life/Shild/Shild1.play("4")
		$Life/Shild/Shild2.play("4")
		$Life/Shild/Shild3.play(str((shild+3)%4+1))
	elif shild > 4:
		$Life/Shild/Shild1.play("4")
		$Life/Shild/Shild2.play(str((shild+3)%4+1))
		$Life/Shild/Shild3.play("0")
	elif shild > 0:
		$Life/Shild/Shild1.play(str((shild+3)%4+1))
		$Life/Shild/Shild2.play("0")
		$Life/Shild/Shild3.play("0")
	else:
		$Life/Shild/Shild1.play("0")
		$Life/Shild/Shild2.play("0")
		$Life/Shild/Shild3.play("0")

func weaponHandling(step):
	if weapon == 0:
		$Waffe.play("0")
		return
	else:
		var s;
		if not unten:
			if Input.is_action_just_pressed("attak"):
				s = "unten";
				unten = true;
			else:
				s = "oben";
			
			$Waffe.play(str(weapon)+s)
		else:
			untencounter += step
			if untencounter >= .2:
				unten = false;
				untencounter = 0;
		
		
		
		
		
		
		
		
		
		
