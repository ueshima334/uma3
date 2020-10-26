class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user,:comments).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
   @post = Post.find(params[:id])
   @comment = Comment.new
   @comments = @post.comments.includes(:user).order('created_at DESC')

  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to post_path(post)
    else
      render :edit
    end
  end

  def search
    @posts = Post.search(params[:keyword])
    render :index
  end
  private

  def post_params
    params.require(:post).permit(:text,images:[]).merge(user_id:current_user.id)
  end

end
