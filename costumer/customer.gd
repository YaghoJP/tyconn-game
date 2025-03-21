extends Node2D
class_name Customer

@export_category("Objects")
@export var _body: Sprite2D
@export var _face: Sprite2D
@export var _handLeft: Sprite2D
@export var _handRight: Sprite2D
@export var _animation: AnimationPlayer
@export var _itemBox: Control
@export var _itemTexture: TextureRect
@export var _itemLabel: Label

var requestItem: Item
var requestQuantity: int 
var currentOrderStatus: int

var counterPosition: Vector2

func initCustomer(item: Item, quantity: int) -> void:
	requestItem = item
	requestQuantity = quantity
	currentOrderStatus = quantity
	showOrderUI()

func moveToCounter() -> void:
	playMoveAnimation()
	var _tween: Tween = create_tween()
	_tween.tween_property(self, "position", Vector2(counterPosition.x, position.y), 1.0)
	_tween.tween_interval(0.2)
	_tween.tween_property(self, "position", counterPosition, 1.0)
	_tween.tween_interval(0.5)
	

func setSprites(_data: CustomerData) -> void:
	_body.texture = _data.body
	_face.texture = _data.face
	_handLeft.texture = _data.hand
	_handRight.texture = _data.hand

func showOrderUI() -> void:
	_itemBox.show()
	_itemTexture.texture = requestItem.spriteItem
	_itemLabel.text = str(requestQuantity)
	pass
	
func playMoveAnimation() -> void:
	
	_animation.play("move")
	
	pass
