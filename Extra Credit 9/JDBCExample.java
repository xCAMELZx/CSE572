import java.sql.* ;

public class JDBCExample {

	 public static void main(String args[]) {

		 try{
 	    		//step1 load the driver class
 			Class.forName("oracle.jdbc.driver.OracleDriver") ;

 			//step2 create  the connection object
 			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@orafarm.cse.csusb.edu:1522:orcl", "yjarrar", "jy5836");

 			//step3 create the statement object

			Query 1
 			String query = "SELECT A.JOB_ID, B.DEPARTMENT_ID, B.LOCATION_ID FROM HR.EMPLOYEES A, HR.DEPARTMENTS B WHERE(B.DEPARTMENT_ID='80')" ;

			 Query 2
			String query = "SELECT E.LAST_NAME, D.DEPARTMENT_NAME, D.LOCATION_ID, L.CITY FROM HR.EMPLOYEES E, HR.DEPARTMENTS D, HR.LOCATIONS L WHERE(D.LOCATION_ID = L.LOCATION_ID AND E.COMMISSION_PCT != 0)";

			 Query 3
			String query = "SELECT E.LAST_NAME, E.JOB_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME FROM HR.EMPLOYEES E, HR.DEPARTMENTS D, HR.LOCATIONS L WHERE(E.DEPARTMENT_ID = D.DEPARTMENT_ID AND L.CITY = 'Toronto')";

			 Query 4
			String query = "SELECT E.LAST_NAME, E.EMPLOYEE_ID, M.LAST_NAME, M.MANAGER_ID FROM HR.EMPLOYEES E, HR.EMPLOYEES M WHERE E.MANAGER_ID = M.EMPLOYEE_ID";

			 Query 5
			String query = "SELECT E.LAST_NAME, E.HIRE_DATE, M.LAST_NAME, M.HIRE_DATE FROM HR.EMPLOYEES E, HR.EMPLOYEES M WHERE E.EMPLOYEE_ID = M.MANAGER_ID AND E.HIRE_DATE < M.HIRE_DATE";


 			PreparedStatement pstmt_employees = con.prepareStatement(query);

 			//step4 execute query
 			ResultSet rs_employees = pstmt_employees.executeQuery();

 			while (rs_employees.next()){

				 Query 1
				System.out.println("Job ID: " + rs_employees.getString(1));
				System.out.println("Department ID: " + rs_employees.getString(2));
				System.out.println("Location ID: " + rs_employees.getString(3) + '\n';

				 Query 2
				System.out.println("Department Name: " + rs_employees.getString(2));
				System.out.println("Location ID: " + rs_employees.getString(3));
				System.out.println("City: " + rs_employees.getString(4) + '\n');

				 Query 3
				System.out.println("Employee's Last Name: " + rs_employees.getString(1));
				System.out.println("Job: " + rs_employees.getString(2));
				System.out.println("Department ID: " + rs_employees.getString(3));
				System.out.println("Department Name: " + rs_employees.getString(4) + '\n');

				 Query 4
				System.out.println("Employee: " + rs_employees.getString(1));
				System.out.println("Emp#: " + rs_employees.getString(2));
				System.out.println("Manager: " + rs_employees.getString(3));
				System.out.println("Mgr#: " + rs_employees.getString(4) + '\n');

				Query 5
				System.out.println("Employee: " + rs_employees.getString(1));
				System.out.println("Hire date: " + rs_employees.getString(2));
				System.out.println("Manager: " + rs_employees.getString(3));
				System.out.println("Hire date: " + rs_employees.getString(4) + '\n');

 			}
		 } catch(Exception e){ System.out.println(e);}

	 }

}
