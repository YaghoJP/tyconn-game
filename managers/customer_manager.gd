extends Node
class_name CustomerManager

@export_category("Objects")
@export var _customersSpawnPos: Array[Marker2D]
@export var _customersSprites: Array[CustomerData]
@export var _customerScene: PackedScene

func _ready() -> void:
	spawnCustomer()

func spawnCustomer() -> void:
	var _customer: Customer = _customerScene.instantiate()
	add_child(_customer)

	var _spritesData: CustomerData = _customersSprites.pick_random()
	_customer.setSprites(_spritesData)

	var _randomStartPosition: Marker2D = _customersSpawnPos.pick_random()
	_customer.position = _randomStartPosition.position

	_customer.playMoveAnimation()
	
	var _tween: Tween = create_tween()
	_tween.tween_property(_customer, "position", _customer.position + Vector2.RIGHT * 1350, 5.0)
	_tween.finished.connect(func (): _customer.queue_free())


func _on_spawn_timer_timeout() -> void:
	spawnCustomer()
