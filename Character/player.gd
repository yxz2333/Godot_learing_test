extends CharacterBody2D

@export var speed : float = 200.0

@onready var sprite : Sprite2D = $Sprite2D 
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine

var direction : Vector2 = Vector2.ZERO # 读入键盘手柄输入用
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")  # 获取项目设置里设置的重力大小


func _ready():
	animation_tree.active = true

func _physics_process(delta): 
	
	direction = Input.get_vector("left", "right", "up", "down") # 读入x轴和y轴输入	
	
	if not is_on_floor(): # 重力加速度
		velocity.y += gravity * delta  # Vy = g * t 
	
	if direction.x and state_machine.check_if_can_move(): 
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	update_animation_parameters()
	update_facing_directon()
	
func is_still() -> bool:
	var direction = Input.get_axis("left", "right") # 读入x轴输入
	return is_zero_approx(direction) and is_zero_approx(velocity.x)


func update_animation_parameters() -> void: # 设置移动动画对应参数
	animation_tree.set("parameters/移动/blend_position", direction.x)

func update_facing_directon() -> void: # 更新面朝方向
	if direction.x > 0: # 朝右
		sprite.flip_h = false
	elif direction.x < 0: # 朝左
		sprite.flip_h = true
