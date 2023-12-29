extends Node

var player: Player
var current_level: Level
var time = 0.0

func _process(delta: float) -> void:
	time += delta
