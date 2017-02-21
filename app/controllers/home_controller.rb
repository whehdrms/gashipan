require 'carrierwave/orm/activerecord'
class HomeController < ApplicationController
    def list
        if user_signed_in?
                ## perform a paginated query:
            @all_posts = Gull.all.order("id desc").paginate(:page => params[:page])
            
            # or, use an explicit "per page" limit:
            Gull.paginate(:page => params[:page], :per_page => 30)
        else
            redirect_to "/users/sign_in"
        end

    end
    
    def write
    end
    
    def write_action
        posts = Gull.new
        posts.title1 = params[:title]
        posts.content1 = params[:content]
        posts.image = params[:image]
        posts.user = current_user
        posts.save
        
        redirect_to "/"
    end
    
    def fix
        @fix_post = Gull.find(params[:gull_id])
    end
    
    def fix_action
        fix_post = Gull.find(params[:gull_id])
        fix_post.title1 = params[:title2]
        fix_post.content1 = params[:content2]
        fix_post.save
        
        redirect_to "/"
    end
    
    def destroy
        de_post = Gull.find(params[:gull_id])
        de_post.destroy
        
        redirect_to "/"
    end
    
    def sangse
        @sangse = Gull.find(params[:gull_id])
        begin
            @reply = Reply.find(params[:gull_id])
        rescue
            @reply = nil
        end
    end
    
    def reply
        new_reply = Reply.new
        new_reply.content = params[:content]
        new_reply.gull_id = params[:gull_id]
        new_reply.save
        
        redirect_to :back
    end
    


end
