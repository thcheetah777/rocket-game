extends Camera2D
class_name Camera

@export var tilt_magnitude = 0.3

func _process(_delta: float) -> void:
	rotation_degrees = -(Globals.player.position - position).x * 0.01 * tilt_magnitude
