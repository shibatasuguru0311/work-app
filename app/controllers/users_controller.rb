class UsersController < ApplicationController
def new
  if user_signed_in?
    @user = User.new
  else
    redirect_to root_path
  end
end

def show
  @user = User.find(params[:id])
end

def follow
  @user = User.find(params[:user_id])
  current_user.follow(@user)
  redirect_to user_path(@user)
end
#フォローする

def unfollow
  @user = User.find(params[:user_id])
  current_user.stop_following(@user)
  redirect_to user_path(@user)
end
#フォローを外す


def follow_list
@user = User.find(params[:user_id])
end
#フォローしてる人の一覧ページ

def follower_list
@user = User.find(params[:user_id])
end
#フォロワーの一覧ページ



end
