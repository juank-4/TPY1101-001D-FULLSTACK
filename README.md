Panel de Administración de Usuarios (Login & CRUD)
Explicación técnica breve de la solución
Este proyecto es un sistema web con arquitectura Cliente-Servidor enfocado en la gestión de usuarios (CRUD) y control de acceso.

Backend: Desarrollado como una API RESTful utilizando Spring Boot (Java). Implementa seguridad robusta mediante Spring Security y tokens JWT (JSON Web Tokens), asegurando rutas privadas y manejando encriptación de contraseñas con BCrypt. Utiliza Spring Data JPA para la persistencia de datos relacionales.

Frontend: Desarrollado como una Single Page Application (SPA) utilizando React y Vite. Implementa enrutamiento protegido con react-router-dom, gestión de estado global de sesión con zustand, y llamadas HTTP asíncronas configuradas mediante interceptores de axios para enviar automáticamente el token de autorización.

Instrucciones de instalación
Prerrequisitos
Java 17 o superior (Idealmente Java 21).

Node.js (v18 o superior).

MySQL Server (Instalado localmente o vía XAMPP/Docker).

Maven (Opcional, el proyecto incluye el wrapper mvnw).

Pasos
Clona este repositorio en tu máquina local.

Abre la carpeta del Backend en tu IDE favorito (IntelliJ IDEA, Eclipse, VSCode).

Abre la carpeta del Frontend en tu editor de código o terminal.

Dependencias utilizadas
Backend (Spring Boot)
spring-boot-starter-web: Para exponer la API REST.

spring-boot-starter-data-jpa: Para el mapeo objeto-relacional (Hibernate).

spring-boot-starter-security: Para la protección de endpoints.

java-jwt (Auth0): Para la generación y validación de tokens JWT.

mysql-connector-j: Driver oficial para conectar con MySQL.

lombok: Para reducir el código boilerplate (Getters, Setters, Constructores).

Frontend (React/Vite)
react / react-dom (v18): Librería principal.

react-router-dom: Para el manejo de rutas en la SPA.

react-bootstrap / bootstrap: Componentes UI y sistema de grillas.

zustand: Para el manejo de estados globales (ej. Token y Usuario).

axios: Para las peticiones HTTP al backend.

lucide-react: Para la iconografía moderna.

Puertos utilizados
Backend (Spring Boot): http://localhost:8080

Frontend (Vite): http://localhost:5173

Base de Datos (MySQL): 3306

Configuración de la base de datos
Abre tu gestor de base de datos MySQL (Workbench, phpMyAdmin, etc.).

Ejecuta el siguiente comando para crear la base de datos vacía:

SQL
CREATE DATABASE mi_base_de_datos;
En el proyecto Backend, ve a la ruta src/main/resources/application.properties y verifica que las credenciales coincidan con las de tu entorno local:

Properties
spring.datasource.url=jdbc:mysql://localhost:3306/mi_base_de_datos?useSSL=false&serverTimezone=UTC
spring.datasource.username=root
spring.datasource.password=tu_contraseña_aqui # Deja vacío si usas XAMPP/Laragon
Nota: Al iniciar el backend, Hibernate (ddl-auto=update) creará las tablas automáticamente y el archivo DataSeeder.java insertará los roles y el usuario administrador por defecto.

Ejecución del Backend
Abre una terminal en la raíz del directorio del backend.

Ejecuta el proyecto mediante el wrapper de Maven:

En Windows: .\mvnw spring-boot:run

En Mac/Linux: ./mvnw spring-boot:run
(Alternativamente, puedes ejecutar el archivo DemoApplication.java directamente desde tu IDE).

Ejecución del Frontend
Abre una terminal en la raíz del directorio del frontend.

Instala las dependencias del proyecto:

Bash
npm install
Inicia el servidor de desarrollo:

Bash
npm run dev
Credenciales de prueba
Una vez que ambos servidores estén corriendo, ingresa a http://localhost:5173/login y utiliza las siguientes credenciales autogeneradas por el sistema:

Correo electrónico: admin@admin.com

Contraseña: admin123

Integrantes de la dupla:

Isaac González
Juan Carlos Agüero
Isaac Amaru Gonzalez Saavedra

[Nombre de tu compañero/a aquí]
