class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @job = Job.find(params[:job_id])
    @comment = Comment.new()
  end

  def create
    @job = Job.find(params[:comment][:job_id])
    @comment = @job.comments.create(comment_params)
    if @comment.save
      redirect_to comment_path(@comment)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :job_id)
  end


end
