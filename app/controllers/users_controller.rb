class UsersController < ApplicationController
  def index
    @user = current_user
    @game = Game.new
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @game = Game.new
    @games = @user.games.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render :edit
    else
      redirect_to current_user
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.email == 'guest@example.com'
      flash[:notice] = 'ゲストユーザーの編集はできません。'
      redirect_to games_path
    elsif @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました！"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.email == 'guest@example.com'
      flash[:notice] = 'ゲストユーザーの削除はできません。'
      redirect_to games_path
    else
      @user.destroy
      flash[:notice] = 'ユーザー削除しました。またのご利用をお待ちしております！'
      redirect_to root_path
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
