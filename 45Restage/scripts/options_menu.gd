class_name OptionsMenu extends Control

func _on_quit_pressed() -> void:
	#save_settings()
	queue_free()
