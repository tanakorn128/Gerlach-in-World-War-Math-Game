extends Node
var path = "res://assets/Player/SaveCh1.json"
var pathhp = "res://assets/Player/Player.json"
var dictionary = {
	"StartGame": "NotComplate",
	"Tree1": "NotComplete",
	"Tree2": "NotComplete",
	"Tree3": "NotComplete",
	"Tree4": "NotComplete"
}
var Player = {
  "HP": 100,
  "Name": "Gerlach"
}

var Data

func _ready():
	Data = load_json()
	print(Data)

func Save_json():
	var save_game = File.new()
	save_game.open_encrypted_with_pass(path,File.WRITE, "mypass")
	var string_output = JSON.print(dictionary.duplicate(true)," ")
	save_game.store_string(string_output)
	save_game.close()

func Save_json_Hp():
	var f = File.new()
	f.open(pathhp, File.WRITE)
	f.store_string(JSON.print(Player, "  ", true))
	f.close()
	
	
func load_json():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass(path,file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;
