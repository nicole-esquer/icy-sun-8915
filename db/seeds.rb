# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

department_1 = Department.create!(name: "Department 1", floor: 1)
employee_1 = department_1.employees.create!(name: "Employee 1", level: 1)
employee_2 = department_1.employees.create!(name: "Employee 2", level: 1)

department_2 = Department.create!(name: "Department 2", floor: 2)
employee_3 = department_2.employees.create!(name: "Employee 1", level: 2)
employee_4 = department_2.employees.create!(name: "Employee 1", level: 2)

ticket_1 = employee_1.tickets.create!(subject: "ticket_1", age: 15)
ticket_2 = employee_1.tickets.create!(subject: "ticket_2", age: 10)
ticket_3 = employee_2.tickets.create!(subject: "ticket_3", age: 5)

