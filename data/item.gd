extends Resource
class_name Item

enum ItemType {
	Coffee,
	Burguer
}

@export_category("Variables")
@export var idItem: String
@export var typeItem: ItemType

@export_category("Objects")
@export var spriteItem: Texture2D

@export_group("Cook")
@export var cookTime: float = 10.0
@export var cookTimeReducePercent: float = 0.50

@export_group("Upgrade")
@export var upgradeCost: float = 3.0
@export var upgradeMulti: float = 1.3

@export_group("Profit")
@export var profit: float = 4.0
@export var profitMulti: float = 1.2

@export_category("Levels")
@export var maxLevel: int = 75

var _currentLevel: int = 0
