extends KinematicBody2D


# Vars
var speed = 60
var velocity = Vector2.ZERO
var player


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_node("Player")

func _physics_process(delta):
	look_at(player.position)
	velocity = position.direction_to(player.position) * speed
	move_and_slide(velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
