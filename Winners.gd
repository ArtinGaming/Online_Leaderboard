extends Control

var font = DynamicFont.new() 

func _ready():
	font.font_data = load("res://04B_30__.TTF")
	font.outline_size = 2
	font.outline_color = Color("#000000")
	var winners = Saver.load_data()
	add_player_to_grid(Saver.load_data())
	
func add_player_to_grid(winners):
	
	#First
	var first_winner_hbox = HBoxContainer.new()
	var first_winner_label = Label.new()
	
	first_winner_label.add_font_override("font", font)
	first_winner_label.text = str(winners["first_place"])
	first_winner_label.show()
	first_winner_hbox.add_child(first_winner_label)
	add_child(first_winner_hbox)
	
	#Second 
	var second_winner_hbox = HBoxContainer.new()
	var second_winner_label = Label.new()
	
	second_winner_label.add_font_override("font", font)
	second_winner_label.text = str(winners["second_place"])
	second_winner_label.show()
	second_winner_hbox.add_child(second_winner_label)
	add_child(second_winner_hbox)
	
	#Third
	var third_winner_hbox = HBoxContainer.new()
	var third_winner_label = Label.new()
	
	third_winner_label.add_font_override("font", font)
	third_winner_label.text = str(winners["third_place"])
	second_winner_label.show()
	third_winner_hbox.add_child(third_winner_label)
	add_child(third_winner_hbox)
