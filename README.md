# Bairoom  
**Plataforma web de gestión de reservas de habitaciones y propiedades**  
**Estado:** En desarrollo (Proyecto Intermodular DAW)

---

## 🎯 Descripción general

Bairoom es una aplicación web diseñada para gestionar reservas de habitaciones y pisos compartidos.  
Está orientada a trabajadores y estudiantes que necesitan una habitación temporal de forma sencilla, organizada y sin complicaciones.

La plataforma incluye distintos tipos de usuarios y funcionalidades a nivel profesional, con un sistema completo de gestión, control de ocupación y transparencia para los propietarios.

---

## 👤 Roles y funcionalidades

### **1. Administrador Bairoom**
- Gestión de usuarios y roles  
- Alta y administración de propietarios y sus propiedades  
- Gestión de habitaciones, ocupación y disponibilidad  
- Gestión de reservas: aceptar, rechazar o cancelar  
- Estadísticas básicas

### **2. Propietario**
- Visualizar sus propiedades cedidas  
- Consultar reservas activas, pasadas y futuras  
- Acceso a calendario de disponibilidad de cada habitación  

### **3. Inquilino**
- Registro y autenticación  
- Buscar habitaciones por ciudad, fechas y precio  
- Crear reservas indicando entrada y salida  
- Consultar y cancelar sus reservas

---

## 🧱 Base de datos (MySQL)

- 6 entidades principales: **rol, usuario, propiedad, habitación, reserva**  
- Relaciones bien definidas (1:N entre usuario–propiedad, propiedad–habitación…)  
- Integridad referencial con claves externas y ON UPDATE CASCADE  
- Conjunto de datos de prueba (10 usuarios, 10 reservas, 10 habitaciones, etc.)

📄 *Puedes ver el script completo aquí:*  
➡️ `docs/BBDD_BAIROOM.sql`

---

## 🧩 Arquitectura planificada

### **Backend (en desarrollo)**
- Node.js  
- Express (MVC)  
- MySQL  
- Autenticación JWT  
- Validaciones de disponibilidad  
- Middlewares por rol (admin, propietario, inquilino)

### **Frontend (pendiente)**
- React  
- Componentes reutilizables  
- Panel administrativo  
- Panel del propietario  
- Calendarios dinámicos de disponibilidad

---

## 🚧 Roadmap (próximos pasos)

- [ ] Crear backend (estructura MVC en `/backend`)  
- [ ] Endpoints REST de usuarios, propiedades, habitaciones y reservas  
- [ ] Autenticación y roles  
- [ ] Validación de solapamiento de fechas  
- [ ] Construcción del panel de administración  
- [ ] Construcción del panel de propietario  
- [ ] Construcción de la interfaz del inquilino  
- [ ] Implementar CI/CD con GitHub Actions  
- [ ] Montar frontend en `/frontend` con React  

---

## 📚 Documentación del proyecto

Toda la documentación presentada en DAW está incluida aquí:

📄 **Propuesta del proyecto ampliada**  
📄 **Esquema de pantallas**  
📄 **Esquema entidad–relación (E/R)**  
📄 **Script SQL con datos de prueba**

Se encuentra en la carpeta:  
➡️ `docs/`

---

## 📌 Funcionalidades del sistema (según requisitos del proyecto)

### 👨‍💼 Administrador Bairoom
- Gestión de usuarios y roles  
- Alta y administración de propietarios y sus propiedades  
- Gestión de habitaciones y disponibilidad  
- Gestión de reservas (aceptar, rechazar o cancelar)  
- Estadísticas básicas

### 🏠 Propietario
- Visualizar propiedades cedidas  
- Consultar reservas (actuales, pasadas y futuras)  
- Calendario de disponibilidad de habitaciones  

---


## 📎 Enlaces relacionados

- **Portfolio:** https://jesusbailen.github.io/portfolio/  
- **Contacto:** jesusbailensanchez@gmail.com  

---

## ✨ Autor

**Jesús Bailén**  
Desarrollador Web 
