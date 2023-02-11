extends KinematicBody2D


# Vars
var speed = 60
var velocity = Vector2.ZERO
onready var player = get_parent().get_node("Player")

var path = []

var navmap

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	#look_at(player.position)
	#velocity = position.direction_to(player.position) * speed
	#move_and_slide(velocity)
	
	_update_navigation_path(position, player.position)
	
	var walk_distance = speed * delta
	move_along_path(walk_distance)


func move_along_path(distance):
	var last_point = position
	while path.size():
		var distance_between_points = last_point.distance_to(path[0])
		# The position to move to falls between two points.
		if distance <= distance_between_points:
			position = last_point.linear_interpolate(path[0], distance / distance_between_points)
			return
		# The position is past the end of the segment.
		distance -= distance_between_points
		last_point = path[0]
		path.remove(0)
	# The character reached the end of the path.
	position = last_point
	set_process(false)


func _update_navigation_path(start_position, end_position):
	# map_get_path is part of the avigation2DServer class.
	# It returns a PoolVector2Array of points that lead you
	# from the start_position to the end_position.
	path = Navigation2DServer.map_get_path(navmap, start_position, end_position, true)
	# The first point is always the start_position.
	# We don't need it in this example as it corresponds to the character's position.
	# print(path)
	path.remove(0)
	set_process(true)
