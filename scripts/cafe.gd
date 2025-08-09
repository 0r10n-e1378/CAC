extends Node2D

@onready var customer_timer = $Timer

var min_customer_appearance_time = 10

var max_customer_appearance_time = 15

var num_customers_current = 0
var customer_arriving = false
# Called when the node enters the scene tree for the first time.
func _ready():
	print("beginning cafe day") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if num_customers_current < 3 and !customer_arriving:
		setup_random_customer()
	


func setup_random_customer():
	# Set a random wait time for the next ring
	customer_arriving = true
	var random_wait = randf_range(min_customer_appearance_time, max_customer_appearance_time)
	customer_timer.wait_time = random_wait
	customer_timer.timeout.connect(_on_timer_timeout)
	customer_timer.start()
	
func _on_timer_timeout():
	var new_customer = Sprite2D.new()
	new_customer.texture = load("res://sprites/standard_duck.png")
	new_customer.position = get_viewport_rect().get_center()
	new_customer.scale = Vector2(0.3, 0.3)
	var customer_walk = create_tween()
	await customer_walk.tween_property(new_customer, "scale", Vector2(.75,.75), 3)
	add_child(new_customer)
	customer_arriving = false
	num_customers_current+=1
	
	
