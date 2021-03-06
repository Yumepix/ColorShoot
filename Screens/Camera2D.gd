extends Camera2D

const MIN_OFFSET := 1.0
const MAX_OFFSET := 15.0
onready var _shake_timer := $ShakeTimer

func _physics_process(_delta) -> void:
	var random_offset := Vector2(
		rand_range(MIN_OFFSET, MAX_OFFSET),
		rand_range(MIN_OFFSET, MAX_OFFSET)
	)

	offset = random_offset
	var timer_progress: float = 1.0 - _shake_timer.time_left / _shake_timer.wait_time
	offset = lerp(random_offset, Vector2.ZERO, timer_progress)


func _on_Timer_timeout():
	set_physics_process(false)

