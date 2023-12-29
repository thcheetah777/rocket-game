extends CharacterBody2D
class_name Player

@export var gravity = 300
@export var rotate_speed = 140
@export var thrust_speed = 500

@onready var flames := $Flames
@onready var sprite := $Sprite

func _enter_tree() -> void:
	Globals.player = self

func _ready() -> void:
	sprite.self_modulate = Globals.current_level.palette.rocket_color
	flames.self_modulate = Globals.current_level.palette.fire_color

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	var x_input := Input.get_axis("left", "right")
	rotation_degrees += x_input * rotate_speed * delta

	if Input.is_action_pressed("thrust"):
		velocity += Vector2.from_angle(rotation - PI / 2) * thrust_speed * delta

	flames.emitting = Input.is_action_pressed("thrust")

	move_and_slide()

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is Spike:
		get_tree().reload_current_scene()
