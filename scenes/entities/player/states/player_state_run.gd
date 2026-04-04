extends PlayerStateBase

func start() -> void:
	player.animation_player.play(ANIM_RUN)
	print(STATE_RUN)