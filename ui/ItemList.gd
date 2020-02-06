extends ItemList

export(float) var drag_threshold = 5

onready var touch_enabled = OS.has_touchscreen_ui_hint()
onready var v_scroll = get_v_scroll()

var dragging = false
var pressed = false

# must be _input, as _gui_input has bugs, with no touch.pressed = false events
# see: https://github.com/godotengine/godot/issues/16761
func reset() -> void:
	v_scroll.value = 0

func _input(event) -> void:
	if not visible:
		return

	if not touch_enabled:
		return

	if event is InputEventScreenDrag:
		accept_event()
		if event.speed == Vector2():
			# we're on a device and speed is broken
			# see: https://github.com/godotengine/godot/issues/3623
			event.speed = event.relative
		if abs(event.speed.y) >= drag_threshold:
			# scroll the list
			dragging = true
			v_scroll.value -= event.relative.y
		return

	if event is InputEventScreenTouch:
		if event.index == 0:
			accept_event()
			if dragging && event.pressed == false:
				# prints("end drag")
				dragging = false
				pressed = false
			else:
				if event.pressed && pressed == false:
					# prints("touch start")
					pressed = true
					# TODO: prevent select highlight
				elif !event.pressed && pressed == true:
					# prints("touch end and accept")
					pressed = false
					var ev = InputEventAction.new()
					ev.action = "ui_accept"
					ev.pressed = true
					Input.parse_input_event(ev)
