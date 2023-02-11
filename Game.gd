extends Node2D

# Vars
var bozo_enemy = preload("res://Scenes/Bozo.tscn")
var enemies_on_screen = 0

var navmap

# Functions
func create_enemy(enemy):
	var enemy_instance = enemy.instance()
	var spawn_vector = Vector2(randi() % 1000, randi() % 1000)
	enemy_instance.position = spawn_vector
	enemy_instance.navmap = navmap
	return enemy_instance

# Called when the node enters the scene tree for the first time.
func _ready():
	# use call deferred to make sure the entire SceneTree Nodes are setup
	# else yield on 'physics_frame' in a _ready() might get stuck
	call_deferred("setup_navserver")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	while enemies_on_screen < 3:
		add_child(create_enemy(bozo_enemy))
		enemies_on_screen += 1

###

func setup_navserver():

	# create a new navigation map
	navmap = Navigation2DServer.map_create()
	Navigation2DServer.map_set_active(navmap, true)

	# create a new navigation region and add it to the map
	var region = Navigation2DServer.region_create()
	Navigation2DServer.region_set_transform(region, Transform())
	Navigation2DServer.region_set_map(region, navmap)

	# sets navigation mesh for the region
	var navigation_poly = NavigationMesh.new()
	navigation_poly = $Navmesh.navpoly
	Navigation2DServer.region_set_navpoly(region, navigation_poly)

	# wait for Navigation2DServer sync to adapt to made changes
	yield(get_tree(), "physics_frame")
