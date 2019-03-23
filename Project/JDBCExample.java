import java.sql.* ;

public class JDBCExample {
	
	 public static void main(String args[]) {
		 
		 try{  
 	    		//step1 load the driver class  
 			Class.forName("oracle.jdbc.driver.OracleDriver") ;
   
 			//step2 create  the connection object    
 			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@orafarm.cse.csusb.edu:1522:orcl", "yjarrar", "jy5836") ;
   
 			//step3 create the statement object
 			String query = "select employee_id, first_name, last_name, email, phone_number, salary from hr.employees" ;
 			PreparedStatement pstmt_employees = con.prepareStatement(query) ;
   
 			//step4 execute query  
 			ResultSet rs_employees = pstmt_employees.executeQuery() ;
 			    					
 			while (rs_employees.next()){
 				
 				System.out.println("Employee ID:" + rs_employees.getString(1)) ;
 				System.out.println("Name: " + rs_employees.getString(3) + ", " + rs_employees.getString(2)) ;
 				System.out.println("Email: " + rs_employees.getString(4)) ;
 				System.out.println("Phone Number: " + rs_employees.getString(5)) ;
 				System.out.println("Salary: " + rs_employees.getString(6) + "\n") ;
 				
 			} 
		 } catch(Exception e){ System.out.println(e);}	
 
	 }

}
