extends Node

signal onCustomerRequest(custumer: Customer)
signal onCustomerOrderComplet(customer: Customer)

const ITEM_BURGUER = preload("res://data/item_burguer.tres")
const ITEM_COFFEE = preload("res://data/item_coffee.tres")

var coffeItemCounterPosition: Vector2 = Vector2(415, 1250)
var burguerItemCounterPosition: Vector2 = Vector2(665, 1250)

var currentCoins: int = 0

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
