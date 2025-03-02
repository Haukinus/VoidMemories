extends Node

enum combatdifficultyvalues {easy = 3, normal = 2, hard = 1}

#0 = Combat Logging, 1 = Keypress Logging, 2 = Environment Logging, 3 = Unnecessary Logging
@export var LoggerBehavior = [true, false, true, false]
@export var combatdifficulty = combatdifficultyvalues.easy
# Called when the node enters the scene tree for the first time.
var RepeatDisabler: String

func LogPrinter(Logreturnal: String, Logflow: int) -> void:
	
	if RepeatDisabler == Logreturnal:
			return
	RepeatDisabler = Logreturnal
	
	match LoggerBehavior[Logflow]:
			false:
				return
			true:
				print(Logreturnal)

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
