extends Node

signal onCustomerRequest(custumer: Customer)

const ITEM_BURGUER = preload("res://data/item_burguer.tres")
const ITEM_COFFEE = preload("res://data/item_coffee.tres")

func getRandomItem() -> Item:
	var items: Array = [ITEM_BURGUER, ITEM_COFFEE]
	return items.pick_random()
