extends State

class_name AirState

@export var landing_state : State
@export var double_jump_velocity : float = -150.0

var has_double_jumped : bool = false 

func state_process(delta):
	if character.is_on_floor(): # 在地面上时，进入着陆状态
		next_state = landing_state

func state_input(event : InputEvent): # 读取输入
	if event.is_action_pressed("jump") and not has_double_jumped: # 连跳判断
		double_jump()

func on_exit(): 
	if next_state == landing_state: # 即将进入着陆状态
		has_double_jumped = false
		playback.travel("跳跃_结束")

func double_jump(): # 连跳
	character.velocity.y = double_jump_velocity
	has_double_jumped = true
	playback.travel("跳跃_连跳")
