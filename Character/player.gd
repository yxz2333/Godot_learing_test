extends CharacterBody2D


@export var speed : float = 200.0

@onready var sprite : Sprite2D = $Sprite2D 
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine

var direction : Vector2 = Vector2.ZERO # 读入键盘手柄输入用
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")  # 获取项目设置里设置的重力大小

var animation_locked : bool = false # 写动画转换（update_animation）用
var was_on_air : bool = false # 写跳跃用的


func _ready():
	animation_tree.active = true

func _physics_process(delta): 
	
	if not is_on_floor(): # 重力加速度
		velocity.y += gravity * delta  # Vy = g * t 

	
	direction = Input.get_vector("left", "right", "up", "down") # 读入x轴和y轴输入
	
	if direction.x and state_machine.check_if_can_move(): 
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	update_animation_parameters()
	update_facing_directon()

func update_animation_parameters(): # 更新动画的函数
	animation_tree.set("parameters/移动/blend_position", direction.x)

func update_facing_directon(): # 更新面朝方向
	if direction.x > 0: # 朝右
		sprite.flip_h = false
	elif direction.x < 0: # 朝左
		sprite.flip_h = true
