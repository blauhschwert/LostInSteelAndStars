class_name BattleScreen
extends Node3D

@onready var battle_container: BattleContainer = $SubViewport/BattleContainer

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		battle_container.hide_textbox.emit()
	if Input.is_action_just_pressed("attack"):
		battle_container.create_text.emit("hello world")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
