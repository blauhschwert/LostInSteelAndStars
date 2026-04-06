class_name PlayerStats
extends BaseStats

func _init(p_health : int, p_attack : int, p_defense: int, p_intelect : int,
			p_speed : int) -> void:
	health = p_health
	attack = p_attack
	defense = p_defense
	intelect = p_intelect
	speed = p_speed
