extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/PlayButton.connect("pressed", self, "_play_button_pressed")	
	$MarginContainer/VBoxContainer/VBoxContainer/MarginContainer2/PlayButton2.connect("pressed", self, "_play_button_pressed")	
	$AnimationPlayer.play("FadeIn")
	yield(get_tree().create_timer(1.5), "timeout")
	$ColorRect.visible = false
	
	
	pass # Replace with function body.

func _play_button_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")
	
func _credit_button_pressed():
	get_tree().change_scene("res://Scenes/Credits.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("ui_accept"):
		get_tree().change_scene("res://Scenes/Game.tscn")
	pass
