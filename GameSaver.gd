extends Node


const default_saves = {
	}

var saves = default_saves

func _ready():

	load_game()


func load_game():
	print('load')
	var file = File.new()
	if file.file_exists("user://savegame.save"):
		print('file exist')
		var err = file.open("user://savegame.save", File.READ)
		if err == OK:
			var temp = file.get_var()
			file.close()
			if temp:
				saves = temp
			else:
				print('el save estaba roto y hay que volverlo a crear :(')
				create_save_file()
				saves = default_saves
		else:
			print('Paso algo cargando el save:  ', err)
	else:
		create_save_file()


func save_game(nivel):

	if saves.has(nivel):
		return
	else:
		var save_game = File.new()
		saves[nivel] = true
		if save_game.file_exists("user://savegame.save"):
			save_game.open("user://savegame.save", File.WRITE)    
			save_game.store_var(saves)
			save_game.close()
		else:
			create_save_file()

func create_save_file():
	print('create save')
	var file = File.new()
	var err = file.open("user://savegame.save", File.WRITE)
	if err == OK:
		file.store_var(saves)
		file.close()
	else:
		print('Paso algo creando el nuevo save:  ', err)





