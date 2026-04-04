extends PlayerStateBase

func start() -> void:
	player.animation_player.play(ANIM_FALL)
	print(STATE_FALL)

func on_physics_process(delta: float) -> void:
	var direction = Input.get_axis("left", "right")
	player.velocity.x = handle_movement_horizontal(direction)
	
	if player.coyote_timer > 0:
		player.coyote_timer -= delta

	if direction != 0.0:
		player.sprite.flip_h = is_flip_sprite(player.velocity.x)
	
	player.velocity.y += handle_gravity(delta)

	if player.is_on_floor():
		state_machine.change_to(STATE_IDLE)

	player.move_and_slide()

func on_input(event: InputEvent):
	if event.is_action_pressed("jump"):
		if player.coyote_timer > 0:
			player.coyote_timer = 0
			state_machine.change_to(STATE_JUMP)
	
	pass
	# TODO: proximamente para el dash