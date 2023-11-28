extends GridContainer

var font = DynamicFont.new() 

var player_list_with_pos = []

func _ready():
	#Font data and outline color, and size.
	font.font_data = load("res://04B_30__.TTF")
	font.outline_size = 2
	font.outline_color = Color("#000000")
	#Retrieves the scores. Number 0 means how much the scores should be retrieved.
	yield(SilentWolf.Scores.get_high_scores(0), "sw_scores_received")
	player_list_with_pos = sort_players_and_add_position(SilentWolf.Scores.scores)
	add_player_to_grid(player_list_with_pos)
	save()
	
func add_player_to_grid(player_list):
	var pos_vbox = VBoxContainer.new()
	var name_vbox = VBoxContainer.new()
	var score_vbox = VBoxContainer.new()
	
	for score_data in player_list_with_pos:
		var pos_label = Label.new()
		pos_label.add_font_override("font", font)
		pos_label.text = str(score_data["position"])
		pos_label.show()
		pos_vbox.add_child(pos_label)
	add_child(pos_vbox)
	
	for score_data in player_list_with_pos:
		var name_label = Label.new()
		name_label.add_font_override("font", font)
		name_label.text = str(score_data["player_name"])
		name_label.show()
		name_vbox.add_child(name_label)
	add_child(name_vbox)
	
	for score_data in player_list_with_pos:
		var score_label = Label.new()
		score_label.add_font_override("font", font)
		score_label.text = str(score_data["score"])
		score_label.show()
		score_vbox.add_child(score_label)
	add_child(score_vbox)

func sort_players_and_add_position(player_list):
	player_list.sort_custom(CustomComparator, "sort_descending")
	var position = 1
	for player in player_list:
		player["position"] = position
		position += 1
	return player_list

func save():
	for score_data in player_list_with_pos:
		if score_data["position"] == 1:
			Saver.save_data(score_data["player_name"],Globals.second_place,Globals.third_place)
			print(score_data["player_name"])
			Globals.first_place = score_data["player_name"]
		elif score_data["position"] == 2:
			Saver.save_data(Globals.first_place,score_data["player_name"],Globals.third_place)
			print(score_data["player_name"])
			Globals.second_place = score_data["player_name"]
		elif score_data["position"] == 3:
			Saver.save_data(Globals.first_place,Globals.second_place ,score_data["player_name"])
			print(score_data["player_name"])
			Globals.third_place = score_data["player_name"]
			
class CustomComparator:
	#This just sorts it from whoever has the highest score. 
	static func sort_descending(a, b):
		if a["score"] > b["score"]:
			return true
		return false

func _on_Next_Level_pressed():
	get_tree().change_scene("res://Winners.tscn")
