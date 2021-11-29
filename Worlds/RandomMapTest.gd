extends TileMap

func _ready():
	for x in range(17):
		for y in range(10):
			set_cell(x,y,int(rand_range(1,32)))
