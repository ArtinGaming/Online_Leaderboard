extends Node

var player_name = ""

var player_list = []

var close_menu = false

var score = 0

func _ready():
	SilentWolf.configure({
		"api_key": "6sWKknHwyp5iN4x9vUkffZAOw7SOBxkjvK6YJXe0",
		"game_id": "leaderboredtut1",
		"game_version": "1",
		"log_level": 1
	})
	
	SilentWolf.configure_scores({
	"open_scene_on_close": "res://scenes/MainPage.tscn"
	})
	
func _physics_process(delta):
	leaderboard()

func leaderboard():
	for score in Globals.score:
		Globals.player_list.append(Globals.player_name)
	
