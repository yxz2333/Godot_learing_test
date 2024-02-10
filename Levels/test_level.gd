extends Node2D

@onready var tile_map : TileMap = $TileMap
@onready var camera_2d : Camera2D = $Camera2D

func _ready():
	var used = tile_map.get_used_rect().grow(-1) # 稍微缩小一点
	var tile_size = tile_map.tile_set.tile_size
					  
	## 设置摄像机左右极限，没必要设置上下的
	camera_2d.limit_right = used.end.x * tile_size.x
	camera_2d.limit_left = used.position.x * tile_size.x
