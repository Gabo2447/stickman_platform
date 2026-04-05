```text
  ███████╗████████╗██╗ ██████╗██╗  ██╗███╗   ███╗ █████╗ ███╗   ██╗
  ██╔════╝╚══██╔══╝██║██╔════╝██║ ██╔╝████╗ ████║██╔══██╗████╗  ██║
  ███████╗   ██║   ██║██║     █████╔╝ ██╔████╔██║███████║██╔██╗ ██║
  ╚════██║   ██║   ██║██║     ██╔═██╗ ██║╚██╔╝██║██╔══██║██║╚██╗██║
  ███████║   ██║   ██║╚██████╗██║  ██╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
  ╚══════╝   ╚═╝   ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
```

# ⠀⠀⠀

# 🔥 Stickman: Aether Walk

**Stickman** es un plataformas 2D de alta velocidad centrado en la precisión y el _time-attack_. El objetivo es simple: recolectar todas las monedas en el menor tiempo posible. Bajo su apariencia minimalista, el proyecto implementa una arquitectura de software robusta diseñada para un control fluido y escalabilidad.

## Tech Stack

- **Engine:** Godot 4.3 (Core system).
- **Language:** GDScript.
- **Architecture:** Finite State Machine (FSM) para el control de entidades.
- **Graphics:** Parallax2D nativo con soporte para resoluciones dinámicas.

## Demo

- _Próximamente: Enlace a itch.io / Video de gameplay._

## Run Locally

1. Clona el repositorio:

```bash
  git clone https://github.com/Gabo2447/stickman_platform.git
```

2.  Asegúrate de tener instalado **Godot 4.3** o superior.
3.  Abre el motor y selecciona `Import`.
4.  Navega hasta la carpeta del proyecto y selecciona el archivo `project.godot`.

## Usage/Examples

- **Movimiento:** `W/A/S/D` o `Flechas de dirección`.
- **Salto:** `Espacio`.
- **Lógica de Estados:** El jugador utiliza una estructura de nodos donde cada estado (Idle, Run, Jump, Fall) está encapsulado en su propio script, heredando de una clase base común.

## Optimizations

- **Physics Interpolation:** Movimiento de cámara procesado en `_physics_process` para eliminar el jittering.
- **Texture Repeat:** Uso de `Region Enabled` y `Mirroring` en el fondo para minimizar el consumo de memoria mientras se mantiene un entorno infinito.
- **Signal-Driven UI:** La interfaz de usuario no se actualiza cada frame; espera a que el `GameManager` emita señales de cambio de estado o puntuación.

## Lessons Learned

- **Arquitectura vs. Prototipado:** La importancia de refactorizar un controlador de personaje temprano para evitar la acumulación de deuda técnica.
- **Manejo de Viewports:** Cómo configurar el escalado de nodos `Parallax2D` para que funcionen correctamente en monitores con diferentes relaciones de aspecto (16:9, 21:9).

## Authors

- **Gabo** - _Desarrollador de Software & Game Dev en formación._

## License

[MIT](https://choosealicense.com/licenses/mit/)
