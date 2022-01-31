extends Spatial

onready var player := $Player
onready var dp := $DialoguePlayer


func _physics_process(delta: float) -> void:
	if player.translation.y <= -10:
		Global.restart_scene()
