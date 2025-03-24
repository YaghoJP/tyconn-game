extends Node2D
class_name Cashier

signal onOrderCompleted(cashier: Cashier)

@export_category("Variables")
@export var moveSpeed: float = 50.0

@export_category("Objects")
@export var _animationPlayer: AnimationPlayer
@export var _cookBar: CookBar

var currentCustomer: Customer
var counterPosition: Vector2

var itemRequest: Item
var itemCounterPos: Vector2

func takeOrder() -> void:
	moveToCustomer()
	await get_tree().create_timer(1.1).timeout
	currentCustomer.showOrderUI()
	moveToItemPosition()
	
func setCustomer(custumer: Customer) -> void:
	currentCustomer = custumer
	custumer.beingServed = true
	counterPosition = Vector2(custumer.position.x, custumer.position.y + 200)
	itemRequest = custumer.requestItem
	itemCounterPos = GameManager.getItemCounterPosition(itemRequest)

func moveToCustomer() -> void:
	var tween: Tween = create_tween()
	tween.tween_property(self, "position", counterPosition, 1.0)
	_animationPlayer.play("move")

func moveToItemPosition() -> void:
	_animationPlayer.play("move")
	var tween: Tween = create_tween()
	tween.tween_property(self, "position", itemCounterPos, 2.0)
	tween.tween_interval(0.5)
	tween.finished.connect(func (): startCookTime())
	
func startCookTime() -> void:
	_animationPlayer.play("idle")
	_cookBar.show()
	_cookBar.cookItem(itemRequest.cookTime)

func _on_cook_bar_on_cook_completed() -> void:
	_cookBar.hide()
	_cookBar.resetBar()
	deliverOrder()
	
func deliverOrder() -> void:
	moveToCustomer()
	await  get_tree().create_timer(1.1).timeout
	currentCustomer.receiveOrder()
	GameManager.currentCoins += itemRequest.profit
	
	if not currentCustomer.currentOrderStatus <= 0:
		moveToItemPosition()
	else:
		_animationPlayer.play("idle")
		currentCustomer = null
		onOrderCompleted.emit(self)
		
		
