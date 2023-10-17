extends Area2D

@export var speed=400
signal hit
var screen_size
var star_time = false
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size=get_viewport_rect().size
	$AnimatedSprite2D.animation="default"
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move down"):
		velocity.y=+1
		#$AnimatedSprite2D.animation="default"
		$AnimatedSprite2D.flip_v = true
	if Input.is_action_pressed("move up"):
		velocity.y=-1
		#$AnimatedSprite2D.animation="default"
		$AnimatedSprite2D.flip_v = false
	if Input.is_action_pressed("move right"):
		velocity.x=+1
		#$AnimatedSprite2D.animation="default"
		$AnimatedSprite2D.flip_v = false
	if Input.is_action_pressed("move left"):
		velocity.x=-1
		#$AnimatedSprite2D.animation="default"
		$AnimatedSprite2D.flip_h = true
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.play()
	# position=+velocity*delta*speed
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	pass


#他のエリアが入ってきたら呼ばれる
func _on_area_entered(area):
	var type = area.scene_file_path.get_basename()
	if (type == "res://Star"):
		star_time = true
		$StarTimer.start()
		$AnimatedSprite2D.animation="star"
		area.queue_free()
	else:
		if (star_time == false):
			get_tree().change_scene_to_file("res://gameover.tscn")
	pass # Replace with function body.


func _on_star_timer_timeout():
	star_time = false
	$AnimatedSprite2D.animation="default"
	pass # Replace with function body.
