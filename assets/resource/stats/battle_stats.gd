class_name BaseStats
extends Resource

@export_category("Base Stats")
@export var _base_health : int = 25
@export var _base_attack : int = 8
@export var _base_defense: int = 9
@export var _base_intelect : int = 8
@export var _base_speed : int = 6

# TODO : next creations for rpg stats
# hit_chance for critical attacks
# evasion for missing attacks

var health : int = 0 : set = _set_health , get = get_health
var attack : int = 0 : set = _set_attack , get = get_attack
var defense : int = 0 : set = _set_defense , get = get_defense
var intelect : int = 0 : set = _set_intelect , get = get_intelect
var speed : int = 0 : set = _set_speed , get = get_speed

func _init(p_health : int, p_attack : int, p_defense: int, p_intelect : int,
			p_speed : int) -> void:
	health = p_health
	attack = p_attack
	defense = p_defense
	intelect = p_intelect
	speed = p_speed 

# Public get functions

func get_health() -> int:
	return health

func get_attack() -> int:
	return attack

func get_defense() -> int:
	return defense

func get_intelect() -> int:
	return intelect

func get_speed() -> int:
	return speed

# Public setter functions

func modify_health(p_health) -> void:
	health = clamp(p_health, _base_health, 256)

func modify_attack(p_attack) -> void:
	attack = clamp(p_attack, _base_attack, 99)  

func modify_defense(p_defense) -> void:
	defense = clamp(p_defense, _base_defense, 99) 

func modify_intelect(p_intelect) -> void:
	intelect = clamp(p_intelect, _base_intelect, 99)

func modify_speed(p_speed) -> void:
	speed = clamp(p_speed, _base_speed, 99) 

# Private setter functions

func _set_health(p_health : int) -> void:
	health = clamp(p_health, _base_health, 256) 

func _set_attack(p_attack : int) -> void:
	attack = clamp(p_attack, _base_attack, 99)

func _set_defense(p_defense : int) -> void:
	defense = clamp(p_defense, _base_defense, 99) 

func _set_intelect(p_intelect : int) -> void:
	intelect = clamp(p_intelect, _base_intelect, 99)

func _set_speed(p_speed : int) -> void:
	speed = clamp(p_speed, _base_speed, 99)
 
