class_name EnemyBaseActor
extends BattleActor

@export var enemy_base_data : ActorBase
@export var enemy_texture : Array[Texture2D]

var enemy_stats : EnemyStats

func _ready() -> void:
	enemy_stats = EnemyStats.new(15,4,3,7,8)

func get_enemy_name() -> String:
	return enemy_base_data.actor_name

func get_enemy_level() -> int:
	return enemy_base_data.level

# TODO improve the algorithm to get better compare of the different texutres
func get_enemy_texture() -> Texture2D:
	if enemy_stats.attack > enemy_stats.defense:
		return enemy_texture[0]
	elif enemy_stats.defense > enemy_stats.speed:
		return enemy_texture[1]
	else:
		return enemy_texture[2]
