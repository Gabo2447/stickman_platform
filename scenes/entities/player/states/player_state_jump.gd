extends PlayerStateBase

func start() -> void:
	player.animation_player.play(ANIM_JUMP)
	player.velocity.y = stats.jump_force

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("left", "right")

	player.velocity.y += handle_gravity(delta)
	player.velocity.x = handle_movement_horizontal(direction)

	if player.velocity.x != 0:
		player.sprite.flip_h = is_flip_sprite(player.velocity.x)
	
	if player.velocity.y < 0:
		state_machine.change_to(STATE_FALL)
