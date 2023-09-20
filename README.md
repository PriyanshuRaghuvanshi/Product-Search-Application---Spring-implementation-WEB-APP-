# Product Search Web Application (Spring MVC with Hibernate)

This is a web application that allows users to search for T-shirts based on color, size, gender, and output preference. The application uses Spring MVC for the web interface and Hibernate for data storage. Users can log in, input their search criteria, and view matching products.

## Features

- Web-based product search application developed using Spring MVC.
- Integrates Spring and Hibernate for data storage and retrieval.
- Allows users to log in and securely access the product search functionality.
- Accepts input parameters such as color, size, gender, and output preference.
- Searches for matching T-shirts in the database and displays the results.
- Dynamically loads new CSV files at a configurable location using a background thread.
- Handles user authentication and session management.
- Supports Spring versions 3 or 4.

## Usage

To run the web application, follow these steps:

1. Clone the repository or download the source code.

2. Set up your MySQL database and configure Hibernate properties in the `hibernate.cfg.xml` file.

3. Navigate to the project directory.

4. Build the project using Maven:

   ```shell
   mvn clean install
   ```

5. Deploy the application to your preferred web server (e.g., Tomcat).

6. Access the application in your web browser by entering the URL.

7. Log in with your credentials.

8. On the Product Search screen, input your search criteria, and click the "Search" button.

9. View the search results, which will be displayed based on your input parameters and output preference.

## Database Integration

The application uses Hibernate to store and retrieve T-shirt data from a MySQL database. You can configure the database connection and other Hibernate properties in the `hibernate.cfg.xml` file.

## Background Thread for CSV Files

The application employs a background thread to periodically check for new CSV files at a configurable location. When new files are detected, they are loaded into the database to keep the product data up to date.
