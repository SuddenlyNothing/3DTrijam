extends CanvasLayer

signal dialog_ended

const READ_SPEED : float = 30.0

var dialogs : Array
var d_ind : int
var reading : bool = false
var has_dialog : bool = false

onready var t := $Tween
onready var c := $Control
onready var label := $Control/M/M/Label
onready var text_sfx := $TextSFX


func read(d: Array) -> void:
	has_dialog = true
	c.show()
	d_ind = -1
	dialogs = d
	read_next()


func read_next() -> void:
	d_ind += 1
	if d_ind >= dialogs.size():
		has_dialog = false
		emit_signal("dialog_ended")
		c.hide()
		return
	text_sfx.play()
	label.text = dialogs[d_ind]
	var cc = label.get_total_character_count()
	t.interpolate_property(label, "visible_characters", 0, cc, cc/READ_SPEED)
	t.start()
	reading = true


func _unhandled_input(event: InputEvent) -> void:
	if has_dialog:
		if event is InputEventMouseButton:
			if not event.is_pressed():
				if reading:
					t.remove_all()
					label.percent_visible = 1.0
					reading = false
					text_sfx.stop()
				else:
					read_next()


func _on_Tween_tween_all_completed() -> void:
	reading = false
	text_sfx.stop()
