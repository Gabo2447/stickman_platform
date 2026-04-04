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
func handle_gravity(delta: float) -> float:
	return stats.gravity * delta

func handle_movement_horizontal(direction: float, delta) -> float:
	var target_velocity = direction * stats.speed

	if direction != 0:
		return move_toward(player.velocity.x, target_velocity, stats.acceleration * delta)
	else:
		return move_toward(player.velocity.x, 0, stats.acceleration * delta)

func update_sprite_direction(direction: float) -> void:
	if direction != 0:
		player.sprite.flip_h = direction < 0

func update_coyote_timer(delta: float) -> void:
	if player.coyote_timer > 0:
		player.coyote_timer -= delta

func update_buffer_timer(delta: float) -> void:
	if player.jump_buffer_timer > 0:
		player.jump_buffer_timer -= delta

func clear_timers() -> void:
	player.jump_buffer_timer = 0
	player.coyote_timer = 0

# --- FUNCIONES GENERALES ---
func on_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		player.jump_buffer_timer = player.JUMP_BUFFER_DURATION
