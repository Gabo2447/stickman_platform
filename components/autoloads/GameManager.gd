class_name GameManager
extends Node

signal coins_changed(new_amount: int)
signal player_death()

var coins: int = 0:
	set(value):
		coins = value
		coins_changed.emit(coins)
		print(coins)