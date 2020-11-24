extends Node2D

func _ready():
	var Exam = get_tree().get_root().find_node("Exam",true,false)
	Exam.connect("Correct",self,"Correct")
	Exam.connect("NotCorrect",self,"NotCorrect")
	pass # Replace with function body.

func Correct():
	pass
	
func NotCorrect():
	$TextureProgress.value -= 20
	pass
