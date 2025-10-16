class_name Master extends Control

@export var game: Control
@export var transitions: Transitions

@export var vn_seq: DialogicTimeline

func _ready() -> void:
	wire_up_signals()
	GameHandler.master = self

func wire_up_signals() -> void:
	Bus.request_start.connect(transition_into_game)

func transition_into_game() -> void:
	await transitions.fade_in()
	
	#destroy the main menu
	var main_menu: MainMenu = game.get_child(0)
	main_menu.queue_free()
	
	#start the actual game scene
	Dialogic.start("Intro")
	
	await transitions.fade_out()
