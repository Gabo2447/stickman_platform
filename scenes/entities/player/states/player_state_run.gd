extends PlayerStateBase

func start() -> void:
	player.animation_player.play(ANIM_RUN)
	print(STATE_RUN)

func on_physics_process(delta: float) -> void:
	var direction = get_input_direction()
	player.velocity.x = handle_movement_horizontal(player.velocity.x, direction, delta)
	
	player.coyote_timer = player.COYOTE_DURATION
	update_timer(delta)
	handle_jump_input()

	if player.jump_buffer_timer > 0:
		clear_timers()
		state_machine.change_to(STATE_JUMP)
		return

	if not player.is_on_floor():
		player.velocity.y += handle_gravity(delta)
		state_machine.change_to(STATE_FALL)
		return
	
	if abs(direction) <= 0.01:
		state_machine.change_to(STATE_IDLE)
		return

	update_sprite_direction(direction)
	player.move_and_slide()
