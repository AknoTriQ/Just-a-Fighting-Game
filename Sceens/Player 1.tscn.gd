extends KinematicBody2D

const GRAVITY = 10
const SPEED = 80
const JUMP_HEIGHT = 220
const UP = Vector2(0, -1)

var motion = Vector2()

func _physics_process(delta):
	
	motion.y += GRAVITY
	
	if Input.is_action_pressed("RIGHT"):
		motion.x = SPEED
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
			
	if motion.y != 0:
		if not is_on_floor():
			$AnimatedSprite.play("Jump")
			
	if motion.x == 0:
		if is_on_floor():
			$AnimatedSprite.play("Idle")


	motion = move_and_slide(motion, UP)


	
	
	
func _process(delta):
		pass



func attack():
		pass
	
	
	
	
	

