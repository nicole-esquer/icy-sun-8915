class EmployeeTicketsController < ApplicationController
   def create
      employee = Employee.find(params[:employee_id])
      ticket = Ticket.find_by(subject: params[:subject])
      employee_ticket = EmployeeTicket.new(employee_id: employee.id, ticket_id: ticket.id)
      if employee_ticket.save
         flash[:success] = "Ticket added"
         redirect_to employee_path(employee)
      else
         flash[:alert] = "Ticket could not be added"
         redirect_to employee_path(employee)
      end
   end
end