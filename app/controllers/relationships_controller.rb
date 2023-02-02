class RelationshipsController < ApplicationController
  def create
    # user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    # relationships = Relationship.find_by(followed_id: current_user.id)
    # relationships.destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def index_follow
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def index_follower
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
