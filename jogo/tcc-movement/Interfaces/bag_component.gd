class_name BagComponent
extends Node

@export var mochila: InventoryData

func open_bag() -> void:
	if mochila == null:
		return
	print(mochila.items)
	# Aqui: abre UI real da mochila.
