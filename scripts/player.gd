extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size: Vector2 # Size of the game window.

func _ready():
    screen_size = get_viewport_rect().size

func _process(delta):
    var input = get_input()
    velocity = input.normalized() * speed
    position += velocity * delta
    position = position.clamp(Vector2.ZERO, screen_size)

func get_input() -> Vector2:
    var input = Vector2.ZERO
    if Input.is_action_pressed("move_right"):
        input.x += 1
    if Input.is_action_pressed("move_left"):
        input.x -= 1
    if Input.is_action_pressed("move_down"):
        input.y += 1
    if Input.is_action_pressed("move_up"):
        input.y -= 1
    return input