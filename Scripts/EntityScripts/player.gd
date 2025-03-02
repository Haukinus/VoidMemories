extends CharacterBody3D

@export var speed = 2.0
var health: int = 100 * GlobalSettings.combatdifficulty
var weapons = {none = 0, shortsword = 5, longsword = 10, mace = 5, spear = 10}
#setting this to shortsword so combat can be debugged
var damage = weapons.shortsword
#this is to make sure attacks can't happen too quickly
var attackdelay: bool = false


func _physics_process(_delta):
	if Input.is_action_pressed("move_right"):
		rotate(Vector3(0,-1,0), 0.05)
		#GlobalSettings.LogPrinter("Turned Right", 1)
		
	if Input.is_action_pressed("move_left"):
		rotate(Vector3(0,1,0), 0.05)
		#GlobalSettings.LogPrinter("Turned left", 1)
		
	if Input.is_action_pressed("move_forward") and not Input.is_action_pressed("move_back"):
		#velocity was tricky to determine with tank controls but works now
		if Input.is_action_pressed("sprint"):
			velocity = Vector3(sin(rotation.y), 0, cos(rotation.y)) * speed * 1.5
			#GlobalSettings.LogPrinter("Ran Forward", 1)
		else:
			velocity = Vector3(sin(rotation.y), 0, cos(rotation.y)) * speed
			#GlobalSettings.LogPrinter("Moved Forward", 1)
		move_and_slide()
		
	if Input.is_action_pressed("move_back") and not Input.is_action_pressed("move_forward"):
		velocity =- Vector3(sin(rotation.y), 0, cos(rotation.y))
		move_and_slide()
		#GlobalSettings.LogPrinter("Moved Back", 1)
		
	if Input.is_action_just_released("attack") and not attackdelay == true:
		CombatHelper._GetPlayerDamage(damage)
		$AttackRange.monitorable = 1
		attackdelay = true 
		$AttackTimer.start(1.0)
		$DelayTimer.start(1.5)
		#print($AttackRange.monitorable)



func _on_attack_timer_timeout() -> void:
	$AttackRange.monitorable = 0


func _on_delay_timer_timeout() -> void:
	attackdelay = false
