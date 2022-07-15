extends Node2D

func get_player_if_there():
	#checks if the player is currently spawned in and returns it
	# Returns Null otherwise
	if get_children() != []:
		return get_child(0)
	else:
		print("get_player is returning a null varible, please check if that's intended")
		return null
