extends CharacterBody2D
class_name Player

@export var gravity = 300
@export var rotate_speed = 140
@export var thrust_speed = 500

@onready var flames := $Flames
@onready var sprite := $Sprite

var original_pos: Vector2
var broken_rocket_scene = preload("res://particles/broken_rocket.tscn")
var can_move = true

func _enter_tree() -> void:
	Globals.player = self

func _ready() -> void:
	sprite.self_modulate = Globals.current_level.palette.rocket_color
	flames.self_modulate = Globals.current_level.palette.fire_color

	original_pos = position

func _physics_process(delta: float) -> void:
	if not can_move: return

	if not is_on_floor():
		velocity.y += gravity * delta

	var x_input := Input.get_axis("left", "right")
	rotation_degrees += x_input * rotate_speed * delta

	if Input.is_action_pressed("thrust"):
		velocity += Vector2.from_angle(rotation - PI / 2) * thrust_speed * delta

	flames.emitting = Input.is_action_pressed("thrust")

	move_and_slide()

func die():
	var broken_rocket = broken_rocket_scene.instantiate() as Node2D
	broken_rocket.position = position
	Globals.current_level.add_child(broken_rocket)

	position = original_pos
	rotation = 0
	velocity = Vector2.ZERO

func go_into_portal(portal: Portal):
	can_move = false
	velocity = Vector2.ZERO
	flames.emitting = false
	var tweener = get_tree().create_tween().set_parallel(true)
	tweener.tween_property(self, "scale", Vector2.ZERO, 1)
	tweener.tween_property(self, "global_position", portal.position, 1)
	tweener.tween_property(self, "global_rotation_degrees", global_rotation_degrees + 360, 1)

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is Spike:
		call_deferred("die")
