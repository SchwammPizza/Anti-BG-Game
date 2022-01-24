extends KinematicBody2D

var names = ["apfel", "birne", "kürbi", "tranb", "tranr"]
var drin = false
var character;

func _ready():
	if self.name.substr(0,5) in names:
		$AnimatedSprite.play(self.name.substr(0,5))
	else:
		queue_free()

func _physics_process(delta):
	if drin:
		if Input.is_action_just_pressed("f"):
			if self.name.substr(0,5) == "apfel":
				character.life += 3
			elif self.name.substr(0,5) == "birne":
				character.life -= 6
			elif self.name.substr(0,5) == "kürbi":
				character.life -= 4
			elif self.name.substr(0,5) == "tranb":
				character.shild += 4
			elif self.name.substr(0,5) == "tranr":
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
