extends Spatial

export(String, FILE, "*.tscn") var next_scene
export(Array, String, MULTILINE) var dialog

onready var player := $Player
onready var dp := $DialoguePlayer


func _physics_process(delta: float) -> void:
	if player.translation.y <= -10:
		Global.restart_scene()


func _on_Area_body_entered(body: Node) -> void:
	dp.read(dialog)
	yield(dp, "dialog_ended")
	Global.goto_scene(next_scene)
