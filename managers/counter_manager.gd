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

func _ready() -> void:
	GameManager.onCustomerOrderComplet.connect(onCustomerOrderComplet)
	
func onCustomerOrderComplet(customer: Customer) -> void:
	for index: int in counter:
		if counter[index] == customer:
			counter[index] = null
	

func getFirstAvailableCustomer() -> Customer:
	for customer: Customer in counter.values():
		if customer != null:
			if customer.waitingOrder and not customer.beingServed:
				return customer
	return null

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
