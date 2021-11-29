extends Node2D

func _ready():
	for x in range(17):
		for y in range(10):
			if int(round(rand_range(0,3))) == 0:
				if $FixMap.get_cell(x,y) == -1:
					$RandomMap.set_cell(x,y,int(rand_range(1,32)))
