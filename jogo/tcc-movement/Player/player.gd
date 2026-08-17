extends CharacterBody3D

const SPEED = 5.0
@export var mochila: Resource
@onready var mesh: MeshInstance3D = $Mesh #Chamar a malha e alterara a rotacao dela
@onready var interact_area: Area3D = $Mesh/InteractArea

var _current_target: Area3D = null   # item mais recente em range, evita loop toda hora

func _ready() -> void:
	interact_area.area_entered.connect(_on_interact_area_entered)
	interact_area.area_exited.connect(_on_interact_area_exited)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	#Movimentacao do jogador
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		mesh.rotation.y = atan2(-direction.x, -direction.z)
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	if Input.is_action_just_pressed("ui_interact"):
		_try_collect()
	
	move_and_slide()

#Coletar itens
func _on_interact_area_entered(area: Area3D) -> void:
	if area.is_in_group("collectible"):
		_current_target = area
		# Aqui: mostra prompt "Pressione E" na UI.

func _on_interact_area_exited(area: Area3D) -> void:
	if area == _current_target:
		_current_target = null
		# Aqui: esconde prompt.

func _try_collect() -> void:
	if _current_target == null:
		return
	_collect(_current_target)

func _collect(item: Area3D) -> void:
	if mochila == null or not item.has_method("get_item_id"):
		return

	var item_id : int = item.get_item_id()
	if item_id < 0:
		return
	mochila.add_item(item_id)
	print("Mochila (IDs): ", mochila.items)
	_current_target = null
	item.queue_free()
