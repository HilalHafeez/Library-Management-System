### LMS By Pir Hilal Ahmad



# Library Management System (LMS)

This repository contains the source code for the Library Management System (LMS) developed using .NET C# and Microsoft SQL Server.

## Prerequisites
1. **Visual Studio Code:** Ensure you have Visual Studio Code installed. Download it from [here](https://code.visualstudio.com/).
2. **.NET SDK:** Install the .NET SDK from [here](https://dotnet.microsoft.com/download).
3. **MS SQL Server:** Install Microsoft SQL Server. You can download the Express edition [here](https://www.microsoft.com/sql-server/sql-server-downloads).

## Setting up the Database
1. Open Microsoft SQL Server Management Studio (SSMS).
2. Execute the SQL scripts in the `DatabaseScripts` folder to create the necessary database and tables.

## Running the Project
1. Open the project folder in Visual Studio Code.
2. Navigate to the `src` directory.
3. Run the following commands in the terminal:
   ```
   dotnet restore
   dotnet build
   dotnet run
   ```
4. Open your web browser and go to `http://localhost:5000` to access the Library Management System.

## Configuration
- Adjust the database connection string in the `appsettings.json` file to match your SQL Server setup.

Feel free to explore and customize the code as needed. If you encounter any issues, refer to the documentation or reach out to the project contributors for assistance.

Happy coding!
