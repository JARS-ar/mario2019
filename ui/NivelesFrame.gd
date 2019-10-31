extends Control


var list: ItemList

#onready var icon_on = preload('res://Sprites/ContadorVidas.png')
#onready var icon_off = preload("res://Sprites/icono_apagado.png")

func _ready():
	list = $MarginContainer/ItemList

#func populate(curso):
#	list.clear()
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