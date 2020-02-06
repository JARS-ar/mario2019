extends Control

signal back
signal done

var current_curso = null
var niveles = null
var level_index: Array = []

onready var incompleto = preload("res://assets/grey_box.png")
onready var completo = preload("res://assets/green_boxCheckmark.png")
onready var list = $HBoxContainer/ItemList

func populate(curso) -> void:

	list.reset()
	list.clear()
	
	if load_level_index(curso):

		for level in level_index.size():
			if GameSaver.saves.has(level_index[level][1]):
				list.add_item(level_index[level][0], completo)
			else:
				list.add_item(level_index[level][0], incompleto)
	else:
		print('error')

func load_level_index(curso) -> bool:

	var file = File.new()
	if file.file_exists('res://niveles/%s/%s.res' % [curso, curso]):

		var err = file.open('res://niveles/%s/%s.res' % [curso, curso], File.READ)
		if err == OK:
			var temp = file.get_var()
			file.close()
			if temp:
				level_index = temp
				return true
			else:
				print('el indice de niveles estaba roto :(')
		else:
			print('no se pudo abrir el indice  ', err)
	else:
		print ('No existe indice de niveles')
	return false

func _on_StartBtn_pressed() -> void:
	if list.is_anything_selected():
		var selected = list.get_selected_items()
		GameState.set_level_list(current_curso, selected[0], level_index)
		GameState.play()

func _on_ExitBtn_pressed() -> void:
	emit_signal("back")



































