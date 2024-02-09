extends State

class_name LandingState

@export var ground_state : State
@export var jump_velocity : float = -200.0
@export var air_state : State


func state_process(delta) -> void:
	if not character.is_still() or not is_zero_approx(character.velocity.x):
		next_state = ground_state
		playback.travel("移动")

func state_input(event : InputEvent) -> void: # 读入状态事件
	if event.is_action_pressed("jump"): # 发生的是"跳"事件
		jump()

func jump() -> void:
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel("跳跃_开始")
	
func _on_animation_tree_animation_finished(anim_name):
	if anim_name == "跳跃_结束":
		next_state = ground_state
		playback.travel("移动")
