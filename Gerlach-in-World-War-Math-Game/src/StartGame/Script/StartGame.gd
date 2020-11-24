extends Node2D
var Shot={
	"Shot1":"กาลครั้งหนึ่งนานมาแล้ว ณ โลกที่ทุกอย่างตัดสินกันด้วยคณิตศาสตร์", #shot1
	"Shot2":"ไม่ว่าจะเป็นการต่อสู้ การตัดต้นไม้ การทดสอบต่างๆ ล้วนแล้วแต่ต้องใช้คณิตศาสตร์ในการตัดสินทั้งสิ้น", #shot2
	"Shot3":"และสิ่งมีชีวิตที่มีความเฉลียวฉลาด และมีทักษะในการแก้โจทย์ปัญหาทางคณิตศาสตร์มากที่สุดก็คือมนุษย์", #shot3
	"Shot4":"ด้วยเหตุนี้เองมนุษย์จึงเป็นผู้ที่อยู่บนจุดสูงสุดของห่วงโซ่อาหารของสิ่งมีชีวิตทั้งหมดบนโลกใบนี้", #shot4
	"Shot5":"มนุษย์ได้ทำการรวมกลุ่ม ปกครองกันเอง และจัดตั้งเป็นอาณาจักรเออรี่ขึ้นมา", #shot5
	"Shot6":"ไม่เพียงเท่านั้น มนุษย์นั้นได้ทำการบุกเบิกพื้นที่ส่วนต่างๆของโลกใบนี้ และได้สร้างสิ่งก่อสร้างต่างๆไว้มากมายเช่น เมือง ป้อมปราการ หมู่บ้าน", #shot6
	"Shot7":"ยุคทองของมนุษย์ได้เริ่มต้นขึ้น", #shot7
	"Shot8":"มนุษย์บนโลกใบนี้ใช้ชีวิตอย่างสงบสุข มีชีวิตที่เรียบง่าย และใช้ชีวิตอย่างมีความสุขในทุกๆวัน", #shot8
	"Shot9":"และแล้วฝันร้ายของมนุษย์ก็ได้เริ่มต้นขึ้น", #shot9
	"Shot10":"มีสิ่งมีชีวิตที่ทรงพลังและมีความเฉลียวฉลาดเทียบเท่าหรือมากกว่ามนุษย์กำเนิดขึ้นบนโลก", #shot10
	"Shot11":"มนุษย์เรียกสิ่งมีชีวิตนั้นว่า “ปีศาจ”", #shot11
	"Shot12":"พวกมันมีศักยภาพร่างกายที่สูงกว่ามนุษย์ทั่วไป และที่สำคัญพวกมันมีความเฉลียวฉลาดและทางคณิตศาสตร์ที่สูงมาก", #shot12
	"Shot13":"ปีศาจนั้นต้องการที่จะยึดครองโลกนี้ไว้ภายใต้การปกครองของจอมปีศาจคาราฮานผู้โหดเหี้ยม", #shot13
	"Shot14":"จึงเกิดสงความในการแย่งชิงดินแดนกันระหว่างมนุษย์และปีศาจ", #shot14
	"Shot15":"ผลการต่อสู้คือ ฝั่งมนุษย์พ่ายแพ้ และเสียดินแดนครึ่งหนึ่งไป นั้นคือฝั่งตะวันออกทั้งหมด", #shot15
	"Shot16":"สงครามระหว่างมนุษย์กับปีศาจนั้นได้ดำเนินไปอย่างต่อเนื่อง โดยมีเทือกเขาพลัมขั้นกลางระหว่าง 2 ฝั่ง", #shot16
	"Shot17":"เทือกเขาพลัมเป็นเทือกเขาที่มีความสูงชันมาก ไม่ว่ามนุษย์หรือปีศาจก็ไม่สามารถข้ามภูเขาลูกนี้ไปได้", #shot17
	"Shot18":"จึงทำให้สงครามนั้นเกิดขึ้นในบริเวณช่องแคบพลัม มนุษย์และปีศาจต่างก็จัดกองทัพของตนมาต่อสู้กับอีกฝ่าย", #shot18
	"Shot19":"แต่ฝ่ายของมนุษย์นั้นเสียเปรียบเป็นอย่างมาก เนื่องจากปีศาจมีร่างกายที่แข็งแรงกว่า ทั้งยังมีสติปัญญาที่เทียบเท่าหรือสูงกว่ามนุษย์", #shot19
	"Shot20":"สงครามระหว่างมนุษย์กับปีศาจจะจบอย่างไร . . .", #shot20
	"Shot21":"กรุณาใส่ชื่อตัวละคร", #shot21
	"Shot22":"นี้คือเรื่องราวของเกอราชกับสงครามโลกคณิตศาสตร์ จากช่างตัดไม้ธรรมดาๆสู่การเป็นผู้จบสงครามโลกคณิตศาสตร์", #shot22
	"Shot23":"เกอราชนั้นเป็นเพียงช่างตัดไม้ธรรมดาที่อาศัยอยู่ในป่าของหมู่บ้านทางตอนใต้ เขาใช้ชีวิตอย่างมีความสุข และสงบสุขในป่าและธรรมชาติ", #shot23
	"Shot24":"และแล้วเกอราชก็ต้องพบเจอกับเหตุการณ์ที่เปลี่ยนแปลงชีวิตเขาไปตลอดกาล . . .", #shot24
	}
var loadsave
var Data
var NotEnd = true 
var numshot = 1;
var spacebar = true
signal EndScene2
func _ready():
	loadsave = get_node("/root/SaveGame")
	Data = loadsave.load_json()
	
	if (Data["StartGame"] == "Complate"):
		get_tree().change_scene("res://src/Chapter/Ch1/ch1.tscn")
		pass
	get_node("DialoBox1/Text").text = Shot.Shot1
	get_node("Tabs").hide()
	$DialoBox1.connect("End",self,"Enddialog")
func _process(delta):
	pass
	
func Enddialog():
	spacebar = true
	if numshot == 22:
		get_node("Tabs").show()


func _input(event):
	var StringShot = str(numshot)
	var Data = str("Shot"+StringShot)
	if event.as_text() == "Space" and spacebar:
		if (numshot <= 24):
			get_node("DialoBox1/Text").text = Shot[Data]
			$DialoBox1/Text/AnimationPlayer.play("Present_Visible")
			numshot +=1
			spacebar = false
		else:
			get_tree().change_scene("res://src/Chapter/Ch1/ch1.tscn")
	if numshot == 23: 
		SaveName()
		get_node("Tabs").hide()
	if numshot == 24:
		emit_signal("EndScene2")

func LoadData():
	var dictTemp;
	var file = File.new();
	var path = "res://assets/Player/Player.json";
	file.open(path,file.READ);
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;
func SaveName():
	var Name =  LoadData()
	Name.Name = get_node("Tabs/Name").text
	var f = File.new()
	var path = "res://assets/Player/Player.json";
	f.open(path, File.WRITE)
	f.store_string(JSON.print(Name, "  ", true))
	f.close()

