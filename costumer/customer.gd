extends Node2D
class_name Customer

@export_category("Objects")
@export var _body: Sprite2D
@export var _face: Sprite2D
@export var _handLeft: Sprite2D
@export var _handRight: Sprite2D
@export var _animation: AnimationPlayer

func setSprites(_data: CustomerData) -> void:
	
	_body.texture = _data.body
	_face.texture = _data.face
	_handLeft.texture = _data.hand
	_handRight.texture = _data.hand

func playMoveAnimation() -> void:
	
	_animation.play("move")
	
	pass
