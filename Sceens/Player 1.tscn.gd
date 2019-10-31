extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 14
const SPEED = 80
const JUMP_HEIGHT = 200
var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	if motion.x == 0:
		if is_on_floor():
			$AnimatedSprite.play("Idle")
	
	if Input.is_action_pressed("RIGHT"):
		motion.x = +SPEED
		if is_on_floor():
			$AnimatedSprite.play("Run")
			$AnimatedSprite.flip_h = false
	else:
		motion.x = 0
		
		
	if Input.is_action_pressed("LEFT"):
		motion.x = -SPEED
		if is_on_floor():
			$AnimatedSprite.play("Run")
			$AnimatedSprite.flip_h = true
	
		
	if Input.is_action_pressed("JUMP"):
		if is_on_floor():
			motion.y = -JUMP_HEIGHT
			$AnimatedSprite.play("Jump")
	
	
	
	
	
	
	
	
	
	motion = move_and_slide(motion, UP)