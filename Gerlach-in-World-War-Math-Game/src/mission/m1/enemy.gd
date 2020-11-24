extends Node2D

func _ready():
	var Exam = get_tree().get_root().find_node("Exam",true,false)
	Exam.connect("Correct",self,"Correct")
	Exam.connect("NotCorrect",self,"NotCorrect")
	pass
	
func Correct():
	$TextureProgress.value -= 20
	pass
func NotCorrect():
	pass
