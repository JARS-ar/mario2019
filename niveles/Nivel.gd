extends Node2D

signal score_changed

export var autor: String

var Collectible = preload('res://items/Collectible.tscn')
onready var pickups = $Pickups
onready var HUD = $CanvasLayer/HUD
var score
var pickups_on_level

func _ready():
	$Player.connect('life_changed', $CanvasLayer/HUD, '_on_Player_life_changed')
	$Player.connect('dead', self, '_on_Player_dead')
	connect('score_changed', $CanvasLayer/HUD, '_on_score_changed')
	score = 0
	pickups_on_level = spawn_pickups()
	emit_signal('score_changed', Vector2(score, pickups_on_level))
	pickups.hide()
	$CanvasLayer/HUD._on_level_start(autor)
	$Player.start($PlayerSpawn.position)
#	set_camera_limits()


func set_camera_limits():
	var map_size = $World.get_used_rect()
	var cell_size = $World.cell_size
	$Player/Camera2D.limit_left = (map_size.position.x - 5) * cell_size.x
	$Player/Camera2D.limit_right = (map_size.end.x + 5) * cell_size.x

func spawn_pickups():
	var amount = 0
	for cell in pickups.get_used_cells():
		var id = pickups.get_cellv(cell)
		var type = pickups.tile_set.tile_get_name(id)
		if type in ['gem', 'cherry']:
			var c = Collectible.instance()
			var pos = pickups.map_to_world(cell)
			c.init(type, pos + pickups.cell_size/2)
			add_child(c)
			c.connect('pickup', self, '_on_Collectible_pickup')
			amount += 1
	return amount


func _on_Collectible_pickup():
	$PickupSound.play()
	score += 1
	emit_signal('score_changed', Vector2(score, pickups_on_level))

func _on_Player_dead():
	GameState.restart()

func _on_Door_body_entered(body):
	if score == pickups_on_level:
		print(GameState.level_list[GameState.current_level])
		GameSaver.save_game(GameState.level_list[GameState.current_level])
		GameState.next_level()

