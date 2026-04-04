extends PlayerStateBase

func start() -> void:
	player.animation_player.play(ANIM_FALL)

func on_physics_process(delta: float) -> void:
	var direction = Input.get_axis("left", "right")

	if direction != 0.0:
		player.velocity.x = handle_movement_horizontal(direction)
		player.sprite.flip_h = is_flip_sprite(player.velocity.x)
	
	player.velocity.y += handle_gravity(delta)

	if player.is_on_floor():
		state_machine.change_to(STATE_IDLE)

	player.move_and_slide()

func on_input(_event: InputEvent):
	pass
	# TODO: proximamente para el dash