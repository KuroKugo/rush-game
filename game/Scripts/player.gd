extends Area2D

const LEFT = Vector2(-1,0);
const RIGHT = Vector2(1,0);
const UP = Vector2(0,-1);
const DOWN = Vector2(0,1);

export var speed = 150
var screen_size
var player_size

func _ready():
	screen_size = get_viewport_rect().size
	player_size = $Sprite.get_rect().size

func _process(delta):
	
	if Input.is_action_pressed("ui_left"):
		movement(LEFT, delta)
	if Input.is_action_pressed("ui_right"):
		movement(RIGHT, delta)
	if Input.is_action_pressed("ui_up"):
		movement(UP, delta)
	if Input.is_action_pressed("ui_down"):
		movement(DOWN, delta)
	position.x = clamp(position.x, player_size.x/2, screen_size.x - player_size.x/2)
	position.y = clamp(position.y, player_size.y/2, screen_size.y - player_size.y/2)

func movement(moveDir, delta):
	position += moveDir * speed * delta
	
