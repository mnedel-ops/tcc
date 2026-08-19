class_name InteractionComponent
extends Node

signal target_changed(item: Area3D)   # null = saiu de range; usa pra UI "Pressione E"

@export var interact_area: Area3D

var current_target: Area3D = null

func _ready() -> void:
	interact_area.area_entered.connect(_on_area_entered)
	interact_area.area_exited.connect(_on_area_exited)

func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("collectible"):
		current_target = area
		target_changed.emit(current_target)

func _on_area_exited(area: Area3D) -> void:
	if area == current_target:
		current_target = null
		target_changed.emit(null)

func try_collect() -> Area3D:
	var target := current_target
	current_target = null
	return target
