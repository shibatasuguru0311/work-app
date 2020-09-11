class UsersController < ApplicationController
def new
  if user_signed_in?
    @user = User.new
  else
    redirect_to root_path
  end
end

def show
  @user=User.find(params[:id])
  @currentUserEntry=Entry.where(user_id: current_user.id)
  @userEntry=Entry.where(user_id: @user.id)
  unless @user.id == current_user.id
    @currentUserEntry.each do |cu|
      @userEntry.each do |u|
        if cu.room_id == u.room_id then
          @haveRoom = true
          @roomId = cu.room_id
        end
      end
    end
    if @isRoom
    else
      @room = Room.new
      @entry = Entry.new
    end
  end
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


def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
    if @user.update(user_params)
      render :show
    else
      render :edit
    end
end

 private
 def user_params
   params.require(:user).permit(:name, :email, :profile, :image, :password, :id)
 end





end
