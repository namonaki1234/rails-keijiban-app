class PostsController < ApplicationController
    before_action :set_post, only: [:edit, :update, :destroy] #同じ記述の排除
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to posts_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @post.update(post_params)
            redirect_to posts_path
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_path
    end

    private # post_params （private以下の関数）をここのファイルでしか使えないようにする

    def post_params
        params.require(:post).permit(:title, :content) # Strong parameters
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
