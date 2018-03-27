class JobsController < ApplicationController
  def index
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
    else
      @jobs = Job.all
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    if params[:company_id]
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @comments = Comment.where(params[:job_id] == :id)
    @comment = Comment.new()
    else
      @job = Job.find(params[:id])
      @comments = Comment.where(params[:job_id] == :id)
      @comment = Comment.new()
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
     @job = Job.find(params[:id])
     @job.update(job_params)
     if @job.save
       flash[:success] = "#{@job.title} updated!"
       redirect_to company_job_path(@job.company)
     else
       render :edit
    end
  end

  def destroy
    Job.find(params[:id]).destroy
    redirect_to company_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id, :company_id)
  end
end
