extends Node2D

var speed = 50
var max_health = 100
var health = max_health

var oldx = 0.0
var oldy = 0.0
var curx = 0.0
var cury = 0.0
var distance = 0.0
var old_distance = 0.0
var anim = "idle"

onready var parent = $".."
onready var health_bar = get_node("health_bar")
onready var info = $"../../../..".get_node("Label")

func _ready():
	health_bar.init(max_health, health)
	$Sprite.play(anim)

func _process(delta):
	
	parent.set_offset( parent.get_offset() + speed * delta )
	distance = parent.get_unit_offset()
	curx = parent.position.x
	cury = parent.position.y

	if distance > old_distance + 0.01:
#		info( str(distance - old_distance) )
		animations()

func animations():

	if cury > oldy + 2.0 && anim != "run_down":
		anim = "run_down"
		$Sprite.play(anim)
		info(anim)

	if cury < oldy - 2.0 && anim != "run_up":
		anim = "run_up"
		$Sprite.play(anim)
		info(anim)

	if curx > oldx + 2.0 && anim != "run_right":
		anim = "run_right"
		$Sprite.play(anim)
		info(anim)
		
	if curx < oldx - 2.0 && anim != "run_left":
		anim = "run_left"
		$Sprite.play(anim)
		info(anim)
		
	oldx = parent.position.x
	oldy = parent.position.y
	old_distance = distance

# враг дошел до конца пути
	if (distance) >= 1:
		print("ВРАГ ПРОШЕЛ !")
		$"../../".queue_free()
		
func info(text):
	info.set_text( text )
