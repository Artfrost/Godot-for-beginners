extends Node2D

var max_health
var current_health
onready var health = get_node("progress_line")

func _ready():
	print (health)
	pass

func init(max_health, current_health):
	self.max_health = max_health * 1.0
	self.current_health = clamp(current_health * 1.0, 0, max_health)
	update()
	
	
func set_health(value):
	current_health = clamp(value, 0, max_health)
	update()
	

func update():
	var percent = current_health / max_health
	health.set_scale(Vector2(percent,1))