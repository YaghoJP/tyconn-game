extends Node
class_name CounterManager

@export_category("Variables")
@export var counterPosition: Array[Marker2D]

var counter: Dictionary[int, Customer] = {
	0:null,
	1:null,
	2:null,
	3:null,
}

func getFreePosition() -> int:
	for key in counter:
		if counter[key] == null:
			return key
	return -1

func assignCustomer(customer: Customer) -> void:
	var position: int = getFreePosition()
	if position == -1:
		return
	counter[position] = customer
	var freeCounterPos:Vector2 = counterPosition[position].position
	customer.counterPosition = freeCounterPos
