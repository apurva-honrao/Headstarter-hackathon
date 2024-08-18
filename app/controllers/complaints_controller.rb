class ComplaintsController < ApplicationController
  def new
    @complaint = Complaint.new
    @categories = Category.all
  end

  def create
    @complaint = Complaint.new(complaint_params)
    if @complaint.save
      redirect_to new_complaint_path, notice: 'Complaint submitted successfully!'
    else
      @categories = Category.all
      render :new
    end
  end

  private

  def complaint_params
    params.require(:complaint).permit(:username, :complaint, :category_id)
  end
end