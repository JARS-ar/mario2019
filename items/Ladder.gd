tool extends Area2D

export var longitud: int = 1 setget set_longitud

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_longitud(value):
	if value > 0:
		longitud = value
		$CollisionShape2D.shape.extents.y =  value * 8



func _on_Ladder_body_entered(body):
	if body.name == "Player":
		body.is_on_ladder = true


func _on_Ladder_body_exited(body):
	if body.name == "Player":
		body.is_on_ladder = false
