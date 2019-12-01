extends Node

enum  Cursos { TM_31, TM_32, TT_31, TT_32,
				TM_42, TM_43, TM_44, TT_41, TT_42}



var level_list = []
var current_level = 1
var current_curso = null

var game_scene = 'res://Main.tscn'
var title_screen = 'res://ui/TitleScreen.tscn'

func restart():
	current_level = 1
	current_curso = null
	get_tree().change_scene(title_screen)

func next_level():
	current_level += 1
	if current_level < level_list.size():
		get_tree().reload_current_scene()
	else:
		get_tree().change_scene(title_screen)

func play():	
	get_tree().change_scene(game_scene)

func set_level_list(curso, level, list):
	current_curso = curso
	current_level = level
	level_list = list
















