class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set,only:[:show,:edit,:update,:destroy]
  before_action :move_to_index, only: [:edit]


  def index
    @posts = Post.includes(:user, :comments).order('created_at DESC')
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
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order('created_at DESC')
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
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
    params.require(:post).permit(:text, images: []).merge(user_id: current_user.id)
  end

  def move_to_index
   if user_signed_in? && current_user.id!= @post.user.id
    redirect_to root_path
   end
  end


  def set
    @post = Post.find(params[:id])
  end
end
