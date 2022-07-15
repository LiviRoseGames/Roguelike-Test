extends Sprite

onready var game = get_tree().root.get_node("Game")


#Different tile names/types 	TODO: implement multiple versions of types. Wall1, Wall2, etc.
#enum Tile {Wall, Door, Floor, Ladder, Stone}
enum Tile {Floor, Wall, Stone, Door, Hole}

func _input(event):
	if !event.is_pressed():
		return
		
	if event.is_action("Left"):
		try_move(-1, 0)
	elif event.is_action("Right"):
		try_move(1, 0)
	elif event.is_action("Up"):
		try_move(0, -1)
	elif event.is_action("Down"):
		try_move(0, 1)
		
func try_move(dx, dy):
	var x = game.player_tile.x + dx
	var y = game.player_tile.y + dy
	
	var tile_type = game.Tile.Stone
	if x >= 0 && x < game.level_size.x && y >= 0 && y < game.level_size.y:
		tile_type = game.map[x][y]
		
	match tile_type:
		Tile.Floor:
			game.player_tile = Vector2(x, y)
			
		Tile.Door:
			game.set_tile(x, y, Tile.Floor)
			
		Tile.Hole:
			game.go_to_next_level()
			
	#update_visuals() #Must call after physics is dealt with
	game.call_deferred("update_visuals")
