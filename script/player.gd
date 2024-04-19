class_name Player
extends CharacterBody2D

const PLAYER_SPEED = 300.0

const DASH_SPEED = 900
const DASH_DURATION = 0.4
const DASH_COOLDOWN = 4.0

const STAMINA_CAPACITY = 6 # maximum stamina
const DASH_CONSUMPTION = 3 # consumed stamina units per one usage

@onready var animation_player = $AnimationPlayer

var is_dashing = false
var dash_stamina = 3
var dash_timer = 0.0

var dash_direction = Vector2.ZERO
	

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	if !is_dashing:
		input_vector = get_input_vector()
	
	velocity = input_vector * PLAYER_SPEED
	look_at(get_global_mouse_position())
	rotate(30)
	move_and_slide()
	
	if Input.is_action_just_pressed("spacebar") and !is_dashing and dash_stamina >= DASH_CONSUMPTION:
		start_dash()
	
	if Input.is_action_just_pressed("click_left"):
		animation_player.play("melee_player_attack");
	
	if is_dashing:
		dash_timer += delta
		if dash_timer >= DASH_DURATION:
			is_dashing = false
			dash_timer = 0.0
			# for velocity reset
			velocity = Vector2.ZERO
		else:
			global_position += dash_direction * DASH_SPEED * delta

func get_input_vector() -> Vector2:
	var input_vector = Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	
	if input_vector != Vector2.ZERO:
		input_vector = input_vector.normalized()
	
	return input_vector

func start_dash() -> void:
	var mouse_pos = get_global_mouse_position()
	dash_stamina -= DASH_CONSUMPTION
	dash_direction = (mouse_pos - global_position).normalized()
	is_dashing = true

func _on_timer_timeout():
	if dash_stamina < STAMINA_CAPACITY:
		dash_stamina += 1


func _on_area_2d_body_entered(body):
	var item = body.item.instantiate()
	body.queue_free()
	add_child(item)
