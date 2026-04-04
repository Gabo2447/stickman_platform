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

func handle_movement_horizontal(direction: float) -> float:
	return direction * stats.speed

func is_flip_sprite(velocity: float) -> bool:
	return velocity < 0
