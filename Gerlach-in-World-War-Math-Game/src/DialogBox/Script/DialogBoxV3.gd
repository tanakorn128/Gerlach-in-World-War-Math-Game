extends Node2D
var showdialog
var path = "res://assets/story/chapter1/shot2.json";
var dictionary
#       showdialog  
#var showdialog1 "true" of "false"
#showdialog2 "true" of "false"
#end int

func _ready():
	print(load_showdialog())
	
	pass

func send_dialogbox(end):
	var showdialog = load_showdialog()
	
	
	pass


func load_showdialog():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass("res://assets/story/chapter1/shot2.json",file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;
