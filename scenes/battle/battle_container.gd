class_name BattleContainer
extends Control

signal hide_textbox
signal create_text(string)

@onready var player_actions: Control = $PlayerActions
@onready var text_box: Control = $TextBox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide_textbox.connect(_hide_text_box)
	create_text.connect(_display_text)
	
	player_actions.hide()
	text_box.hide()
	
	_display_text("Hello World")
	#await get_tree().create_timer(0.6).timeout
	#hide_text_box()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _hide_text_box() -> void:
	text_box.hide()
	player_actions.show()


func _display_text(text : String) -> void:
	player_actions.hide()
	text_box.show()
	$TextBox/TextBoxText.text = text
