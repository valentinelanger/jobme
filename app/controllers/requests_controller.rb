class RequestsController < ApplicationController
  before_action :set_request, only: [:show]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:job_id, :start_at, :end_at, :creator_id, :destinator_id)
    end
end
