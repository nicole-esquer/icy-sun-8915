require 'rails_helper'

RSpec.describe 'department index page' do
   it "has the name and floor, and underneath the names of the employees" do
      department_1 = Department.create!(name: "Department 1", floor: 1)
      employee_1 = Employee.create!(name: "Employee 1", level: 1, department_id: department_1)
      employee_2 = Employee.create!(name: "Employee 2", level: 1, department_id: department_1)

      department_2 = Department.create!(name: "Department 2", floor: 2)
      employee_3 = Employee.create!(name: "Employee 1", level: 2, department_id: department_2)
      employee_4 = Employee.create!(name: "Employee 1", level: 2, department_id: department_2)

      visit "/departments/"

      within("#departments-#{@department_1.id}") do
         expect(page).to have_content(@department_1.name)
         expect(page).to have_content(@department_1.floor)
      end

      within("#departments-#{@department_2.id}") do
         expect(page).to have_content(@department_2.name)
         expect(page).to have_content(@department_2.floor)
      end

      within("#departments-#{@department_1.id}") do
         expect(page).to have_content(@employee_1.name)
         expect(page).to have_content(@employee_1.name)
      end
   end
end

