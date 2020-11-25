extends Node2D
var hp 
func _ready():
	var Exam = get_tree().get_root().find_node("Exam",true,false)
	Exam.connect("Correct",self,"Correct")
	Exam.connect("NotCorrect",self,"NotCorrect")
	hp = hp_Load()
	$TextureProgress.value = hp["HP"]
	pass # Replace with function body.
	
func Correct():
	pass
	
func NotCorrect():

	pass



func hp_Load():
	var dictTemp;
	var file = File.new();
	var path = "res://assets/Player/Player.json";
	file.open(path,file.READ);
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;

func hp_Save(Update):
	var Data = hp_Load()
	Data.HP = Update
	var f = File.new()
	var path = "res://assets/Player/Player.json";
	f.open(path, File.WRITE)
	f.store_string(JSON.print(hp, "  ", true))
	f.close()
	pass
