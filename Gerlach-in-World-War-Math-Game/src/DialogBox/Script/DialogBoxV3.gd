extends Node2D
var showdialog
var path = "res://assets/story/chapter1/shot2.json";
var path2 = "res://assets/story/chapter1/showdialog.json";
var dictionary
var dictionary2


#       showdialog  
#var showdialog1 "true" of "false"
#showdialog2 "true" of "false"
#end int

func _ready():
	send_dialogbox(1,10)
	save_showdialog()
	
	print(load_showdialog())
	pass

func send_dialogbox(dialogbox,end):
	dictionary2 = load_showdialog()
	dictionary2["end"] = str(end)
	if dialogbox == 1:
		dictionary2["showdialog1"] = "false"
		pass
	if dialogbox == 2:
		dictionary2["showdialog2"] = "false"
	save_showdialog()
	pass
	




func save_showdialog():
	var save_game = File.new()
	save_game.open_encrypted_with_pass(path2,File.WRITE, "mypass")
	var string_output = JSON.print(dictionary2.duplicate(true)," ")
	save_game.store_string(string_output)
	save_game.close()

func load_showdialog():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass(path2,file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;

func load_shot2():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass(path,file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;
	
func save_shot2():
	var save_game = File.new()
	save_game.open_encrypted_with_pass(path,File.WRITE, "mypass")
	var string_output = JSON.print(dictionary.duplicate(true)," ")
	save_game.store_string(string_output)
	save_game.close()
