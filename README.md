Thank you for clarifying! Here is your improved README with Tomcat and PostgreSQL reflected in the requirements and setup instructions:

---

# BC-Wellness-System

A Java web & desktop application for managing student wellness services at Belgium Campus.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Screenshots](#screenshots)
- [Requirements](#requirements)
- [Installation](#installation)
- [Running the Application](#running-the-application)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## Overview

**BC-Wellness-System** is designed to streamline the management of student wellness services at Belgium Campus. The system offers both web and desktop interfaces for ease of access and administration.

## Features

- Student registration and profile management
- Appointment scheduling with wellness staff
- Record-keeping for wellness consultations
- Secure staff and admin login
- Reports and analytics dashboard
- Notification and reminder system

## Screenshots

<!-- Add screenshots here if available -->
<!-- ![Screenshot1](screenshots/screenshot1.png) -->

## Requirements

- **Java 17** or later
- **Maven** (for dependency management and building)
- **PostgreSQL** (for persistent storage)
- **Apache Tomcat** (for the web component)
- **Git** (for version control)

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/KholdHart/BC-Wellness-System.git
   cd BC-Wellness-System
   ```

2. **Configure the Database**
   - Install PostgreSQL and create a database (e.g., `bc_wellness`).
   - Create a user and grant privileges to the database.
   - Import the schema from the `sql/` directory if available:
     ```bash
     psql -U your_user -d bc_wellness -f sql/schema.sql
     ```
   - Update the database configuration in the application (usually in `config.properties`, `application.properties`, or similar):
     ```
     spring.datasource.url=jdbc:postgresql://localhost:5432/bc_wellness
     spring.datasource.username=your_user
     spring.datasource.password=your_password
     ```

3. **Build the Project**
   ```bash
   mvn clean install
   ```

## Running the Application

### 1. Running the Desktop Application

- Locate the generated JAR file in the `target` directory after building.
- Run the application:
  ```bash
  java -jar target/bc-wellness-desktop.jar
  ```

### 2. Running the Web Application

- Copy the WAR file (`bc-wellness-web.war`) from the `target` directory to the `webapps` directory of your Tomcat installation.
- Start or restart Tomcat:
  ```bash
  $CATALINA_HOME/bin/startup.sh
  ```
- Access the application at:  
  `http://localhost:8080/bc-wellness-web`  
  (or adjust the path as needed for your setup)

## Usage

- **Login** with staff or admin credentials.
- **Register** new students and manage their profiles.
- **Schedule appointments** and manage wellness sessions.
- **Generate reports** as needed.

## Project Structure

```
BC-Wellness-System/
├── desktop/          # Desktop client source code
├── web/              # Web application source code
├── sql/              # Database schema and seed files
├── docs/             # Documentation
├── README.md
└── pom.xml           # Maven build file
```

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/my-feature`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature/my-feature`).
5. Open a pull request and describe your changes.

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

For questions or support, please contact [KholdHart](https://github.com/KholdHart).

---

Let me know if you want sections for environment variables, troubleshooting, or anything else!
