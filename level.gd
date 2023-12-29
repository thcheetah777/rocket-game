@tool
extends Node2D
class_name Level

@export var palette: PaletteResource = null:
	set(value):
		palette = value
		update_configuration_warnings()

func _enter_tree() -> void:
	Globals.current_level = self

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = []

	if palette == null:
		warnings.append("Please attach a color palette.")

	return warnings
