 extends Control


func _notification(what) -> void:
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		get_tree().quit()

func play() -> void:
	get_tree().change_scene(GameState.game_scene)

func _on_Button_pressed() -> void:
	$AnimationPlayer.play("TitleACursos")

func _on_CursosFrame_move(curso) -> void:
	$NivelesFrame.populate(curso)
	$AnimationPlayer.play("CursosANiveles")

func _on_NivelesFrame_back() -> void:
	$AnimationPlayer.play("CursosANiveles", -1, -1, true)
