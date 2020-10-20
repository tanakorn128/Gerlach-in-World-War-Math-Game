extends OptionButton

func _process(delta):
	pass
func _ready():
	self.add_item("1",0)
	self.add_item("2",1)
	self.add_item("3",2)
	self.select(0)
	print(self.get_selected())
	#self.clear()



func _on_number_item_selected(index):
	#print(index)
	pass # Replace with function body.
