extends CharacterBody3D
class_name NPC

@onready var is_zone : bool = false 
func _ready() -> void:
	pass
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_interact") and is_zone:
		print("Estamos conversando...")

func _on_dialogue_collision_area_entered(area: Area3D) -> void:
	if area.is_in_group("player"):
		print(area.get_groups())
		is_zone = true


func _on_dialogue_collision_area_exited(area: Area3D) -> void:
	is_zone = false
