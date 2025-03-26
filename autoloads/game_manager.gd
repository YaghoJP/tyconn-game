extends Node

signal onCustomerRequest(custumer: Customer)
signal onCustomerOrderComplet(customer: Customer)

const ITEM_BURGUER = preload("res://data/item_burguer.tres")
const ITEM_COFFEE = preload("res://data/item_coffee.tres")
const COIN_VFX = preload("res://vfx/coin_vfx.tscn")

var coffeItemCounterPosition: Vector2 = Vector2(415, 1250)
var burguerItemCounterPosition: Vector2 = Vector2(665, 1250)

var currentCoins: int = 0

func playCoinVfx(spawnPosition: Vector2) ->void:
	var instance: GPUParticles2D = COIN_VFX.instantiate()
	
	get_tree().root.add_child(instance)
	var newPosition: Vector2 = Vector2(spawnPosition.x, spawnPosition.y - 60)
	
	instance.global_position = newPosition
	instance.emitting = true
	instance.finished.connect(func(): instance.queue_free())

func getRandomItem() -> Item:
	var items: Array = [ITEM_BURGUER, ITEM_COFFEE]
	return items.pick_random()

func getItemCounterPosition(item: Item) -> Vector2:
	match item.typeItem:
		Item.ItemType.Coffee:
			return coffeItemCounterPosition
		Item.ItemType.Burguer:
			return burguerItemCounterPosition
	return Vector2.ZERO
