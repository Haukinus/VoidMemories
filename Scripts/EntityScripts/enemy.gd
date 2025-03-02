extends CharacterBody3D

signal IsHit
var hp = 20
var entitytag = {}
var weapondamage = 10
#entityid is meant to effect stats for creatures, used in conjunction with enum
var entityid = 0


func _on_area_3d_area_entered(_area: Area3D) -> void:
	hp -= CombatHelper.playerdamage
	print("damaged")
	if hp <= 0:
		queue_free()
		print("died")
