extends PlayerStateBase

func start() -> void:
	player.animation_player.play(ANIM_FALL)
	print(STATE_FALL)

func on_physics_process(delta: float) -> void:
	var direction = get_input_direction()
	handle_jump_input()
	update_timer(delta)
	
	if player.jump_buffer_timer > 0 and (player.is_on_floor() or player.coyote_timer > 0):
		clear_timers()
		state_machine.change_to(STATE_JUMP)
		return
	
	player.velocity.x = handle_movement_horizontal(player.velocity.x, direction, delta)
	player.velocity.y += handle_gravity(delta)

	if player.is_on_floor():
		if abs(direction) >= 0.01:
			state_machine.change_to(STATE_RUN)
		else:
			state_machine.change_to(STATE_IDLE)
		return
	
	update_sprite_direction(direction)
	player.move_and_slide()

func on_input(_event: InputEvent):
	pass
	# TODO: proximamente para el dash
