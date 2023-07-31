extends Node
@onready var feltyrion = Feltyrion.new()
signal on_parsis_changed(parsis: Vector3)
signal on_camera_rotation(rotation)
signal on_ap_target_changed(parsis: Vector3, id_code)
signal mouse_clicked()
signal mouse_click_begin()
@export var current_parsis: Vector3 = Vector3(0,0,0) # todo set to actual current
enum UI_MODE {NONE, SET_REMOTE_TARGET, SET_LOCAL_TARGET}
@export var ui_mode: UI_MODE = UI_MODE.NONE

const MOUSE_CLICK_THRESHOLD_LOW = 0.01
const MOUSE_CLICK_THRESHOLD_HIGH = 1.5

func _ready():
	current_parsis = feltyrion.get_ap_target() # you start at the current target

func set_parsis(vec3):
	on_parsis_changed.emit(vec3)

func set_ap_target(vec3):
	feltyrion.lock()
	feltyrion.set_ap_target(vec3)
	var info = feltyrion.get_ap_target_info()
	feltyrion.unlock()
	on_ap_target_changed.emit(vec3, info.ap_target_id_code)

var mouse_left_held = 0
func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if mouse_left_held == 0:
			mouse_click_begin.emit()
		mouse_left_held += delta
	else:
		if mouse_left_held > 0:
			if mouse_left_held > MOUSE_CLICK_THRESHOLD_LOW && mouse_left_held < MOUSE_CLICK_THRESHOLD_HIGH:
				mouse_clicked.emit()
			mouse_left_held = 0
