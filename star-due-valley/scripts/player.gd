
extends CharacterBody2D

@export var speed := 200
var anim : AnimatedSprite2D

func _ready():
	anim = $AnimatedSprite2D
   

func _physics_process(_delta):
	var motion := Vector2.ZERO

	# taking the input into a vector to move the player
	if Input.is_action_pressed("ui_right"):
		motion.x = 1
	elif Input.is_action_pressed("ui_left"):
		motion.x = -1

	if Input.is_action_pressed("ui_down"):
		motion.y = 1
	elif Input.is_action_pressed("ui_up"):
		motion.y = -1

	# animation
	if motion.x > 0:
		anim.play("walk right")
	elif motion.x < 0:
		anim.play("walk left")
	elif motion.y > 0:
		anim.play("walk down")
	elif motion.y < 0:
		anim.play("walk up")
	else:
		anim.play("idle")

	#  Apply speed and move
	if motion != Vector2.ZERO:
		motion = motion * speed
	velocity = motion
	move_and_slide()
