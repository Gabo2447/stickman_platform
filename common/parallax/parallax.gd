extends Parallax2D

func _ready() -> void:
    # Obtenemos el tamaño real de la textura que pusiste en el Sprite hijo
    var texture_width = $Sprite.texture.get_width()
    
    # Configuramos el Repeat Size automáticamente según la imagen
    repeat_size.x = texture_width
    
    # Si en pantalla completa se sigue viendo el borde, 
    # aumentamos los Repeat Times para que siempre haya cobertura
    repeat_times = 3