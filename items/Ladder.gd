tool extends Area2D

export var longitud: int = 1 setget set_longitud
onready var shape_node = $CollisionShape2D

func set_longitud(value) -> void:
	if !shape_node:
		shape_node = $CollisionShape2D
	shape_node.shape = RectangleShape2D.new()
	
	if value > 0:
		longitud = value
		shape_node.shape.extents =  Vector2(8, value * 8)

func _on_Ladder_body_entered(body) -> void:
	if body.name == "Player":
		body.is_on_ladder += 1

func _on_Ladder_body_exited(body) -> void:
	if body.name == "Player":
		body.is_on_ladder -= 1
