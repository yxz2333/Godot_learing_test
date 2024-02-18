extends State

class_name AttackState

@export var return_state : State

@onready var timer : Timer = $Timer


func state_input(event : InputEvent) -> void:
	if event.is_action_pressed("attack-1"):
		timer.start()


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == "攻击_1":
		if timer.is_stopped():          # 其实个人感觉这样写攻击切换逻辑不太好，因为这样timer必须在这个(0.2s,0.4s)区间内（攻击动画本身4帧）
			next_state = return_state
			playback.travel("移动")
		else:
			playback.travel("攻击_2")
	
	if anim_name == "攻击_2":
		next_state = return_state
		playback.travel("移动")
