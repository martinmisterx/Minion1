extends CanvasLayer

signal start_game

func show_message(text):
	$Mensaje.text = text
	$Mensaje.show()
	$MessageTimer.start()


func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$Mensaje.text = "Reintentar"
	$Mensaje.show()
	yield(get_tree().create_timer(1), 'timeout')
	$StartButton.show()
	get_parent().get_node("Player").queue_free()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
	



func _on_MessageTimer_timeout():
	$Mensaje.hide()
