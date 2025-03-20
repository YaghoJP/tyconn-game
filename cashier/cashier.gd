extends Node2D
class_name Cashier


@export_category("Variables")
@export var moveSpeed: float = 50.0

@export_category("Objects")
@export var _animationPlayer: AnimationPlayer

func moveToCustomer() -> void:
	
	_animationPlayer.play("move")
	pass

func moveToItemPosition() -> void:
	
	
	_animationPlayer.play("idle")
	pass
