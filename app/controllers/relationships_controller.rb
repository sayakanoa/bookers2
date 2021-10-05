class RelationshipsController < ApplicationController

def follow
 current_user.follow(params[:id])? (redirect_to request.referer) : (render :follow)
 #redirect_to users_path
end

def unfollow
 current_user.unfollow(params[:id])? (redirect_to request.referer) : (render :unfollow)
 #redirect_to users_path
end

end
