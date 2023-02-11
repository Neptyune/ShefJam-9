extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# [name, default slot, unlocked, price, damage, rate of fire]
var weapons= {
	weapon_gun =['gun', 1, true, 100, 3],
	weapon_knife=['knife', 2, true, 200, 2],
	weapon_hammer =['hammer', 3, true, 100, 1],
	weapon_axe=['axe', 4, true, 200]
}
var current_weapon = 0

# Called when the node enters the scene tree for the first time.
func _ready():

	get_node(weapons.values()[current_weapon][0]).visible = true;
#	get_node(weapons[current_weapon][4]).visible = true;
	
	
	#for w in weapons.values():
	#	if w[2] == false:
	#		continue
	#	get_node(w[4]).visible = true;
	#pass # Replace with function body.
func array_loop():
	if current_weapon == weapons.size():
		current_weapon = 0
	elif current_weapon == -1:
		current_weapon = weapons.size()-1

func next_unlocked(i):
	get_node(weapons.values()[current_weapon][0]).visible = false;
	current_weapon = current_weapon + i
	array_loop()
	while weapons.values()[current_weapon][2] == false:
		current_weapon = current_weapon + i
		array_loop()
	get_node(weapons.values()[current_weapon][0]).visible = true;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_right") :
		next_unlocked(1)
		print(current_weapon)
	if Input.is_action_just_pressed("ui_left"):
		next_unlocked(-1)
		print(current_weapon)
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://Scenes/Game.tscn")
		pass
		# add the select
		# equip
		# go to next stage
	
#	pass


func _on_rightbutton_pressed():
	next_unlocked(1)


func _on_leftbutton_pressed():
	next_unlocked(-1)
