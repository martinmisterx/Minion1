extends KinematicBody2D

const SPEED = 400
var velocity = Vector2.ZERO

export(float) var speed = 50
export(float) var friction = 0.9
export(int) var vision_range = 700
var has_detected = false
var direccion
var play_posicion

var pos


func fly(dir:Vector2,play):
	direccion = dir
	play_posicion = play.global_position


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	print(play_posicion)
	pos = (play_posicion - global_position).normalized()
	position += SPEED * delta * pos


# Called when the node enters the scene tree for the first time.
	

