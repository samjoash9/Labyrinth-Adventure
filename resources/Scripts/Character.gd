extends Resource
class_name CharacterResource


@export_category("Character Data")
@export var jobName : String
@export_multiline var jobDescription : String
@export var characterPortrait: Texture2D

@export_category("Character Stats")
@export var basicStats : Stats

@export_category("Character Animations")
@export var animationComponent : Resource

@export_category("Character Weapon Upgrades")
@export var weapon : Weapon
@export var WeaponSlots: Array[Vector2] = [Vector2(0,5),Vector2(0,-15),Vector2(10,-5),Vector2(-10,-5),Vector2(7,-12), Vector2(-7,-12),Vector2(-7,2), Vector2(7,2)]

@export_category("Character Item Upgrades")
@export var itemUpgrades: Resource

@export_category("Character Unique Skill")
@export var uniqueSkill : UniqueSkill
