# 💬 ChatApp

A real-time chat application built with **Flutter** for the frontend and **Spring Boot** for the backend. This app allows **multiple users** to sign in, register, and communicate in real-time using **WebSocket**.

---

## 🚀 Features

- 🔐 User Authentication (Login & Signup)
- 🧑‍🤝‍🧑 Multi-user support
- 📡 Real-time messaging using WebSocket
- 💻 Built with Flutter (Frontend) & Spring Boot (Backend)

---

## 📱 Frontend - Flutter


- Login & Signup screens with form validation
- Real-time chat interface
- WebSocket integration for instant messaging

### 🛠️ Packages Used (Flutter)
- `web_socket_channel` – WebSocket support
- `http` – API calls

---

## ⚙️ Backend - Spring Boot

- REST APIs for user registration & login
- WebSocket configuration for chat communication
- JWT Token based authentication


### 📦 Dependencies (Spring Boot)
- `spring-boot-starter-web`
- `spring-boot-starter-websocket`
- `spring-boot-starter-security`
- `spring-boot-starter-data-jpa`
- Database: (H2/MySQL/PostgreSQL – as per your setup)

---

## 🧪 How to Run

### 💻 Backend (Spring Boot)

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/chatapp.git
   cd chatapp/backend
