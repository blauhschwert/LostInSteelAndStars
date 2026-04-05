class_name BattleStats
extends Resource

enum ActorType {PLAYER, ENEMY}

@export_category("Actor Type")
@export var actor_type : ActorType
@export_enum("Warrior","Thief","Mage") var character_class : int
