extends CharacterBody2D

@export var speed = 80
@onready var anim = $AnimatedSprite2D

func _process(_delta):
	var input_vector = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1
		$AnimatedSprite2D.flip_h = false  # Set flip_h to false when moving right
	elif Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
		$AnimatedSprite2D.flip_h = true   # Set flip_h to true when moving left

	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1

	input_vector = input_vector.normalized()

	velocity =  speed * input_vector

	if input_vector != Vector2.ZERO:
		anim.play("run")
	else:
		anim.play("idle")

	move_and_slide()
