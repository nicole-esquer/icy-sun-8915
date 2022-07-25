require 'rails_helper'

RSpec.describe 'department index page' do
   before :each do
      @department_1 = Department.create!(name: "Department 1", floor: 1)
      @employee_1 = @department_1.employees.create!(name: "Employee 1", level: 1)
      @employee_2 = @department_1.employees.create!(name: "Employee 2", level: 1)

      @department_2 = Department.create!(name: "Department 2", floor: 2)
      @employee_3 = @department_2.employees.create!(name: "Employee 1", level: 2)
      @employee_4 = @department_2.employees.create!(name: "Employee 1", level: 2)

      visit departments_path
  end

  it 'can visit department index page' do
    expect(current_path).to eq(departments_path)
  end

   it "has the name and floor" do
      within("#departments-#{@department_1.id}") do
         expect(page).to have_content(@department_1.name)
         expect(page).to have_content(@department_1.floor)
      end

      within("#departments-#{@department_2.id}") do
         expect(page).to have_content(@department_2.name)
         expect(page).to have_content(@department_2.floor)
      end
   end

   it "can view the name of employees under each department" do
      within("#departments-#{@department_1.id}") do
         expect(page).to have_content(@employee_1.name)
         expect(page).to have_content(@employee_1.name)
      end
   end
end

