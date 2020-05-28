class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
    render :index
  end

  def new
   @employee = Employee.new
   render :new
  end

  def create
    @employee = Employee.new(employee_params)
    @division = Division.find(@employee.division_id)
    if @employee.save
      redirect_to division_path(@division)
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    render :edit
  end

  def show
    @employee = Employee.find(params[:id])
    @division = Division.find(@employee.division_id)
    render :show
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to employees_path
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  end

  private
    def employee_params
      params.require(:employee).permit(:name, :division_id)
    end
  
end