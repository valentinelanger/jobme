class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :destroy]

  def show
    @job = Job.find(params[:job_id])
  end

  def new
    @request = Request.new
    @job = Job.find(params[:job_id])
  end

  def create
    @request = Request.new(request_params)
    @request.end_at = @request.start_at + 2.hours
    @job = Job.find(params[:job_id])
    @request.job = @job
    @request.creator = current_user
    @request.destinator = @job.user
    if @request.save
      redirect_to job_request_path(@job, @request), notice: 'Request was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @request.destroy
    if current_user == @request.destinator
      redirect_to users_missions_path, notice: 'Mission was successfully destroyed.'
    else
      redirect_to users_requests_path, notice: 'Appointment was successfully destroyed.'
    end
  end

  private

    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:start_at)
    end
end
