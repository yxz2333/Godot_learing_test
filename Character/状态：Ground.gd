extends State

class_name GroundState

@export var jump_velocity : float = -200.0
@export var air_state : State
@export var ground_state : State

func state_process(delta) -> void:
	if not character.is_on_floor():
		next_state = air_state


func state_input(event : InputEvent) -> void: # 读入状态事件
	if event.is_action_pressed("jump"): # 发生的是"跳"事件
		jump()

func jump() -> void:
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel("跳跃_开始")
