extends Node2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer

@export var animation : String

func _ready():
	animation_player.play(animation)
