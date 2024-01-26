extends State

class_name LandingState

@export var ground_state : State

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == "跳跃_结束":
		next_state = ground_state
		playback.travel("移动")
