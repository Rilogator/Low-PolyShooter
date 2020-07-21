class_name ResourceTracker, "res://dredd_icon.png"
extends Resource

# Health

const HEALTH_MAX = 100
const ARMOR_MAX = 100

var health_count = HEALTH_MAX
var armor_count = 0

# Ammo 

enum AmmoType {FMJ, AP, INC, HE, STUN}

const AMMO_MAX := {
	AmmoType.FMJ: 99,
	AmmoType.AP: 20,
	AmmoType.INC: 10,
	AmmoType.HE: 5,
	AmmoType.STUN: -1,
}

var ammo_count := {
	AmmoType.FMJ: 1,
	AmmoType.AP: 1,
	AmmoType.INC: 1,
	AmmoType.HE: 1,
	AmmoType.STUN: -1,
}

# Functions

func damage(value):
	if armor_count > 0:
		value = value/2
		armor_count = max(armor_count - value, 0)
	health_count -= value

func add_ammo(type, value: int):
	ammo_count[type] = min(ammo_count[type] + value, AMMO_MAX[type])
