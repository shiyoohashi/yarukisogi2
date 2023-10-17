extends Node2D

var direction = Vector2(500, 60).normalized()
var Enemyscene = preload("res://Enemy.tscn")
var Starscene = preload("res://Star.tscn")

var count=-1
var interval=1
var timer=interval
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (timer > interval):
		timer-=interval
		count+=1
		Bgm.score=count
		$Label.text=str(Bgm.score)
	timer+=delta
	pass



func _on_enemy_spawn_timer_timeout():
	if (Bgm.mode == "hard"):
		hardModePop()
	else:
		easyModePop()
	pass # Replace with function body.

func easyModePop():
	$Path2D/PathFollow2D.progress=randi()
	var Enemy = Enemyscene.instantiate()
	Enemy.position = $Path2D/PathFollow2D.position
	Enemy.rotation = ($player.position-Enemy.position).angle()
	Enemy.velocity = ($player.position-Enemy.position).normalized() * 100
	add_child(Enemy)
	pass
	
func hardModePop():
	$Path2D/PathFollow2D.progress=randi()
	var Enemy = Enemyscene.instantiate()
	Enemy.position = $Path2D/PathFollow2D.position
	Enemy.rotation = ($player.position-Enemy.position).angle()
	Enemy.velocity = ($player.position-Enemy.position).normalized() * 500
	add_child(Enemy)
	
	$Path2D/PathFollow2D.progress=randi()
	Enemy.position = $Path2D/PathFollow2D.position
	Enemy.rotation = ($player.position-Enemy.position).angle()
	Enemy.velocity = ($player.position-Enemy.position).normalized() * 500
	add_child(Enemy)
	pass


func _on_star_spawn_timer_timeout():
	var randomNum = (randi() % 10)
	if (randomNum == 7):
		$Path2D/PathFollow2D.progress=randi()
		var Star = Starscene.instantiate()
		Star.position = $Path2D/PathFollow2D.position
		Star.rotation = ($player.position-Star.position).angle()
		Star.velocity = ($player.position-Star.position).normalized() * 100
		add_child(Star)
	pass # Replace with function body.
