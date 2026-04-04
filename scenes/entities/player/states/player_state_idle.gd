extends PlayerStateBase

const IDLE_WAIT_TIME: float = 5.0
var idle_timer: Timer

func start() -> void:
	player.animation_player.play(ANIM_IDLE)
	print(STATE_IDLE)

	if not idle_timer:
		idle_timer = Timer.new()
		add_child(idle_timer)

		idle_timer.one_shot = true
		idle_timer.wait_time = IDLE_WAIT_TIME
		idle_timer.timeout.connect(_on_timer_timeout)
	
	idle_timer.start()

func end() -> void:
	idle_timer.stop()

func on_physics_process(delta: float) -> void:
	var direction = Input.get_axis("left", "right")
	player.velocity.x = handle_movement_horizontal(direction)

	if not player.is_on_floor():
		player.velocity.y += handle_gravity(delta)
		state_machine.change_to(STATE_FALL)
		return
	else:
		player.coyote_timer = player.COYOTE_DURATION
	
	if abs(direction) >= 0.01: # No se si esta bien, los ternarios son dificiles para mi
		state_machine.change_to(STATE_RUN)
		return

	player.move_and_slide()

func on_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		state_machine.change_to(STATE_JUMP)
	
	# TODO: En el futuro agregar un DASH system funcional y sistema de dmg


# --- TIMER ---
func _on_timer_timeout():
	if state_machine.current_state == self:
		player.animation_player.play(ANIM_WAIT)
