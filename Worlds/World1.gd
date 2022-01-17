extends Node2D

func _ready():
	for x in range(-54,54):
		for y in range(-31,31):
			if int(round(rand_range(0,3))) == 0:
				if $FixMap.get_cell(x,y) == -1:
					$RandomMap.set_cell(x,y,int(rand_range(1,19)))

			elif int(round(rand_range(0,3))) == 0:
				if $FixMap.get_cell(x,y) == -1:
					$RandomMap2.set_cell(x,y,int(rand_range(1,32)))

