extends Control




func play():
	get_tree().change_scene(GameState.game_scene)

func _on_Button_pressed():
	$AnimationPlayer.play("TitleACursos")

#	play()


func _on_CursosFrame_move(curso):
	$NivelesFrame.populate(curso)
	$AnimationPlayer.play("CursosANiveles")
