extends Node2D
var SpaceBar = false
var global
func _ready():
	var Exam = get_tree().get_root().find_node("Exam",true,false)
	Exam.connect("Correct",self,"Correct")
	Exam.connect("NotCorrect",self,"NotCorrect")
	global = get_node("/root/Global")
	pass
	
func Correct():
	print("C")
	pass
func NotCorrect():
	$ColorRect/Label.text = str("เฉลย "+global.Correct)
	$ColorRect.show()
	$Timer.start()
	pass



func _on_Timer_timeout():
	$ColorRect.hide()
	pass # Replace with function body.
