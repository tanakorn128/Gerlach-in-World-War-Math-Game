extends Node2D

var ID_Item
var SAVE_DIR = "user://chater1/" 
var save_path = SAVE_DIR + "5.dat"
var n: int = 1
var question
var answer1 
var answer2
var answer3
var answer4
func _on_Button_pressed():
	
	var data = ["","","","","",""] 
	data[ID_Item] = {
	"Num_ID": n,
	"question" : $question.text,
	"answer1" : $answer_1.text,
	"answer2" : $answer_2.text,
	"answer3" : $answer_3.text,
	"answer4" : $answer_4.text
	}
	#var xx = data[0]
	#print(xx["question"])
	#create Directory
	var dir = Directory.new()
	# not Directory and create Directory
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
		#create file
	var file = File.new()
	# Check error
	var error = file.open(save_path,File.WRITE) #เขียน save data
	if error == OK:
		# ใส่ข้อมูลลงใน file
		file.store_var(data) 
		file.close()
	pass # Replace with function body.
	
func _ready():
	pass


func _on_load_pressed(): # load data file
	
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path,file.READ)
		if error == OK:
			var Get_text = file.get_var()
			file.close()
			var data = ["","","","","",""]  
			data = {
				"Num_ID": "n",
				"question" : $question.text,
				"answer1" : $answer_1.text,
				"answer2" : $answer_2.text,
				"answer3" : $answer_3.text,
				"answer4" : $answer_4.text
			}
			data = Get_text[ID_Item ]
			question = data["question"]
			answer1 = data["answer1"]
			answer2 = data["answer2"]
			answer3 = data["answer3"]
			answer4 = data["answer4"]
			#print(data["question"] + 
			#data["answer1"] +
			#data["answer2"] +
			#data["answer3"] +
			#data["answer4"])
	pass # Replace with function body.


func _on_delete_pressed(): #delete data file
	var dir = Directory.new()
	dir.remove(save_path)
	pass # Replace with function body.
	





func _on_edit_pressed():
	_on_load_pressed()
	$question.insert_text_at_cursor(question)
	$answer_1.insert_text_at_cursor(answer1)
	$answer_2.insert_text_at_cursor(answer2)
	$answer_3.insert_text_at_cursor(answer3)
	$answer_4.insert_text_at_cursor(answer4)
	
	pass # Replace with function body.


func _on_number_pressed():
	

	pass # Replace with function body.


func _on_number_item_selected(index):
	ID_Item = index+1
	pass # Replace with function body.
