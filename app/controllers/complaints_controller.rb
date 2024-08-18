class ComplaintsController < ApplicationController
  def new
    @complaint = Complaint.new
  end

  def create
    @complaint = Complaint.new(complaint_params)
    if @complaint.save
      redirect_to new_complaint_path, notice: 'Feedback submitted successfully!'
    else
      render :new
    end
  end

  private

  def complaint_params
    params.require(:complaint).permit(:username, :complaint, :category)
  end
end