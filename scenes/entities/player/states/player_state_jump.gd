extends PlayerStateBase

func start() -> void:
	player.animation_player.play(ANIM_JUMP)
	player.velocity.y = stats.jump_force

func on_physics_process(delta: float) -> void:
	var direction = get_input_direction()
	player.velocity.y += handle_gravity(delta)
	player.velocity.x = handle_movement_horizontal(player.velocity.x, direction, delta)

	handle_jump_input()
	
	if player.velocity.y > 0:
		state_machine.change_to(STATE_FALL)
	
	update_sprite_direction(direction)
	player.move_and_slide()
