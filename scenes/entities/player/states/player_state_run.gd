extends PlayerStateBase

func start() -> void:
	player.animation_player.play(ANIM_RUN)
	print(STATE_RUN)

func on_physics_process(delta: float) -> void:
	var direction = Input.get_axis("left", "right")
	player.velocity.x = handle_movement_horizontal(direction)

	if not player.is_on_floor():
		player.velocity.y += handle_gravity(delta)
		state_machine.change_to(STATE_FALL)
		return
	
	if abs(direction) <= 0.01:
		state_machine.change_to(STATE_IDLE)
		return

	player.move_and_slide()

func on_input(event: InputEvent):
	if event.is_action_pressed("jump"):
		state_machine.change_to(STATE_JUMP)