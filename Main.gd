extends Node

func _ready():

	var path = GameState.level_list[GameState.current_level]
	var map = load(path).instance()
	add_child(map)

func _notification(what):
    if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
        get_tree().change_scene(GameState.title_screen)