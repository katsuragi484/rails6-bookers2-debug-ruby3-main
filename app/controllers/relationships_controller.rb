class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    relationship = Relationship.new(follower_id: current_user.id, followed_id: user.id)
    relationship.save!
    redirect_to request.referer
  end

  def destoy
  end

  def show_follow
  end

  def show_follower

  end
end
