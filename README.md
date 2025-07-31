BC-Wellness-System
A Java web & desktop application for managing student wellness services at Belgium Campus.

Table of Contents
Overview
Features
Screenshots
Requirements
Installation
Running the Application
Usage
Project Structure
Contributing
License
Contact
Overview
BC-Wellness-System is designed to streamline the management of student wellness services at Belgium Campus. The system offers both web and desktop interfaces for ease of access and administration.

Features
Student registration and profile management
Appointment scheduling with wellness staff
Record-keeping for wellness consultations
Secure staff and admin login
Reports and analytics dashboard
Notification and reminder system
Screenshots
<!-- Add screenshots here if available --> <!-- ![Screenshot1](screenshots/screenshot1.png) -->
Requirements
Java 17 or later
Maven (for dependency management and building)
PostgreSQL (for persistent storage)
Apache Tomcat (for the web component)
Git (for version control)
Installation
Clone the repository

bash
git clone https://github.com/KholdHart/BC-Wellness-System.git
cd BC-Wellness-System
Configure the Database

Install PostgreSQL and create a database (e.g., bc_wellness).
Create a user and grant privileges to the database.
Import the schema from the sql/ directory if available:
bash
psql -U your_user -d bc_wellness -f sql/schema.sql
Update the database configuration in the application (usually in config.properties, application.properties, or similar):
Code
spring.datasource.url=jdbc:postgresql://localhost:5432/bc_wellness
spring.datasource.username=your_user
spring.datasource.password=your_password
Build the Project

bash
mvn clean install
Running the Application
1. Running the Desktop Application
Locate the generated JAR file in the target directory after building.
Run the application:
bash
java -jar target/bc-wellness-desktop.jar
2. Running the Web Application
Copy the WAR file (bc-wellness-web.war) from the target directory to the webapps directory of your Tomcat installation.
Start or restart Tomcat:
bash
$CATALINA_HOME/bin/startup.sh
Access the application at:
http://localhost:8080/bc-wellness-web
(or adjust the path as needed for your setup)
Usage
Login with staff or admin credentials.
Register new students and manage their profiles.
Schedule appointments and manage wellness sessions.
Generate reports as needed.
Project Structure
Code
BC-Wellness-System/
├── desktop/          # Desktop client source code
├── web/              # Web application source code
├── sql/              # Database schema and seed files
├── docs/             # Documentation
├── README.md
└── pom.xml           # Maven build file
Contributing
Contributions are welcome! To contribute:

Fork the repository.
Create a feature branch (git checkout -b feature/my-feature).
Commit your changes (git commit -am 'Add new feature').
Push to the branch (git push origin feature/my-feature).
Open a pull request and describe your changes.
License
This project is licensed under the MIT License.

Contact
For questions or support, please contact KholdHart.

