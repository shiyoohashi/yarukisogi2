extends Node

var bgm_player : AudioStreamPlayer = AudioStreamPlayer.new()
var bgm_stream : AudioStream = preload("res://Love_it_Rabbit.ogg")
var score
var mode
func _ready():
	# BGMプレイヤーをシーンに追加
	score=-1
	mode="easy"
	add_child(bgm_player)

	# BGMを設定
	bgm_player.stream = bgm_stream



