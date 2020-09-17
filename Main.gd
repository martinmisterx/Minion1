extends Node


onready var circulo_negro_template = preload("res://CirculoNegro.tscn")
onready var jugador_template = preload("res://Player.tscn")
onready var rombito_template = preload("res://Rombito.tscn")
var puntuacion = 0

var player
var isAlive


# Called when the node enters the scene tree for the first time.
func _ready():
	player = jugador_template.instance()
	isAlive = player.isAlive
	$CirculoNegro.player = $Player
	var rand = RandomNumberGenerator.new()
	var screen_size = get_viewport().get_visible_rect().size
	for i in range(0,3):
		var circulo_negro = circulo_negro_template.instance()
		rand.randomize()
		var x = rand.randf_range(0,screen_size.x)
		rand.randomize()
		var y = rand.randf_range(0,screen_size.y)
		circulo_negro.position.y = y
		circulo_negro.position.x = x
		add_child(circulo_negro)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	isAlive = player.isAlive
	if not isAlive:
		$HUD.show_game_over()
	#get_child(3).enviar(player)


func _on_HUD_start_game():
	puntuacion = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(puntuacion)
	$HUD.show_message("Ready")
	$CirculoNegro.start()



func _on_StartTimer_timeout():
	$RombitoTimer.start()
	$TrianguloTimer.start()


func _on_RombitoTimer_timeout():
	var rombito:Area2D = rombito_template.instance()
	add_child(rombito)
	var viewport_size = get_viewport().size
	var rndX = rand_range(0,viewport_size.x)
	var rndY = rand_range(0,viewport_size.y)
	rombito.position = Vector2(rndX,rndY)


func _on_Player_hit():
	#$ScoreTimer.stop()
	#$MobTimer.stop()
	$HUD.show_game_over()


func _on_Rombito_rombito_atrapado():
	puntuacion += 1
	$HUD.update_score(puntuacion)
