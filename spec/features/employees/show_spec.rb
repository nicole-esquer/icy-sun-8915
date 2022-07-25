require 'rails_helper'

RSpec.describe 'employees show page' do
   before :each do
      @department = Department.create!(name: "Department", floor: 1)
      @employee = @department.employees.create!(name: "Employee", level: 1)

      @ticket_1 = @employee.tickets.create!(subject: "ticket_1", age: 15)
      @ticket_2 = @employee.tickets.create!(subject: "ticket_2", age: 10)
      @ticket_3 = @employee.tickets.create!(subject: "ticket_3", age: 5)
      @ticket_4 = Ticket.create!(subject: "ticket_4", age: 2)

      visit employee_path(@employee)
   end

   it 'can visit employee show page' do
    expect(current_path).to eq(employee_path(@employee))
  end

   it "can view employee's name, level" do
      expect(page).to have_content(@employee.name)
      expect(page).to have_content(@employee.level)
   end

#unsure of how to test order for "list of all of their tickets from oldest to youngest"

   # it "can view oldest ticket assigned to the employee listed separately" 

   it "can view form to add ticket to employee" do
      expect(page).to_not have_content(@ticket_4.subject)

      fill_in :subject, with: @ticket_4.subject
      click_button 'Add Ticket'

      expect(current_path).to eq(employee_path(@employee))
      expect(page).to have_content(@ticket_4.subject)
   end

end