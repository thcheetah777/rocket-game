extends Node

@onready var player := $AnimationPlayer
@onready var color_rect_top := $Canvas/ColorRectTop
@onready var color_rect_bottom := $Canvas/ColorRectBottom

var main_menu = preload("res://main_menu.tscn")

func next_level():
	var level_num = get_tree().current_scene.name.erase(0, 6).to_int()
	var next_level_path = "res://levels/level_%s.tscn" % str(level_num + 1)
	if ResourceLoader.exists(next_level_path):
		var level = load(next_level_path)
		change_scene(level)

func change_scene(scene: PackedScene):
	player.play_backwards("transition")
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(scene)
	await get_tree().create_timer(1).timeout
	player.play("transition")
