extends Pickables
class_name MagnetAll

func global_activate(scenetree: Node2D):
	var loot = scenetree.get_tree().get_nodes_in_group("loot")
	
	for things in loot:
		things.set_process(true)
	
