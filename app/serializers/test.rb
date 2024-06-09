=begin
Designing an Employee Relationship Management Tool for a Retail Company

Description:

We aim to create a tool that effectively manages the relationships between employees within a retail organization. This tool should provide insights into:

    A. The direct manager of a given employee
    B. The direct reports (subordinates) of a given employee
    C. The co-workers of a given employee (those who share the same manager)

1. Data Structure Design:

To achieve this, we need to consider an appropriate data structure that can store and facilitate the retrieval of this employee relationship schema.

2. Implementation:

We should implement the following functionalities:

    add_employee(employee_name, manager_name, direct_reports): Adds a new employee to the system with their manager and direct reports.
    delete_employee(employee_name): Removes an employee from the system.
    update_employee(employee_name, manager_name, direct_reports): Updates an employee's manager and direct reports in the system.

2a. Employee Attributes:

Discuss the potential attributes that each employee entity might have to support the functionalities of this tool effectively.

3. Validation and Testing:

Describe the approaches and test cases that would be used to validate the correctness and robustness of the implemented solution.
=end

class EmployeeRelationshipManagementController < ApplicationController
  before_action :set_employee, only: %i[ delete_employee update_employee]

  def add_employee
    @employee = EmployeeRelationshipManagement.new(employee_params)
    if employee.save
      render json: @employee, status: :created
    else 
      render json: "Something bad happend"
    end
  end

  def delete_employee(employee_name)
    if @employee
      @employee.destroy
      render json: {response: no-content}
    else
      render json: {error: "employee could not found"}, status: :unprocessable_entity
    end
  end

  def update_employee
    if @employee
      @employee.update(employee_params)
      render json: @employee, status: :ok
    else
      render json: {error: "Employee could not found"}, status: :unprocessable_entity
    end
  end

  private 
  def set_employee
    @employee = EmployeeRelationshipManagement.find_by(employee_name: params[:employee_name])
  end
  def employee_params
    params(:employee).permit(:employee_name, :employee_manager, :direct_report)
  end
end

# def main
#   puts "Employee Relationship Management Tool"

#   erm = EmployeeRelationshipManagement.new

#   # Use the erm object to call methods
#   # For example:
#   # erm.add_employee("John Doe", "Jane Smith", ["Employee1", "Employee2"])
# end

if __FILE__ == $0
  main
end