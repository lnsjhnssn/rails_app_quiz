class JobsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @jobs = Job.all
    render json: @jobs
  end

  def show
    @job = Job.find(params[:id])
    render json: @job
  end

  def create
    @job = Job.create(job_params)
  end

  private

  def job_params
    params.require(:job).permit(
      :name,
      :url,
      :employer_name,
      :employer_description,
      :job_title,
      :job_description,
      :year_of_experience,
      :education_requirement,
      :industry,
      :base_salary,
      :employment_type_id
    )
  end
end
