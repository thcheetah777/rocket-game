extends RigidBody2D

@onready var sprite := $Sprite
@onready var timer := $Timer

func _ready() -> void:
	sprite.self_modulate = Globals.current_level.palette.rocket_color
	apply_impulse(Vector2.from_angle(deg_to_rad(randf_range(0, 360))) * 100)

	await get_tree().create_timer(randf_range(0.8, 1.5)).timeout

	timer.start()
	get_tree().create_timer(1).timeout.connect(queue_free)

func _on_timer_timeout() -> void:
	if sprite.self_modulate.a == 0:
		sprite.self_modulate.a = 1
	else:
		sprite.self_modulate.a = 0
