class UserCommentsController < ApplicationController
  
  # GET /user_comments
  def index
    @user_comments = current_user.user_comments
  end

  # GET /user_comments/1
  def show
    @user_comment = current_user.user_comments.find(params[:id])
  end

  # GET /user_comments/new
  def new
    @user_comment = current_user.user_comments.new
  end

  # GET /user_comments/1/edit
  def edit
    @user_comment = current_user.user_comments.find(params[:id])
  end

  # POST /user_comments
  def create
    @user_comment = current_user.user_comments.new(user_comment_params)
    if @user_comment.save
      redirect_to @user_comment, notice: 'User comment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /user_comments/1
  def update
    @user_comment = current_user.user_comments.find(params[:id])
    if @user_comment.update(user_comment_params)
      redirect_to @user_comment, notice: 'User comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /user_comments/1
  def destroy
    @user_comment = current_user.user_comments.find(params[:id])
    @user_comment.destroy
    redirect_to user_comments_url, notice: 'User comment was successfully destroyed.'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_comment_params
      params.require(:user_comment).permit(:subject, :content)
    end
end
