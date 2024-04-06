extends CharacterBody2D

@onready var sprite = %Sprite
var available_sprites: Array #array of strings

var speed := 100
var direction := Vector2()

# Rotation variables
var rotation_speed := 0.05 # Change this value to control the rotation speed
var rotation_target := 2 * PI # Full rotation (360 degrees) in radians
var rotation_current := 0.0
var scale_bacteria := 0.2

var elapsed_time

func _ready():
    initialize_available_sprites()
    var rand_texture: int = randi()%len(available_sprites)
    sprite.texture = load(available_sprites[rand_texture])
    sprite.expand_mode = 1
    self.scale = Vector2(scale_bacteria, scale_bacteria)
    direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
    #sprite.modulate.a = 0
    #%AnimationPlayer.play("FadeAppear")
    print(rand_texture)
    if rand_texture:
        %AnimationPlayer.play("BacteriaCapsAnim")
    else:
        %AnimationPlayer.play("BacteriaSphereAnim")

func initialize_available_sprites():
    #var path_sprites_folder = "res://A7/bacteria/"
    #for file_name in DirAccess.get_files_at(path_sprites_folder):
        #if (file_name.get_extension() == "import"):
            #file_name = file_name.replace('.import', '')
            #available_sprites.append(path_sprites_folder+file_name)
    available_sprites = ["res://A7/bacteria/bacteriaSphere1.png", "res://A7/bacteria/bacteriaCaps1.png"]

func _physics_process(delta):
    move_and_slide()
    rotation_current = lerp(rotation_current, rotation_target, rotation_speed * delta)
    rotate(rotation_current - rotation)
    velocity = direction * speed


func _on_area_2d_body_entered(body):
    if body is CharacterBody2D:
        print("bacteria bounce")
        body.direction *= -1
        self.direction *= -1


func _on_sprite_gui_input(event):
    if Input.is_action_just_pressed("LeftClick"):
        %AudioStreamPlayer2D.play()
        %Sprite.material.set_shader_parameter("blob", true)
        %Timer.start()
        %TimerAttenuation.start()
        elapsed_time = 0


func _on_timer_timeout():
    %Sprite.material.set_shader_parameter("blob", false)


func _on_timer_attenuation_timeout():
    elapsed_time += 0.2
    %Sprite.material.set_shader_parameter("attenuation", 1 - elapsed_time)
