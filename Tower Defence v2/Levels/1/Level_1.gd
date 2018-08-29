extends CanvasLayer


var enemy_count = 0

#подгружаем врагов для этой карты
var Enemy1 = preload("res://Enemys/Enemy.tscn")
var Enemy2 = preload("res://Enemys/Enemy.tscn")

# подгружаем два пути для этой карты
var Path1 = preload("res://Levels/1/Path1.tscn")
var Path2 = preload("res://Levels/1/Path2.tscn")

#берем переменную из глобальной ноды
onready var Wave = get_node("/root/Global")

#присваиваем переменные нашим таймерам
onready var timer1 = get_node("Timer1")
onready var timer2 = get_node("Timer1/Timer2")


func _ready():
	timer1.wait_time = 0.1
	timer1.start()
	Wave = 0

func add_enemy():
	if (Wave) == 0:
		
		# добавляем первый путь
		var p = Path1.instance()
		$Map.add_child(p)
		
		# добавляем в первый путь врага
		var e = Enemy1.instance()
		p.get_node('Follow').add_child(e)
	else:
		
		# добавляем второй путь
		var p = Path2.instance()
		$Map.add_child(p)
		
		# добавляем в первый путь врага
		var e = Enemy2.instance()
		p.get_node('Follow').add_child(e)
		    
#func _process(delta):
#	pass

func _on_Timer_timeout():
	timer2.start()
	timer1.stop()
	timer1.wait_time = 100


func _on_Timer2_timeout():
	add_enemy()
	enemy_count +=1
#	print(enemy_count)
	
	if enemy_count == 1:
		enemy_count = 0
		timer2.stop()
		timer1.start()
		Wave = 1-Wave
	
