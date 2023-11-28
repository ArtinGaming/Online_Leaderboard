extends Control

func _on_Play_pressed():
	get_tree().change_scene("res://main.tscn")
	#Wipes Leaderboard. 
	#SilentWolf.Scores.wipe_leaderboard()

func _on_Leaderboard_pressed():
	get_tree().change_scene("res://Leaderboard.tscn")

