extends Node2D
class_name animationsComponent

enum {
	IDLE,
	ATTACKING,
	MOVING,
	DEAD,
	HURT
}

var state = 0

func to_idle():
	state = IDLE

func to_attacking():
	state = ATTACKING

func to_moving():
	state = MOVING

func to_dead():
	state = DEAD
	
func to_hurt():
	state = HURT
