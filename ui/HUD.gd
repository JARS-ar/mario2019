extends MarginContainer

onready var life_counter = [$VBoxContainer/HBoxContainer/LifeCounter/L1,
							$VBoxContainer/HBoxContainer/LifeCounter/L2,
							$VBoxContainer/HBoxContainer/LifeCounter/L3,
							$VBoxContainer/HBoxContainer/LifeCounter/L4,
							$VBoxContainer/HBoxContainer/LifeCounter/L5]


func _on_level_start(autor) -> void:
	$VBoxContainer/AutorLabel.text = autor

func _on_Player_life_changed(value) -> void:
	for heart in range(life_counter.size()):
		life_counter[heart].visible = value > heart

func _on_score_changed(value) -> void:
	$VBoxContainer/HBoxContainer/ScoreLabel.text = str(value.x) + ' - ' + str(value.y)
