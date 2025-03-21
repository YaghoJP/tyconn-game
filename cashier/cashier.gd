extends Node2D
class_name Cashier


@export_category("Variables")
@export var moveSpeed: float = 50.0

@export_category("Objects")
@export var _animationPlayer: AnimationPlayer

var currentCustomer: Customer
var counterPosition: Vector2

func takeOrder() -> void:
	moveToCustomer()
	await get_tree().create_timer(1.1).timeout
	currentCustomer.showOrderUI()
	moveToItemPosition()
	
func setCustomer(custumer: Customer) -> void:
	currentCustomer = custumer
	custumer.beingServed = true
	counterPosition = Vector2(custumer.position.x, custumer.position.y + 200)

func moveToCustomer() -> void:
	var tween: Tween = create_tween()
	tween.tween_property(self, "position", counterPosition, 1.0)
	_animationPlayer.play("move")

func moveToItemPosition() -> void:
	_animationPlayer.play("idle")
