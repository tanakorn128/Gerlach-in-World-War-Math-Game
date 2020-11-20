extends Control
onready var health_Bar = $"Health Bar"
onready var update_Weet = $Tween

func _process(delta):
	
	pass

func _on_health_update(health):
	health_Bar .value = health
	update_Weet.interpolate_property(health_Bar, "value",
		health_Bar.value, health, 0.4,
		Tween.TRANS_SINE, Tween.EASE_IN_OUT,0.4)
	update_Weet.start()





