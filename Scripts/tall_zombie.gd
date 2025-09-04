extends CharacterBody3D

var player = null

const SPEED = 4.0

@export var player_path : NodePath

@onready var nav_agent = $NavigationAgent3D

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Searching for players...")
	var players = get_tree().get_nodes_in_group("players")
	print("Found ", players.size(), " players")
	if players.size() > 0:
		player = players[0]
		print("Player found: ", player.name)
	else:
		print("No player found in 'players' group")
		# Debug: print all available groups
		print("Available groups: ", get_tree().get_nodes_in_group(""))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player == null:
		print("Player is null!")
		return
	velocity = Vector3.ZERO
	nav_agent.set_target_position(player.global_transform.origin)
	var next_nav_point = nav_agent.get_next_path_position()
	velocity = (next_nav_point - global_transform.origin).normalized() * SPEED
	move_and_slide()
