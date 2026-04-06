extends CollectibleBase

func _ready() -> void:
	animation_player.play("start")

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		GameController.coins += 1
		AudioManager.play("coin")
		queue_free()
