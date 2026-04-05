extends StateBase
class_name PlayerStateBase

# --- VARIABLES ---
@onready var player: Player = owner as Player
@onready var stats: PlayerResource = player.stats as PlayerResource

# --- CONSTANTES ---
var STATE_FALL: String = "PlayerStateFall"
var STATE_JUMP: String = "PlayerStateJump"
var STATE_IDLE: String = "PlayerStateIdle"
var STATE_RUN: String = "PlayerStateRun"

var ANIM_FALL: String = "fall"
var ANIM_JUMP: String = "jump"
var ANIM_WAIT: String = "wait"
var ANIM_IDLE: String = "idle"
var ANIM_RUN: String = "run"

# --- FUNCIONES REUSABLES ---
func get_input_direction() -> float:
	return Input.get_axis("left", "right")

func handle_gravity(delta: float) -> float:
	return stats.gravity * delta

func handle_movement_horizontal(current_velocity: float, direction: float, delta: float) -> float:
	var target_velocity = direction * stats.speed
	var weight = stats.acceleration if direction != 0 else stats.friction
	return move_toward(current_velocity, target_velocity, weight * delta)

func update_sprite_direction(direction: float) -> void:
	if direction != 0:
		player.sprite.flip_h = direction < 0

func update_timer(delta: float) -> void:
	if player.jump_buffer_timer > 0:
		player.jump_buffer_timer -= delta
	if player.coyote_timer > 0:
		player.coyote_timer -= delta

func clear_timers() -> void:
	player.jump_buffer_timer = 0
	player.coyote_timer = 0

func handle_jump_input() -> void:
	if Input.is_action_just_pressed("jump"):
		player.jump_buffer_timer = player.JUMP_BUFFER_DURATION
