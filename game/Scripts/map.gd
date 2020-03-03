extends Node2D

export (PackedScene) var Mob

export var mobSpawnRate = 1.0
var MOB_SCENE = load("res://Scenes/mob.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	#load and create and instance of a player
	var playerScene = load("res://Scenes/player.tscn")
	var player = playerScene.instance()
	
	#set the starting postion to StartSpawn(Position2D) and then make it a child of the map
	player.set_position($StartSpawn.position)
	add_child(player)
	
	$TimeLimit.start()

func _on_MobRateSpawner_timeout():
	# Choose a random location on Path2D.
	$MobPath/MobSpawnLocation.set_offset(randi())
	
	#Create the Mob and add it to the scence
	var mob = Mob.instance()
	add_child(mob)
	
	# Set the mob's direction perpendicular to the path direction.
	var direction = $MobPath/MobSpawnLocation.rotation + PI / 2
	
	# Set the mob's position to a random location.
	mob.position = $MobPath/MobSpawnLocation.position
	
	# Add some randomness to the direction.
	direction += rand_range(-PI/4, PI/4)
	
	mob.linear_velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0)
	mob.linear_velocity = mob.linear_velocity.rotated(direction)
	
	
func game_over():
	$MobRateSpawner.stop()
