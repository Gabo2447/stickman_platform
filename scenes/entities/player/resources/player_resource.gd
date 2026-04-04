extends Resource
class_name PlayerResource

@export_group("Player Stats")
@export var speed: float = 200.0
@export var gravity: float = 500.0
@export var jump_force: float = 300.0

@export var acceleration: float = 2000.0 # Qué tan rápido arranca
@export var friction: float = 1500.0 # Qué tan rápido frena