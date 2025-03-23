extends Control
class_name CookBar

signal onCookCompleted

@export_category("Objects")
@export var texture: TextureProgressBar

func cookItem(time: float) -> void:
	var tween: Tween = create_tween()
	tween.tween_property(texture, "value", 1.0, time)
	tween.finished.connect(func(): onCookCompleted.emit())

func resetBar() -> void:
	texture.value = 0
