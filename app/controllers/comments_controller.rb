class CommentsController < ApplicationController

  # GET /comments
  def index
    @comments = current_user.comments
  end

  # GET /comments/1
  def show
    @comment = Comment.find(params[:id])
  end

  # GET /comments/new
  def new
    @comment = current_user.comments.new
  end

  # GET /comments/1/edit
  def edit
    @comment = current_user.comments.find(params[:id])
  end

  # POST /comments
  def create
    @comment = current_user.comments.new(comment_params)

      if @comment.save
        redirect_to @comment, notice: 'Comment was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /comments/1
  def update
    @comment = current_user.comments.find(params[:id])
      if @comment.update(comment_params)
        redirect_to @comment, notice: 'Comment was successfully updated.'
      else
    　   render :edit
      end
  end

  # DELETE /comments/1
  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:subject, :content)
    end
end
