extends Node2D

onready var triangulo_template = preload("res://MobTriangulo.tscn")

var direction := Vector2(0, -1)
var rotation_velocity : float = 0
var propulsion : float = 0
var velocity = Vector2.ZERO
var is_ready = false

var player


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass


func fire():
	
	var triangulo:KinematicBody2D = triangulo_template.instance()
	triangulo.global_position = $Position2D.global_position
	triangulo.fly(direction.rotated(rotation),player)
	get_parent().add_child(triangulo)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func start():
	is_ready = true
	



func _on_TrianguloTimer_timeout():
	fire()
