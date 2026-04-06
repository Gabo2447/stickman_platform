extends CharacterBody2D
class_name Player

# --- CONFIGURACIONES ---
@export var stats: PlayerResource

@export_group("Objects")
@export var animation_player: AnimationPlayer
@export var sprite: Sprite2D

var coyote_timer: float = 0.0
const COYOTE_DURATION: float = 0.15 # 150ms es el estándar de la industria

var jump_buffer_timer: float = 0.0
const JUMP_BUFFER_DURATION: float = 0.15 # 150ms es el estándar

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	GameController.player_death.emit()
	AudioManager.play("death")
	queue_free()
