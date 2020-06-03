import '../model/emp.dart';

final List<String> empColumns1 = [
  'ID',
  'Name',
  'Dept',
];
final List<String> empColumns2 = [
  'ID',
  'DOS',
  'Salary(M)',
];
final List<String> empColumns3 = [
  'ID',
  'Name',
  'Dept',
  'Salary(A)',
];

final List<Emp> emps = [
  Emp(id: '001', name: 'Ramesh', dept: 'IT', dos: '2/2/2020', salary: 25000),
  Emp(id: '002', name: 'Suresh', dept: 'MG', dos: '3/2/2020', salary: 23000),
  Emp(id: '003', name: 'Rajesh', dept: 'CS', dos: '1/2/2020', salary: 18000),
  Emp(id: '004', name: 'Raju', dept: 'MG', dos: '3/2/2020', salary: 23500),
  Emp(id: '005', name: 'Sravan', dept: 'IT', dos: '2/2/2020', salary: 24000),
  Emp(id: '006', name: 'Abhiram', dept: 'IT', dos: '2/2/2020', salary: 24500),
  Emp(id: '007', name: 'Deepthi', dept: 'CS', dos: '1/2/2020', salary: 19000),
];