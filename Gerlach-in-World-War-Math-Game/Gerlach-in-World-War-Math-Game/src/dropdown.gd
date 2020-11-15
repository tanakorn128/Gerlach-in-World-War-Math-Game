extends OptionButton

func _process(delta):
	pass
func _ready():
	self.add_item("1",1)
	self.add_item("2",1)
	self.add_item("3",1)
	#self.clear()



func _on_number_item_selected(index):
	#print(index)
	pass # Replace with function body.
