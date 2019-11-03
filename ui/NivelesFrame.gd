extends Control


var list: ItemList

#onready var icon_on = preload('res://Sprites/ContadorVidas.png')
#onready var icon_off = preload("res://Sprites/icono_apagado.png")

func _ready():
	list = $HBoxContainer/ItemList

func populate(curso):
	var dir = Directory.new()
	
	list.clear()
	match curso:
		GameState.Cursos.TM_31:
			if dir.open('res://niveles/3ro1ra/') == OK:
				dir.list_dir_begin()
				var file_name = dir.get_next()
				while (file_name != ""):
					if dir.current_is_dir():
						print("Found directory: " + file_name)
					else:
						print("Found file: " + file_name)
						var packed_level = load('res://niveles/3ro1ra/%s' % file_name)
						var level = packed_level.instance()
						list.add_item(level.autor)
						print('autor: ', level.autor)
					file_name = dir.get_next()
				
				
				
				
				

#	for i in scene_changer.NOMBRES[curso]:
#		if GameSaver.saves.has(i):
#			list.add_item(scene_changer.NOMBRES[curso][i], icon_on)
#		else:
#			list.add_item(scene_changer.NOMBRES[curso][i], icon_off)

func inform():
	if list.is_anything_selected():
		var selected = list.get_selected_items()
		return list.get_item_text(selected[0])
	else:
		return false