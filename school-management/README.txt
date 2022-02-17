school management in spring

This project was created after learning the fundamentals of Spring MVC with Hibernate and originally created by: Herman Redona


The complete source code for the project is available.

1. SQL Scripts
The SQL scripts are location in the directory: sql-scripts
- create-user.sql
- school-management.sql

run this script first before running the java project.

2. Data source configuration
The project the data source configurations in the config file: spring-mvc-crud-demo-servlet. 
This file define one datasource. 
For datasource defined, you need to add
- session factory
- transaction manager
- tx:annotation driven

3. Java DAO code
The project includes DAOs for Student, Instructor, Course, and Employee. Make note of the @Autowired for the respective session factory. Also make note of the use of @Transacrtional with the name the of appropriate bean.

4. Java Service code
The service makes use of the ctudent, Instructor, Course, and Employee DAOs

5. Controller code
I created multiple controller for each entity
	- StudentController
	- AddressController
	- InstructorController
	- StudentController
The controller used the server to retrieve the data. The data is placed in the model.
Note: AddressController is not necessary in this project, it was just used for testing to make sure Address entity works as intended. 

6. View page
Files: 
	- address-form.jsp
	- address-list.jsp
	- course-form.jsp
	- course-list.jsp
	- instructor-course-add.jsp
	- instructor-form.jsp
	- instructor-list.jsp
	- instructor-view.jsp
	- student-course-add.jsp
	- student-form.jsp
	- student-list.jsp
	- student-view.jsp
This JSP page displays the results. I also used bootstrap framework on this project to make it look nicer.











