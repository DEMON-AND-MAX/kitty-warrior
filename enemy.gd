extends CharacterBody2D

const SPEED = 100.0
const FOLLOW_RANGE = 2000.0  # Adjust this range as needed
const STOP_FOLLOW_DISTANCE = 100.0
const BUFFER_DISTANCE = 10.0  # Buffer zone to prevent shaking
var player
var attack: Perish
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

func _ready():
	player = Functions.get_player_node()  # Assuming player is the node representing the player
	attack = ModifierFactory.generate_modifier("perish", {
		"1": ["unipolar_mod" ,"health", -10, 1, -1]
	})
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
	#if distance_to_player > STOP_FOLLOW_DISTANCE + BUFFER_DISTANCE:
		# Move towards the player
		velocity = direction * SPEED
		move_and_slide()
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			if collision.get_collider().name == "player":
				collision.get_collider().give_modifier(attack)
				queue_free()

		#elif distance_to_player <= STOP_FOLLOW_DISTANCE:
			## Move away from the player
			#velocity = -direction * SPEED
			#move_and_slide()
		#else:
			## Stop moving if within buffer distance
			#velocity = Vector2.ZERO
