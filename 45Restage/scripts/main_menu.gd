class_name MainMenu extends Control

@export var start_button: Button
@export var options_dock: Control

func _on_start_pressed() -> void:
	start_button.disabled = true
	Bus.request_start.emit()

func _on_options_pressed() -> void:
	summon_options()

func _on_quit_pressed() -> void:
	get_tree().quit()

func summon_options() -> void:
	var options_menu: OptionsMenu = preload("res://scenes/options_menu.tscn").instantiate()
	options_dock.add_child(options_menu)
