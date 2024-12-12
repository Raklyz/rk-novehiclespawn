# No Vehicle Spawn Zone Script

Un script sencillo y eficiente para gestionar zonas donde no se permiten vehículos en tu servidor de FiveM.

## Características

1. **Sin dependencias externas**: No depende de frameworks o recursos adicionales.
2. **Persistencia local**: Guarda las zonas configuradas en un archivo JSON local.
3. **Carga automática**: Las zonas se cargan automáticamente al iniciar el recurso.
4. **Fácil de usar**: Diseñado para una implementación y configuración simples.
5. **Ligero**: No requiere dependencias complejas.

---

## Comandos

### **Agregar una nueva zona**
```bash
/addnospawnzone x y z radio [descripción]
```
- **x, y, z**: Coordenadas de la zona.
- **radio**: Radio de la zona donde no se permitirán vehículos.
- **[descripción]** (opcional): Una descripción de la zona.

### **Listar zonas configuradas**
```bash
/listnoSpawnZones
```
- Muestra una lista de todas las zonas configuradas.

---

## Ejemplo de uso

1. Agregar una zona:
    ```bash
    /addnospawnzone 254.12 -770.52 30.66 50.0 Zona de prueba
    ```
2. Listar zonas configuradas:
    ```bash
    /listnoSpawnZones
    ```


## Contribuciones

¡Se aceptan mejoras y contribuciones! Si encuentras errores o tienes ideas para nuevas funcionalidades, no dudes en hacer un pull request o reportar un issue.

---

## Licencia

Este proyecto está disponible bajo la licencia [MIT](https://opensource.org/licenses/MIT).
