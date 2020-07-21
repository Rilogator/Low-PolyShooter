class_name ResourceTracker, "res://dredd_icon.png"
extends Resource

const HEALTH_MAX: int = 100
const ARMOR_MAX: int = 100

const FMJ_MAX: int = 99
const AP_MAX: int = 99
const INC_MAX: int = 99
const HE_MAX: int = 99

export(int) var _health_current = 100
export(int) var armor_current = 100 setget set_armor

export(int) var fmj = 1 setget set_fmj
export(int) var ap = 1 setget set_ap
export(int) var inc = 1 setget set_inc
export(int) var he = 1 setget set_he

export(int) var _stun = -1

func damage(value: int) ->void:
	if armor_current > 0:
		value = value/2
		armor_current -= value
	_health_current -= max(value, 0)


func set_armor(value: int) -> void:
	armor_current = clamp(value, 0, ARMOR_MAX)


func set_fmj(value: int) -> void:
	fmj = clamp(value, 0, FMJ_MAX)


func set_ap(value: int) -> void:
	ap = clamp(value, 0, AP_MAX)


func set_inc(value: int) -> void:
	inc = clamp(value, 0, INC_MAX)


func set_he(value: int) -> void:
	he = clamp(value, 0, HE_MAX)
