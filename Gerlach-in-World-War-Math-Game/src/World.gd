extends Node2D
func _process(delta):
	if Input.is_action_pressed("ui_interact"):
		_ready()
	$wall_3/AnimationPlayer.play("wall3")

	pass
func _ready():
	$dialog.hide()
	$dialog2.hide()



#####################################################################################################################
#####################################################################################################################
#out Area
#ตู้ไปรษณีย์หน้าบ้าน
var on_body = 0
var on1_body = 0
var on3_body = 0
#####################################################################################################################
#####################################################################################################################
#in Area
#ตู้ไปรษณีย์หน้าบ้าน
func _on__body_entered(body):
	on_body+=1
	if on_body > 1:
		get_node("dialog/Dialog Box/Body_NinePatchRect/Speak_NinePatchRect2/speaker_Label").text = 'ภารกิจ'
		get_node("dialog/Dialog Box/Body_NinePatchRect/MarginContainer/Label2").text= "ตัดต้นไม้ 3 ต้น"
		$dialog.show()
	pass # Replace with function body.

#ต้นไม้
func _on_1_body_entered(body):
	on1_body += 1
	if on1_body > 1:
		get_tree().change_scene("src/mission/Mission_Control.tscn")
	pass # Replace with function body.



func _on_area3_body_entered(body):
	on3_body += 1
	if on3_body > 1:
		$dialog2.show()
		$"dialog2/Dialog Box/Body_NinePatchRect/MarginContainer/Label2".text="กลับไปด้านบน"
	pass # Replace with function body.
