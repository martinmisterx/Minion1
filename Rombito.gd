extends Area2D

signal rombito_atrapado
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func agarrar_rombito():
	queue_free()

func _on_start_game():
	queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Rombito_area_entered(area):
	if area.get_name() == "Player":
		self.queue_free()
		emit_signal("rombito_atrapado")



