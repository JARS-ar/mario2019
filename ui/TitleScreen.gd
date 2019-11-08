extends Control


func play():
	get_tree().change_scene(GameState.game_scene)

func _on_Button_pressed():
	$AnimationPlayer.play("TitleACursos")


func _on_CursosFrame_move(curso):
	$NivelesFrame.populate(curso)
	$AnimationPlayer.play("CursosANiveles")


func _on_NivelesFrame_back():
	$AnimationPlayer.play("CursosANiveles", -1, -1, true)
