extends Node

# Vars
var bozo_enemy = preload("res://Scenes/Bozo.tscn")


# Functions
func create_enemy(enemy):
	var enemy_instance = enemy.instance()
	var spawn_vector = Vector2(randi() % 260 - 130, randi() % 260 - 130)
	enemy_instance.position = spawn_vector
	return enemy_instance

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(create_enemy(bozo_enemy))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
