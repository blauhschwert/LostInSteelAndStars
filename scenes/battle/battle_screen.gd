class_name BattleScreen
extends Node3D

signal end_battle

enum BattlePhases {START, PLAYER_TURN, ENEMY_TURN, CHECK_END}


const worm_red = preload("res://assets/enemys/WormA.png")
const worm_green = preload("res://assets/enemys/WormB.png")
const worm_blue = preload("res://assets/enemys/WormC.png")

var player : PlayerActor = null
var enemy = null


@onready var battle_container: BattleContainer = $SubViewport/BattleContainer

# get actors of different party areas
# find those data of the player party
@onready var player_party: BattleActor = $PlayerParty

# get actors of enemy party
@onready var enemy_party: BattleActor = $EnemyParty




func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		battle_container.hide_textbox.emit()
	if Input.is_action_just_pressed("attack"):
		battle_container.create_text.emit("hello world")
	if Input.is_action_just_pressed("flee"):
		end_battle.emit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemy = enemy_party.get_child(0)
	
	
	battle_container.initialize_enemy_data(enemy.get_enemy_name(), enemy.get_enemy_level())
	battle_container.modify_enemy_sprite(enemy.get_enemy_texture())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
