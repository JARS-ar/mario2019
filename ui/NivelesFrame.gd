extends Control

signal back

var list: ItemList
var current_curso = null

func _ready():
	list = $HBoxContainer/ItemList

func populate(curso):
	current_curso = curso
	var dir = Directory.new()
	list.clear()

	if dir.open('res://niveles/TM_31/') == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		var item_cont = 0 
		while (file_name != ""):
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
				var path = 'res://niveles/TM_31/%s' % file_name
				var packed_level = load(path)
				var level = packed_level.instance()
				list.add_item(level.autor)
				list.set_item_metadata(item_cont, path)
				item_cont += 1
			file_name = dir.get_next()


func inform():
	if list.is_anything_selected():
		var selected = list.get_selected_items()
		return list.get_item_text(selected[0])
	else:
		return false

func _on_StartBtn_pressed():
	if list.is_anything_selected():
		var selected = list.get_selected_items()
		GameState.set_level_list(current_curso, selected[0]+1, list.get_item_count())
		GameState.play()


func _on_ExitBtn_pressed():
	emit_signal("back")
