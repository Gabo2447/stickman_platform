extends Camera2D

@export var follow_object: CharacterBody2D
@export var lerp_speed: float = 10.0

func _ready() -> void:
	get_tree().root.size_changed.connect(_on_size_changed)

	# if GameEvents.has_signal("on_player_death"):
	# 	GameEvents.on_player_death.connect(_on_player_death)

	# Configuration
	# limit_left = 0
	limit_bottom = 128
	process_callback = Camera2D.CAMERA2D_PROCESS_PHYSICS

	
func _process(_delta: float) -> void:
	if is_instance_valid(follow_object):
		# print(true) (Si funciona)
		global_position.x = follow_object.global_position.x
		# global_position = global_position.lerp(follow_object.global_position, lerp_speed * delta)

# --- SIGNAL HANDLERS ---
func _on_player_death() -> void:
	# Stop following the player when they die
	follow_object = null
	set_process(false)

func _on_size_changed() -> void:
	var base_design = Vector2(1080, 720)
	var current_size = get_viewport_rect().size

	var scale_x = current_size.x / base_design.x
	var scale_y = current_size.y / base_design.y

	var scale = min(scale_x, scale_y)
	zoom = Vector2(scale, scale)