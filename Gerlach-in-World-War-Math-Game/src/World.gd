extends Node2D
var mission = null
var on_body = 0
var Scene3 = false
var numshot = 2;
var Shot={
	"shot2": "!!!...",
	"shot3": "ยินดีต้อนรับสู่โลกของคณิตศาสตร์ ในโลกแห่งนี้ทุกอย่างล้วนแต่ตัดสินกันด้วยคณิตศาสตร์",
	"shot4": "การต่อสู้ก็เช่นกัน ผู้ที่สามารถทำโจทย์ได้มากกว่าก็จะเป็นผู้ชนะไป",
	"shot5": "เอาหล่ะสำหรับการครบคุมนั้น เราจะใช้ปุ่ม WASD ในการเคลื่อนที่ของตัวละคร Space bar ใช้ในการตอบตกลงต่างๆ และใช้การคลิกเมาย์ซ้ายในการเลือกตอบคำถาม",
	"shot6": "เป็นไงควบคุมไม่ยากเลยใช่ไหมหล่ะ ฮ่าๆ เอาหล่ะมาดูในส่วนของเนื้อเรื่องบ้าง",
	"shot7": "เกอราชกับสงครามโลกคณิตศาสตร์นั้นมีเนื้อเรื่องทั้งหมด 16 chapter",
	"shot8": "โดยในแต่ละ chapter จะมีภารกิจที่แตกต่างกันออกไป",
	"shot9": "จะต้องทำการเคลียร์ภารกิจทั้งหมด เพื่อที่จะปลดล็อค chapter ถัดไป",
	"shot10": "และการบันทึกเกมนั้น สามารถบันทึกเกมได้ที่ตู้จดหมายประจำแต่ละ chapter ",
	"shot11": "ฮิๆ ข้ารู้ว่าเจ้าพร้อมแล้ว",
	"shot12": "มาจบสงครามโลกคณิตศาสตร์นี้ด้วยกันเถอะ",
	"shot13": "CH1 ช่างตัดไม้ กับ ปีศาจ",
	"shot14": "ภารกิจ : ตัดต้นไม้ขนาดใหญ่ 4 ต้นที่กระจัดกระจายอยู่ภายในป่า",
	"shot15": "(TIP สามารอ่านป้ายในป่าเพื่อนำทางไปสู่ต้นไม้ได้)",
	"shot16": "ตัดต้นไม้ต้นที่ 1 ???",
	"shot17": "ตัดต้นไม้ต้นที่ 2 ???",
	"shot18": "ตัดต้นไม้ต้นที่ 3 ???",
	"shot19": "ตัดต้นไม้ต้นที่ 4 ???",
	"shot20": "เกอราช : ปีศาจ!! มาได้ยังไง ทำไมมาอยู่ที่นี่ได้",
	"shot21": "ปีศาจ : ????????????????????",
	"shot22": "เกอราช : อะไร เจ้าพูดอะไร ข้าฟังไม่รู้เรื่องเลย เอ๋! เดี๋ยว! เจ้าจะเข้ามาทำไม อย่า อย่า อย่าเข้ามานะ",
	"shot23": "ปีศาจ : ????????????????????",
	"shot24": "เกอราช : เกือบไปแล้ว ปีศาจนี่อันตรายจริงๆ ทำไมมีปีศาจอยู่ในป่าตอนใต้แบบนี้ได้นะ",
	"shot25": "เกอราช : หืม! กลิ่นนี้มัน ไฟไหม้! แต่เดี๋ยว มันมาจากทางบ้านข้า",
	"shot26": "ภารกิจ : กลับไปยังบ้าน เพื่อตรวจสอบสภาพของบ้านและที่มาของกลิ่นไหม้ (TIP สามารถตรวจสอบสิ่งต่างๆโดยการพูดคุยกับสิ่งนั้น)",
	"shot27": "เกอราช : นี่มันเกิดอะไรขึ้นกับบ้านของข้า ทำไมมันถึงไหม้ได้",
	"shot28": "เกอราช : ปีศาจ ต้องเป็นฝีมือของปีศาจเมื่อกี้แน่ๆ แต่มันมาอยู่ที่ป่าแห่งนี้ได้ยังไง ที่นี่ไกลจากเทือกเขาพลัมมาก อีกอย่างพวกมันก็ไม่น่าจะข้ามเทือกเขาพลัมมาได้",
	"shot29": "เกอราช : นี่มันเกิดอะไรขึ้นกันแน่!",
	"shot30": "เกอราช : ใจเย็นก่อน การที่ปีศาจจะมาที่ป่าแห่งนี้ได้ต้องผ่านป้อมปราการ และหมู่บ้านตอนใต้ ก่อน ข้าว่าต้องมีอะไรเกิดขึ้นที่หมู่บ้านแน่ๆ ข้าต้องรีบไปที่หมู่บ้าน!",
	"shot31": "ภารกิจ : เดินทางไปยังหมู่บ้านตอนใต้(TIP หมู่บ้านตอนใต้อยู่ทางทิศตะวันออกของบ้านเกอราช)",
	"shot32": "ป้าย : ทางไปหมู่บ้านตอนใต้",
}
func _process(delta):
	$DialogBox/Tree1.connect("End",self,"Enddialog")
	_input_Space()


func _ready():
	Scene3 = false
	get_node("DialogBox/Tree1").hide()
	$hp/AnimatedSprite.hide()

func _input_Space():
	if Input.is_action_pressed("ui_interact") and Scene3:
		numshot+=1
		M_Tree1()
		
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
var Tree1_body = false
func Enddialog():
	if (Tree1_body):
		Scene3 = true
	
	pass

func M_Tree1():
	var StringShot = str(numshot)
	var Data = str("shot"+StringShot)
	on_body+=1
	if on_body > 1:
		Tree1_body = true
		get_node("DialogBox/Tree1/Text").text =""
		get_node("DialogBox/Tree1/Text").text= Shot[Data]
		get_node("DialogBox/Tree1").show()
		get_node("DialogBox").show()
		get_node("DialogBox/Tree1/Text/AnimationPlayer").play("Present_Visible")
		Scene3 = false
		


func _on_Tree1_body_entered(body):
	M_Tree1()
	pass # Replace with function body.


func _on_Tree1_body_exited(body):
	get_node("DialogBox/Tree1").hide()
	numshot = 2
	Tree1_body = false
	pass # Replace with function body.
