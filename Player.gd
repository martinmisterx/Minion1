extends Area2D

#signal agarrar_rombito
export var cant_rombitos = 0
signal hit
var pointer_treshold = 50.0
var is_dashing = false
const ACELERACION = 200
var velocidad = Vector2 (0,0)
var screen_size
signal atrapar_rombito
export var isAlive = true

export(float) var speed = 50
export(float) var friction = 0.9
export(int) var vision_range = 700
var has_detected = false
var target:Vector2
var velocity := Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()
	
func _process(delta):
	_update_position(get_local_mouse_position())
	
	
func _physics_process(delta):
	
	if has_detected:
		velocity += target.normalized() * speed
		
	velocity *= friction
	if velocity.length() < 1:
		velocity = Vector2.ZERO
	
	position += velocity * delta


func _update_position(mouse_pos:Vector2):
	
	if mouse_pos.length() <= vision_range:
		target = mouse_pos
		has_detected = true
		#dir.vector = mouse_pos
	else:
		#dir.vector = Vector2.ZERO
		has_detected = false	

func _look_at_mouse():
	look_at(get_global_mouse_position())
# Called every frame. 'delta' is the elapsed time since the previous frame.
	
#func _physics_process(delta):
#	var puntero = get_local_mouse_position()
#	if puntero.length() > pointer_treshold:

#		var direccion = puntero.normalized()
#		position += direccion * ACELERACION * delta
	
func die():
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
	isAlive = false
		
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false


func _on_Player_body_entered(body):
	if body.get_class() == "KinematicBody2D":
		emit_signal("hit")
		
		$CollisionShape2D.set_deferred("disabled", true)
	
	#body.agarrar_rombito()
	#cant_rombitos += 1


func _on_Player_area_entered(area):
	if area.get_name() == "MobTriangulo":
		self.queue_free()
