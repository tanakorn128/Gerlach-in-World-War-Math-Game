extends Node2D
var savegame

func _ready():
	savegame = get_node("/root/SaveGame")
	
	
func _on_Button_pressed():
	get_tree().change_scene("res://src/MainMenu/Menu.tscn")
	pass # Replace with function body.


func _on_Audio_pressed():
	get_tree().change_scene("res://src/MainMenu/Audio.tscn")
	pass # Replace with function body.


func _on_Display_pressed():
	get_tree().change_scene("res://src/MainMenu/Display.tscn")
	pass # Replace with function body.


func _on_Reset_pressed():
	savegame.Save_json()
	savegame.Save_json_Hp()
	print("Reset")
	pass # Replace with function body.
