extends Control

@onready var new_game : Button = $VBoxContainer/StartButton
@onready var v_box_container : VBoxContainer = $VBoxContainer


func _ready():
	new_game.grab_focus() # 设置键盘初始焦点
	
	for button : BaseButton in v_box_container.get_children(): 
		button.mouse_entered.connect(button.grab_focus)  # 设置鼠标焦点


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Game.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
	

func _on_rice_shower_pressed():
	SignalBus.switch_screen()
