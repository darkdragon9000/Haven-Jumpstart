extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -600.0
const DASH_VELOCITY = 6000.0

var can_dash = true
@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		can_dash = true

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY



	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_just_pressed("dash") and can_dash:
		velocity.x += DASH_VELOCITY * direction
		can_dash = false
	if direction < 0:
		animated_sprite_2d.flip_h = true
	if direction > 0:
		animated_sprite_2d.flip_h = false
		
	move_and_slide()
