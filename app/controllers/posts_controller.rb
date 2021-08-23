class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @post = current_user.posts.build(post_params)
    @post.file.attach(params[:post][:import_file])
    @lines = File.read(params[:post][:import_file])

    row = 1
    @lines.each_line do |line|
      if row == 1
        row = row + 1
      else
        columns = line.split("\t")
      end
    end

    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted"
    if request.referrer.nil? || request.referrer == posts_url
      redirect_to login_url
    else
      redirect_to request.referrer
    end
  end

  private

    def post_params
      params.require(:post).permit(:file)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end