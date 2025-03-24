extends Node
class_name CashierManager

@export_category("Objects")
@export var cashierScene: PackedScene
@export var spawnCashier: Marker2D
@export var counterManager: CounterManager

var cashierList: Array[Cashier] = []

func _ready() -> void:
	GameManager.onCustomerRequest.connect(onCustomerRequest)
	addCashier()
	
func onCustomerRequest(customer: Customer) -> void:
	var freeCashiers: Array = cashierList.filter(func(x: Cashier): return x.currentCustomer == null)
	if not freeCashiers:
		return
		
	var randomCashier: Cashier = freeCashiers.pick_random()
	if randomCashier:
		randomCashier.setCustomer(customer)
		randomCashier.takeOrder()

func addCashier() -> void:
	var newCashier: Cashier = cashierScene.instantiate()
	newCashier.onOrderCompleted.connect(onOrderCompleted)
	add_child(newCashier)
	newCashier.position = spawnCashier.position
	cashierList.append(newCashier)

func onOrderCompleted(cashier: Cashier) -> void:
	var availableCustomer: Customer = counterManager.getFirstAvailableCustomer()
	if availableCustomer != null:
		cashier.setCustomer(availableCustomer)
		cashier.takeOrder()
