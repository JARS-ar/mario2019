extends Control

signal move(curso)


func _on_Btn3ro1raTM_pressed():
	emit_signal('move', 'TM_31')

func _on_Btn3ro2daTM_pressed():
	emit_signal('move', 'TM_32')


func _on_Btn3ro1raTT_pressed():
	emit_signal('move', 'TT_31')


func _on_Btn3ro2daTT_pressed():
	emit_signal('move', 'TT_32')


func _on_Btn4to2daTM_pressed():
	emit_signal('move', 'TM_42')


func _on_Btn4to3raTM_pressed():
	emit_signal('move', 'TM_43')


func _on_Btn4to4taTM_pressed():
	emit_signal('move', 'TM_44')


func _on_Btn4to1raTT_pressed():
	emit_signal('move', 'TT_41')


func _on_Btn4to2daTT_pressed():
	emit_signal('move', 'TT_42')


func _on_exitBtn_pressed():
	get_tree().quit()
