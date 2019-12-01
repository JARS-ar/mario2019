extends Control

signal back

var list: ItemList
var current_curso = null
var niveles = null


func _ready():
	list = $HBoxContainer/ItemList

func populate(curso):
	niveles = []
	var dir = Directory.new()
	list.clear()

	if dir.open('res://niveles/%s/' % curso) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		var item_cont = 0 
		while (file_name != ""):
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
				var path = 'res://niveles/%s/%s' % [curso, file_name]
				niveles.append(path)
				var packed_level = load(path)
				var level = packed_level.instance()
				list.add_item(level.autor)
				list.set_item_metadata(item_cont, path)
				list.set_item_tooltip_enabled(item_cont, false)
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
		print(selected)
		GameState.set_level_list(current_curso, selected[0], niveles)
		GameState.play()


func _on_ExitBtn_pressed():
	emit_signal("back")
