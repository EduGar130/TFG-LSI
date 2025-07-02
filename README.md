# Gestión de Inventarios Online - TFG

Este proyecto es el resultado del Trabajo de Fin de Grado en Ingeniería Informática, y consiste en el desarrollo completo de una aplicación web para la gestión de inventario, ventas y usuarios en una empresa tipo "Amazon".

## 📦 Estructura del Repositorio

```
├── docs/                 # Documentación académica del proyecto
│   ├── memoria           # Memoria principal del TFG
│   ├── modelo b-5        # Autorización para la publicación
│   ├── anexos/           # Manual de instalación, usuario, pruebas, etc.
|   ├── scripts/          # Scripts inicialización de BBDD
|   ├── demos/            # Demostraciones en video de la aplicación
│   └── graficos/         # Diagramas, capturas de pantalla y esquemas
│
├── code/                 # Código fuente completo
│   ├── front/            # Aplicación frontend (Angular 19 + PrimeNG)
│   │   ├── src/          # Código fuente del frontend
│   │   └── angular.json  # Configuración del proyecto Angular
│   │
│   └── back/             # Aplicación backend (Spring Boot)
│       ├── src/          # Código fuente del backend
│       └── pom.xml       # Configuración Maven del proyecto
```



---

## 🚀 Tecnologías Utilizadas

| Componente       | Tecnología                 |
|------------------|----------------------------|
| Frontend         | Angular 19 + PrimeNG       |
| Backend          | Java 17 + Spring Boot 3    |
| Base de Datos    | PostgreSQL 15+             |
| Seguridad        | Autenticación JWT (Bearer) |
| Documentación    | Swagger / OpenAPI          |
| Control de versiones | Git + GitHub           |

---

## 🧩 Funcionalidades Clave

- **Gestión de productos y categorías**
- **Inventario distribuido por almacenes**
- **Registro de ventas y movimientos**
- **Alertas automáticas por stock**
- **Visualización de estadísticas en dashboards**
- **Sistema de roles y autenticación**
- **Auditoría de acciones**
- **Generación y seeding de datos realistas**

---

## 👥 Tipos de Usuarios

- **Administrador**: acceso completo al sistema.
- **Encargado**: gestión completa pero limitada a su almacén.
- **Reponedor**: puede registrar movimientos y ver alertas en su almacén.
- **Marketing**: acceso solo a estadísticas y visualización de datos.

---

## 📚 Documentación Académica

Toda la documentación asociada al proyecto (memoria, anexos, capturas, manuales de usuario e instalación) está disponible en la carpeta [`docs/`](./docs).

---

## Instalación Rápida (Resumen)

> ⚠️ Consulta el **Anexo A** para la guía detallada.

### Backend
```bash
cd code/back
./mvnw spring-boot:run
```

### Frontend
```bash
cd code/front
npm install
ng serve
```

### BBDD
Será necesario instanciar una bbdd en postgre 16 o superior y a continuación ejecutar el script de inicialización

## 🧪 Pruebas y Validación
El sistema ha sido validado mediante:

- Pruebas unitarias en servicios backend y componentes frontend

- Pruebas funcionales sobre escenarios clave

- Tests de usabilidad con distintos perfiles de interés

- Revisión visual, accesos por rol y seguridad

## 📈 Mejoras Futuras
- Notificaciones externas por email o móvil

- Integración con sistemas de terceros vía API

- Internacionalización (idiomas y monedas)

## 👨‍💻 Autor
Eduardo García Romera
Estudiante de Ingeniería Informática - UNED
Correo: egarcia3266@alumno.uned.es
GitHub: [egromera](https://github.com/EduGar130)

## 📝 Licencia
Este software ha sido desarrollado como parte de un Trabajo de Fin de Grado y su uso está destinado exclusivamente a fines académicos.
