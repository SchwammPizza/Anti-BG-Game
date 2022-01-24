extends KinematicBody2D

var names = ["coin", "emer"]
var drin = false
var character;

func _ready():
	if self.name.substr(0,4) in names:
		$AnimatedSprite.play(self.name.substr(0,4))
	else:
		queue_free()

func _physics_process(delta):
	if drin:
		print("salat")
		if Input.is_action_just_pressed("f"):
			for i in range(2):
				if self.name.substr(0,4) == names[i]:
					character.points += (i+1)
			
			queue_free()

func _on_Area2D_body_entered(body):
	if body is MainCharacter:
		drin = true
		character = body

func _on_Area2D_body_exited(body):
	if body is MainCharacter:
		drin = false
		character = false
