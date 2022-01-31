extends MeshInstance

export(Array, AudioStream) var audio_files

var rng := RandomNumberGenerator.new()


func _on_Area_body_entered(body: Node) -> void:
	var sfx := AudioStreamPlayer.new()
	sfx.bus = "SFX"
	sfx.stream = audio_files[rng.randi_range(0, 5)]
	sfx.pause_mode = Node.PAUSE_MODE_PROCESS
	sfx.volume_db = -15
	add_child(sfx)
	sfx.play()
	sfx.connect("finished", sfx, "queue_free")
