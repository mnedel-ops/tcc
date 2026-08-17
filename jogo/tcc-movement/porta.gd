class_name SceneDoor
extends Area3D

@export var new_level_scene: PackedScene
@export var spawn_point_name: String

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node3D) -> void:
	if not body.is_in_group("player"):
		return

	var scene_manager := get_tree().get_first_node_in_group("scene_manager") as SceneManager
	if scene_manager == null:
		push_error("SceneManager nao encontrado")
		return

	scene_manager.change_level(new_level_scene, spawn_point_name)
