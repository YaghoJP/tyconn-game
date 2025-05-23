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
var waitingOrder: bool
var beingServed: bool

func _process(_delta: float) -> void:
	
	_itemLabel.text = str(currentOrderStatus)
	

func initCustomer(item: Item, quantity: int) -> void:
	requestItem = item
	requestQuantity = quantity
	currentOrderStatus = quantity

func moveToCounter() -> void:
	playMoveAnimation()
	var _tween: Tween = create_tween()
	_tween.tween_property(self, "position", Vector2(counterPosition.x, position.y), 1.0)
	_tween.tween_interval(0.2)
	_tween.tween_property(self, "position", counterPosition, 1.0)
	_tween.tween_interval(0.5)
	
	_tween.finished.connect(func ():
		_animation.play("idle")
		waitingOrder = true
		GameManager.onCustomerRequest.emit(self)
	)
	
func orderCompleted() -> void:
	_itemBox.hide()
	waitingOrder = false
	var counterTopPos: float = counterPosition.y - 140
	
	var tween:Tween = create_tween()
	var finalPos: Vector2 = Vector2(counterPosition.x, counterTopPos)
	tween.tween_property(self, "position", finalPos, 1.0)
	tween.tween_interval(0.2)
	var endPos: Vector2 = Vector2(counterPosition.x + 800, counterTopPos)
	tween.tween_property(self,"position", endPos, 3.0)
	tween.tween_interval(0.2)
	tween.finished.connect(func(): GameManager.onCustomerOrderComplet.emit(self))
	
func receiveOrder() -> void:
	currentOrderStatus -= 1
	if currentOrderStatus <= 0:
		orderCompleted()
	
func setSprites(_data: CustomerData) -> void:
	_body.texture = _data.body
	_face.texture = _data.face
	_handLeft.texture = _data.hand
	_handRight.texture = _data.hand

func showOrderUI() -> void:
	_itemBox.show()
	_itemTexture.texture = requestItem.spriteItem
	_itemLabel.text = str(requestQuantity)
	
func playMoveAnimation() -> void:
	
	_animation.play("move")
