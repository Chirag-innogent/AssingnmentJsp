package Services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import entities.Employee;

public class EmployeeServices {
	public static List<Employee> list=new ArrayList<>();
	
	public void loadData(){
		Employee e1= new Employee(101,"Chirag","tongia","123",true,25300,"chirag");
		Employee e2= new Employee(102,"abhishek","patidar","123",false,12000,"abhishek");
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
	public List<Employee> getData(){
		return list;
	}
	public void update(Employee emp) {
		Optional<Employee> employee = list.stream().filter(e->e.getId()==emp.getId()).findFirst();
		if(employee.isPresent()) {
//			list.remove(employee.get());
			list.stream().filter(e->e.getId()==emp.getId()).forEach(e->{
					e.setFirstName(emp.getFirstName());
					e.setLastName(emp.getLastName());
					e.setUserName(emp.getUserName());
					e.setPassword(emp.getPassword());
					e.setSal(emp.getSal());
					e.setAdmin(emp.isAdmin());});
		}else {
			return ;
		}
	}
	public void deleteEmp(Employee emp) {
		Optional<Employee> employee = list.stream().filter(e->e.getId()==emp.getId()).findFirst();
		if(employee.isPresent()) {
			list.remove(employee.get());
		}
	}
}
