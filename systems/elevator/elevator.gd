extends Node2D

#----------------------------------------------------------------------------------------------------
# global
#----------------------------------------------------------------------------------------------------

onready var clock = get_node("clock")

var cooldown = null
var can_press = true
var in_motion = false


#----------------------------------------------------------------------------------------------------
#
#----------------------------------------------------------------------------------------------------

func _ready():
	cooldown = Timer.new()
	cooldown.set_wait_time(1.5)
	cooldown.set_one_shot(true)
	cooldown.connect("timeout", self, "_on_cooldown_timeout")
	clock.add_child(cooldown)

	set_process(true)


#----------------------------------------------------------------------------------------------------
#
#----------------------------------------------------------------------------------------------------

func _process(delta):
	if (in_motion):
		cooldown.start()
		in_motion = false


#----------------------------------------------------------------------------------------------------
#
#----------------------------------------------------------------------------------------------------

func _on_cooldown_timeout():

	print("TIMEOUT")

	cooldown = Timer.new()
	cooldown.set_wait_time(1.5)
	cooldown.set_one_shot(true)
	cooldown.connect("timeout", self, "_on_cooldown_timeout")
	clock.add_child(cooldown)

	can_press = true


#----------------------------------------------------------------------------------------------------
# end
#----------------------------------------------------------------------------------------------------
