extends Control

var screen_size
#var BgmScene=preload("res://bgm.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size=get_viewport_rect().size
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	Bgm.mode="hard"
	get_tree().change_scene_to_file("res://maingame.tscn")
	pass # Replace with function body.


func _on_easy_button_pressed():
	Bgm.mode="easy"
	get_tree().change_scene_to_file("res://maingame.tscn")
	pass # Replace with function body.


func _on_timer_timeout():
	if ($Label2.visible == true):
		$Label2.visible=false
	else:
		$Label2.visible=true
	pass # Replace with function body.
