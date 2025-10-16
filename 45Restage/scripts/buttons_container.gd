class_name ButtonsContainer extends HBoxContainer

@export var start_button: Button

func _on_start_pressed() -> void:
	start_button.disabled = true
	Bus.request_start.emit()
