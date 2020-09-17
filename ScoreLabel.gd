extends Label

export var texto = "Score:: "

func _ready():
	text = texto + str(0)
	pass # Replace with function body.

func _update(score):
	text = score + str(score)

func _process(_delta):
	pass
