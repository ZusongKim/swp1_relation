class TimelineController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @blogs = Blog.all.reverse
    end
    
    def write
        Blog.create(content: params[:naeyong])
        redirect_to :root
    end
   
    def comment
        Comment.create(blog_id: params[:blog_id], msg: params[:comment])
        redirect_to :root
    end
    
    def blog_delete
        bd = Blog.find(params[:id])
        bd.destroy
        redirect_to :root
    end
 
    def blog_edit
        @blog = Blog.find(params[:id])
    end
 
    def blog_update
        bd = Blog.find(params[:id])
        bd.content = params[:naeyoung]
        bd.save
        redirect_to :root
    end
   
    def comment_delete
        bd = Comment.find(params[:id])
        bd.destroy
        redirect_to :root
    end
    
    def comment_edit
        @comment = Comment.find(params[:id])
    end
    
    def comment_update
        bd = Comment.find(params[:id])
        bd.msg = params[:naeyong]
        bd.save
        redirect_to :root
    end
    
    def userpage
        @users = User.all
    end
    
    def mypage
        @me = User.find(params[:id])
        @blogs = Blog.where(user_id: params[:id]).reverse
    end
    
    def mywrite
        Blog.create(user_id: current_user.id, content: params[:naeyong])
        redirect_to :back
    end 
end
