extends CharacterBody2D

const SPEED = 100.0
const FOLLOW_RANGE = 200.0  # Adjust this range as needed
const STOP_FOLLOW_DISTANCE = 100.0
const BUFFER_DISTANCE = 10.0  # Buffer zone to prevent shaking
var player

func _ready():
	player = get_node("/root/Node2D/player")  # Assuming player is the node representing the player
	pass

func _physics_process(delta):
	if player:
		follow_player(delta)
	else:
		# Stop moving if player is not available
		velocity = Vector2.ZERO

func follow_player(delta):
	var distance_to_player = global_position.distance_to(player.global_position)
	var direction = (player.global_position - global_position).normalized()

	if distance_to_player <= FOLLOW_RANGE:
		if distance_to_player > STOP_FOLLOW_DISTANCE + BUFFER_DISTANCE:
			# Move towards the player
			velocity = direction * SPEED
			move_and_slide()
		elif distance_to_player <= STOP_FOLLOW_DISTANCE:
			# Move away from the player
			velocity = -direction * SPEED
			move_and_slide()
		else:
			# Stop moving if within buffer distance
			velocity = Vector2.ZERO
