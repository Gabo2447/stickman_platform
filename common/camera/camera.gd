extends Camera2D

@export var follow_object: CharacterBody2D
@export var lerp_speed: float = 10.0

func _ready() -> void:
	GameController.player_death.connect(_on_player_death)
	process_callback = Camera2D.CAMERA2D_PROCESS_PHYSICS
	limit_bottom = 128
	
func _physics_process(delta: float) -> void:
	if is_instance_valid(follow_object):
		var target_pos = follow_object.global_position
		global_position.x = lerp(global_position.x, target_pos.x, lerp_speed * delta)
		global_position.y = target_pos.y

# --- SIGNAL HANDLERS ---
func _on_player_death() -> void:
	follow_object = null
	set_physics_process(false)