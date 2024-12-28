extends CharacterBody2D


const VEL_SPEED = 0.00000000005
const SPEED = -400.0
func _physics_process(delta: float) -> void:
	
	# Handle jump.
	var speed_test = SPEED
	if Input.is_action_pressed("ui_up"): # and is_on_floor()
		if speed_test**2 < velocity.y**2 + velocity.x**2:
			speed_test -= speed_test / 16
			
		velocity.y = (speed_test * sin(rotation_degrees * (PI/180)))
		velocity.x = (speed_test * cos(rotation_degrees * (PI/180)))

	
	if Input.is_action_pressed("ui_down"):
		velocity.y -= velocity.y / 32
		velocity.x -= velocity.x / 32

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		rotation_degrees -= SPEED * 0.01 * direction
		
	move_and_slide()
