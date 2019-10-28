extends KinematicBody2D

export (Vector2) var velocity

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.name == 'Player':
			return
		velocity = velocity.bounce(collision.normal)