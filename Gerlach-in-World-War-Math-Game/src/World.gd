extends Node2D
var mission = null
func _process(delta):
	if Input.is_action_pressed("ui_interact"):
		mission()
		_ready()

	pass
func _ready():

	$hp/AnimatedSprite.hide()


func _on_Task1_area_entered(area):
	get_node("DialogBox/dialog/Dialog Box/Body_NinePatchRect/MarginContainer/Label2").text = "ตัดต้นไม้"
	get_node("DialogBox/dialog").show()
	mission = "mission1"
	pass # Replace with function body.

func mission():
	if mission == "mission1":
		get_tree().change_scene("res://src/mission/Fight1.tscn")


func _on_Task1_area_exited(area):
	get_node("DialogBox/dialog").hide()
	pass # Replace with function body.


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
