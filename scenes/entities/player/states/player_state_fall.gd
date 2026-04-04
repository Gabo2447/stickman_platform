extends PlayerStateBase

func start() -> void:
	player.animation_player.play(ANIM_FALL)
	print(STATE_FALL)

func on_physics_process(delta: float) -> void:
	var direction = Input.get_axis("left", "right")
	player.velocity.x = handle_movement_horizontal(direction, delta)

	update_buffer_timer(delta)
	update_coyote_timer(delta)
	
	if player.jump_buffer_timer > 0 and player.coyote_timer > 0:
		clear_timers()
		state_machine.change_to(STATE_JUMP)
		return
	
	player.velocity.y += handle_gravity(delta)

	if player.is_on_floor():
		state_machine.change_to(STATE_IDLE)

	update_sprite_direction(direction)
	player.move_and_slide()

func on_input(_event: InputEvent):
	pass
	# TODO: proximamente para el dash
