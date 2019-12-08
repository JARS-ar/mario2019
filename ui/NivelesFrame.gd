extends Control

signal back

var list: ItemList
var current_curso = null
var niveles = null

onready var incompleto = preload("res://assets/grey_box.png")
onready var completo = preload("res://assets/green_boxCheckmark.png")


func _ready():
	list = $HBoxContainer/ItemList

func populate(curso):
	niveles = []
	var dir = Directory.new()
	list.reset()
	list.clear()

	if dir.open('res://niveles/%s/' % curso) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		var item_cont = 0 
		while (file_name != ""):
			if not dir.current_is_dir():
				var path = 'res://niveles/%s/%s' % [curso, file_name]
				niveles.append(path)
				var packed_level = load(path)
				var level = packed_level.instance()
				if GameSaver.saves.has(path):
					list.add_item(level.autor, completo)
				else:
					list.add_item(level.autor, incompleto)
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
