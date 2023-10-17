extends Area2D

var velocity=Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position+=velocity*delta
	pass

#画面内にいるかどうか　出たら消す
func _on_visible_on_screen_notifier_2d_screen_exited():
	#いい感じに削除
	queue_free()
	pass # Replace with function body.
