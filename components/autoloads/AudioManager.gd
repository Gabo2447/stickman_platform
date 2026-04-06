extends Node

const SOUNDS = {
	"coin": preload("res://assets/sfx/Coin.wav"),
	"interface": preload("res://assets/sfx/Interface.wav"),
	"interface_magic": preload("res://assets/sfx/InterfaceMagic.wav"),
	"special_collectible": preload("res://assets/sfx/SpecialCollectible.wav"),
	"death": preload("res://assets/sfx/Death.wav")
}

var pool_size: int = 12
var players_pool: Array = []

# --- FUNCIONES ---
func _ready() -> void:
	for i in range(pool_size):
		var p = AudioStreamPlayer.new()
		add_child(p)
		p.bus = "SFX"
		players_pool.append(p)

func play(sound_key: String):
	if not SOUNDS.has(sound_key):
		push_error("[AudioManager] Sound NOT FOUND: " + sound_key)
		return

	var player = _get_idle_player()
	if player:
		player.stream = SOUNDS[sound_key]
		player.pitch_scale = randf_range(0.9, 1.1)
		player.play()

func _get_idle_player():
	for p in players_pool:
		if not p.playing:
			return p
	return players_pool[0]