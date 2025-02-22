extends CharacterBody3D

@export var speed = 2

#following tutorial for most of this, may be changed
func _physics_process(_delta):
	
	if Input.is_action_pressed("move_right"):
		rotate(Vector3(0,-1,0), 0.05)
		
	if Input.is_action_pressed("move_left"):
		rotate(Vector3(0,1,0), 0.05)
		
	if Input.is_action_pressed("move_forward") and not Input.is_action_pressed("move_back"):
		#velocity was tricky to determine with tank controls but works now
		if Input.is_action_pressed("sprint"):
			velocity = Vector3(sin(rotation.y), 0, cos(rotation.y)) * speed * 1.5
		else:
			velocity = Vector3(sin(rotation.y), 0, cos(rotation.y)) * speed
		move_and_slide()
		
	if Input.is_action_pressed("move_back") and not Input.is_action_pressed("move_forward"):
		velocity =- Vector3(sin(rotation.y), 0, cos(rotation.y))
		move_and_slide()
	
	if Input.is_action_just_released("attack"):
		$AttackRange.disabled = 0
		print($AttackRange.disabled)
		Timer
