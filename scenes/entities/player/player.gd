extends CharacterBody2D
class_name Player

# --- CONFIGURACIONES ---
@export var stats: PlayerResource

@export_group("Objects")
@export var animation_player: AnimationPlayer
@export var sprite: Sprite2D