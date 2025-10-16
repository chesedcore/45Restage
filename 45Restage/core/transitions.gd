class_name Transitions extends CanvasLayer

var black_rect: BlackRect

func fade_in() -> void:
	assert(not black_rect, "A black rect already exists!!")
	black_rect = BlackRect.attach_transparent()
	await black_rect.fade_in()

func fade_out() -> void:
	assert(black_rect, "There is no black rect to fade out!")
	await black_rect.fade_out()
