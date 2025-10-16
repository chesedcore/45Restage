class_name BlackRect extends ColorRect

@export var fade_half_time: float = 0.6
static var black := Color(0,0,0,1)
static var transparent_black := Color(0,0,0,0)

static func attach_transparent() -> BlackRect:
	var rect: BlackRect = preload("res://scenes/black_rect.tscn").instantiate()
	rect.color = transparent_black
	GameHandler.master.transitions.add_child(rect)
	return rect

var tween: Tween
func fade_in() -> void:
	if tween: tween.kill()
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property(self, "color", black, fade_half_time)
	await tween.finished

func fade_out(destroy_rect_on_end := true) -> void:
	if tween: tween.kill()
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property(self, "color", transparent_black, fade_half_time)
	if destroy_rect_on_end: tween.tween_callback(destroy)
	await tween.finished

func destroy() -> void:
	queue_free()
