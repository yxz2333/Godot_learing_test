extends State

class_name GroundState

@export var jump_velocity : float = -200.0
@export var air_state : State
@export var ground_state : State
@export var attack_state : State

func state_process(delta) -> void:
	if not character.is_on_floor():
		next_state = air_state

func state_input(event : InputEvent) -> void: # 读入状态事件
	if event.is_action_pressed("jump"): 
		jump()
	if event.is_action_pressed("attack-1"):
		attack()


func jump() -> void:
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel("跳跃_开始")
	
func attack() -> void:
	next_state = attack_state
	playback.travel("攻击_1")
