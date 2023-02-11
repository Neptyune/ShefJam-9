extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# [name, default slot, unblocked, price, sprite]
var weapons= {
	weapon_gun =['gun', 1, false, 100, "gun"],
	weapon_knife=['knife', 2, true, 200, "knife"]
}


# Called when the node enters the scene tree for the first time.
func _ready():
	for w in weapons.values():
		if w[2] == false:
			continue
		get_node(w[4]).visible = true;
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
