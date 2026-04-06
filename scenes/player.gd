class_name Player
extends CharacterBody3D

@export var actor_res : ActorBase

var player_heatlh : int

var move_distance : float = 3.0
var move_speed : float = 0.5
var turn_speed : float = 0.2
var target_position : Vector3
var target_rotation : float
var is_moving: bool

@onready var forward_ray: RayCast3D = $ForwardRay
@onready var backward_ray: RayCast3D = $BackwardRay
@onready var left_ray: RayCast3D = $LeftRay
@onready var right_ray: RayCast3D = $RightRay

@onready var battle_screen: BattleScreen = $BattleScreen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target_position = global_position
	
	var player_var_test = PlayerStats.new(33,10,9,6,5)
	
	player_heatlh = player_var_test.health


func _input(_event: InputEvent) -> void:
	if not is_moving:
		if Input.is_action_just_pressed("move_forward"):
			move_forward()
		elif Input.is_action_just_pressed("move_backward"):
			move_backward()
		elif Input.is_action_just_pressed("move_left"):
			move_left()
		elif Input.is_action_just_pressed("move_right"):
			move_right()
		elif Input.is_action_just_pressed("turn_left"):
			turn_left()
		elif Input.is_action_just_pressed("turn_right"):
			turn_right()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	if is_moving:
		if not global_position == target_position:
			global_position = lerp(global_position, target_position, move_speed)
			if global_position.distance_to(target_position) < 0.1:
				global_position = target_position
				is_moving = false

func move_forward():
	if not forward_ray.is_colliding():
		target_position -= global_transform.basis.z * move_distance
		is_moving = true

func move_backward():
	if not backward_ray.is_colliding():
		target_position += global_transform.basis.z * move_distance
		is_moving = true

func move_left():
	if not left_ray.is_colliding():
		target_position += global_transform.basis.x * move_distance
		is_moving = true

func move_right():
	if not right_ray.is_colliding():
		target_position -= global_transform.basis.x * move_distance
		is_moving = true

func turn_left():
	is_moving = true
	target_rotation = rotation.y + PI/2.0
	var tween = create_tween()
	tween.tween_property(self, "rotation:y", target_rotation,turn_speed)
	tween.finished.connect(func(): is_moving = false)

func turn_right():
	is_moving = true
	target_rotation = rotation.y - PI/2.0
	var tween = create_tween()
	tween.tween_property(self, "rotation:y", target_rotation,turn_speed)
	tween.finished.connect(func(): is_moving = false)

func create_battle(_p_message : String) -> void:
	battle_screen.show()
	battle_screen.scale = Vector3(0.01,0.01,0.01)
	set_process_input(false)
	var tween = create_tween()
	tween.tween_property(battle_screen,"scale",Vector3(0.3,0.3,0.3),0.33)
	await tween.finished
	print(actor_res.get_actor_name())
	print(player_heatlh)

func _on_battle_screen_end_battle() -> void:
	var tween = create_tween()
	tween.tween_property(battle_screen,"scale",Vector3(0.01,0.01,0.01),0.3).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
	await tween.finished
	battle_screen.hide()
	set_process_input(true)
