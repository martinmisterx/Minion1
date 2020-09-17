extends Area2D

signal agarrar_rombito

signal hit

const ACELERACION = 200

var velocidad = Vector2 (0,0)
var screen_size
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()

func _look_at_mouse():
	look_at(get_global_mouse_position())
# Called every frame. 'delta' is the elapsed time since the previous frame.
	
#func _physics_process(delta):
	
	
		
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	$CollisionShape2D.disabled = false

func _on_Area2D_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
