extends Node2D

func _physics_process(delta):
	score()
	
func _on_Increase_score_pressed():
	Globals.score += 10


func _on_Decrease_score_pressed():
	if Globals.score > 0:
		Globals.score -= 10

func _on_Submit_pressed():
	$Player_Name.show()
	print(Globals.score)
	if Globals.close_menu == true:
		var score_id = yield(SilentWolf.Scores.persist_score(Globals.player_name, Globals.score), "sw_score_posted")
		print("Score persisted successfully: " + str(score_id))
		$Player_Name.hide()
		Globals.close_menu = false
		
func score():
	$Score.text = "Score: " + str(Globals.score)

func _on_Back_pressed():
	get_tree().change_scene("res://Menu.tscn")
