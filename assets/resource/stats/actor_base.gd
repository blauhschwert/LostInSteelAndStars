class_name ActorBase
extends Resource

enum ActorType {PLAYER, ENEMY}

@export_category("Actor Type")
@export var actor_type : ActorType
@export var actor_name : String
@export var level : int


func get_actor_name() -> String:
	return actor_name
