extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func zoom():
	position = get_viewport_rect().size/2
	scale*=2


func _on_area_2d_mouse_entered():
	zoom() # Replace with function body.
