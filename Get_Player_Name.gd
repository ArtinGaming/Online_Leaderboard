extends Control


func _on_LineEdit_text_entered(player_text):
	Globals.close_menu = true
	print(player_text)
	Globals.player_name = player_text
	
