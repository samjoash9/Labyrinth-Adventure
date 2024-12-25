extends HBoxContainer

@export var weapons: HBoxContainer
@export var passives : HBoxContainer
var optionSlot = preload("res://ui/option_slot.tscn")
const weapon_path: String = "res://resources/weapons/"
const passives_path : String = "res://resources/passives/"

var every_item
var every_weapon
var every_passive

func _ready() -> void:
	hide()
	get_all_item()
	
func close_option():
	hide()
	get_tree().paused = false
	
func get_available_resource_in(items) -> Array[Item]:
	var resources : Array[Item] = []
	for item in items.get_children():
		if item.item != null:
			resources.append(item.item)
	return resources
	
func add_option(item) -> int:
	if item is Item and item.is_upgradable():
		var option_slot = optionSlot.instantiate()
		option_slot.item = item
		add_child(option_slot)
		return 1
	return 0
	
func show_option():
		
	for slot in get_children():
			slot.queue_free()
	
	var available = get_equiped_item()
	
	if slot_available(weapons):
		available.append_array(get_upgradable(every_weapon, get_equiped_item()))
		
	if slot_available(passives):
		available.append_array(get_upgradable(every_passive, get_equiped_item()))
	available.shuffle()
	
	var option_size =0
	
	for i in range(3):
		if available.size()>0:
			option_size+= add_option(available.pop_front())
	if option_size == 0:
		return
	
	show()
	get_tree().paused = true

func dir_contents(path):
	var dir = DirAccess.open(path)
	var item_resources: Array[Item] = []
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			var item_resource : Item = load(path + file_name)
			item_resources.append(item_resource)
			file_name = dir.get_next()
	else:
		print("Access Path Error!")
		return null
	return item_resources
		
#
func get_all_item():
	var item_resources = dir_contents(weapon_path)
	every_weapon = item_resources
	
	item_resources = dir_contents(passives_path)
	every_passive = item_resources
	
	every_item = every_weapon.duplicate()
	every_item.append_array(every_passive)

func slot_available(items):
	for item in items.get_children():
		if item.item == null:
			return true
	return false

func get_upgradable(items, flag = []):
	var array = []
	for item in items:
		if item.is_upgradable() and item not in flag:
			array.append(item)
	return array

func check_item(item):
	if item in get_available_resource_in(weapons) or item in get_available_resource_in(passives):
		return
	else:
		if item is Weapon:
			add_weapon(item)
		elif item is Passives:
			item.player_reference = owner
			add_passive(item)

func get_equiped_item(): 
	var equiped_items = get_available_resource_in(weapons)
	equiped_items.append_array(get_available_resource_in(passives))
	return get_upgradable(equiped_items)

func add_weapon(item):
	for slot in weapons.get_children():
		if slot.item == null:
			slot.item = item
			slot.createWeapon()
			return

func add_passive(item):
	for slot in passives.get_children():
		if slot.item == null:
			slot.item = item
			return
