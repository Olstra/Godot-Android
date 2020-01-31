extends Button

class_name CustomClass


# Declare member variables here
var WIDTH = 100
var HEIGHT = 100

var SPEED = 100

onready var global_vars = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	# init general properties
	
	# init button texture	
	var txr_temp = load("res://icon.png")
	self.set_button_icon(txr_temp)
	
	# init random position
	#var rand_x = randi() % global_vars.WIN_W + 10
	var rand_y = randi() % global_vars.WIN_H + 10
	self.set_position(Vector2(0, rand_y)) # start at left edge of screen
	
	print("new butt created!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# move from edge towards center
	var pos = self.get_position()
	var dx = SPEED * delta
	self.set_position(Vector2(pos.x + dx, pos.y))
	

func _input(event):
	# delete if was clicked on	
	if event is InputEventMouseButton:
		# check if click within sprite
		var temp = self.get_position()
		
		if event.position.x < temp.x+WIDTH and event.position.y < temp.y+HEIGHT:
			if event.position.x > temp.x and event.position.y > temp.y:
				self.get_parent().remove_child(self)