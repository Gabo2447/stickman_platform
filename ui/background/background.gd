extends Node2D

@export var camera: Camera2D = null

func _process(_delta: float) -> void:
	if camera != null:
		position = camera.position

func _ready() -> void:
	pass
	# GameManagers.death_player.connect(_on_death_player)

func _on_death_player() -> void:
	set_process(false)
