extends Node

## 编写可受伤属性
class_name Damageable

@export var health : float = 20

func hit(damage : int):
	health -= damage
	if health <= 0:
		get_parent().queue_free() # 没血了，直接把父节点（Snail）和下面的子节点全部删光
