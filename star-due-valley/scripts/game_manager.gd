# GameManager.gd
extends Node

# define your possible states
enum GameState { MENU, PLAYING, PAUSED, GAME_OVER }
var state: GameState = GameState.MENU

func _ready() -> void:
	# whenever the game starts, go to the MENU
	go_to_menu()

# call this to switch scenes
func _change_to(path: String) -> void:
	get_tree().change_scene_to_file(path)

# state-transition functions:
func go_to_menu() -> void:
	state = GameState.MENU
	_change_to("res://scenes/mainpanel.tscn")

func start_game() -> void:
	state = GameState.PLAYING
	_change_to("res://scenes/main.tscn")

func pause_game() -> void:
	if state == GameState.PLAYING:
		state = GameState.PAUSED
		get_tree().paused = true

func resume_game() -> void:
	if state == GameState.PAUSED:
		state = GameState.PLAYING
		get_tree().paused = false

func game_over() -> void:
	pass
	
   # state = GameState.GAME_OVER
	#_change_to("res://scenes/GameOver.tscn")
