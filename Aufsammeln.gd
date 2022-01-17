extends KinematicBody2D

var names = ["apfel", "birne", "kürbi", "tranb", "tranr"]
var drin = false
var character;

func _ready():
	if self.name in names:
		$AnimatedSprite.play(self.name)
	else:
		queue_free()

func _physics_process(delta):
	if drin:
		if Input.is_action_just_pressed("f"):
			if self.name == "apfel":
				character.life += 3
			elif self.name == "birne":
				character.life -= 2
			elif self.name == "kürbi":
				character.life -= 1
			elif self.name == "tranb":
				character.shild += 4
			elif self.name == "tranr":
				character.life += 4
			
			if character.life > 12:
				character.life = 12
			if character.shild > 12:
				character.shild = 12
			
			queue_free()
			


func _on_Area2D_body_entered(body):
	if body is MainCharacter:
		drin = true
		character = body

func _on_Area2D_body_exited(body):
	if body is MainCharacter:
		drin = false
		character = false
