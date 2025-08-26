# persistencia_de_datos

Un proyecto de Flutter para demostrar el uso de **persistencia de datos**, es decir, la capacidad de **guardar y recuperar información incluso después de cerrar la aplicación**.

## 📦 ¿Qué es la persistencia de datos?

La persistencia de datos permite que una app retenga datos entre sesiones. Es útil para:

- Guardar preferencias del usuario (modo oscuro, idioma, etc.).
- Almacenar sesiones o tokens de autenticación.
- Recordar configuraciones o formularios completados.
- Guardar información sin necesidad de conexión a internet.

## 🛠 Tecnologías usadas

- **Flutter**: framework para desarrollo multiplataforma.
- **shared_preferences**: plugin para almacenar datos simples como `String`, `int`, `double`, `bool` y `List<String>` de forma persistente en el dispositivo.

## 📁 Estructura básica

lib/
├── main.dart # Punto de entrada de la aplicación
└── screens/
└── home_screen.dart # Pantalla principal con lógica de lectura/escritura

## 💾 ¿Qué se guarda en este proyecto?

En este ejemplo, se guarda un **contador** (o cualquier otro dato simple) usando `shared_preferences`, que:

- Se incrementa cada vez que se presiona un botón.
- Se guarda automáticamente en el almacenamiento local.
- Se recupera automáticamente cuando la app se abre de nuevo.

## 🚀 Cómo ejecutar

1. Clona el repositorio:
   ```bash
   git clone https://github.com/tu_usuario/persistencia_de_datos.git
   cd persistencia_de_datos
   ```
