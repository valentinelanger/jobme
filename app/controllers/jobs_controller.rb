class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    if params[:city].present? && params[:category].present?
      @city = params[:city]
      @category = params[:category]
      @jobs = Job.where('city ilike ? AND category ilike ?',
        "%#{params[:city]}%",
        "%#{params[:category]}%")
    else
      @jobs = Job.all
    end
  end

  def show
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(job_params)

      if @job.save
        redirect_to @job, notice: 'Job was successfully created.'
      else
        render :new
      end
  end

  def update
      if @job.update(job_params)
        redirect_to @job, notice: 'Job was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @job.destroy

    redirect_to jobs_url, notice: 'Job was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :city, :category, :description, :user_id)
    end
end
