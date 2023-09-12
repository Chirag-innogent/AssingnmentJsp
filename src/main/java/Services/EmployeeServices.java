package Services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import entities.Employee;

public class EmployeeServices {
	public static List<Employee> list=new ArrayList<>();
	
	public void loadData(){
		Employee e1= new Employee(1,"aaa","aaa","123",true,10000,"aaa");
		Employee e2= new Employee(2,"bbb","bbb","123",false,12000,"bbb");
		list.add(e1);
		list.add(e2);
	}
	public Employee login(String userName,String password) {
		Optional<Employee> emp = list.stream().filter(e-> (e.getUserName().equals(userName)&& e.getPassword().equals(password))).findFirst();
		System.out.println(emp);
		if(emp.isPresent())
			return emp.get();
		return null;
	}
	public boolean addEmployee(Employee emp) {
		return list.add(emp);
	}
}
