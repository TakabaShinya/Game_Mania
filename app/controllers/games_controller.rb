class GamesController < ApplicationController
  def index
    @user = current_user
    @game = Game.new
    @games = Game.page(params[:page]).reverse_order
  end

  def create
    @user = current_user
    @games = Game.page(params[:page]).reverse_order
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    if @user.email == 'guest@example.com'
      flash[:notice] = 'ゲストユーザーは投稿できません。'
      redirect_to games_path
    elsif @game.save
      flash[:notice] = "新規投稿されました！"
      redirect_to game_path(@game.id)
    else
      render :index
    end
  end

  def show
    @game = Game.find(params[:id])
    @user = @game.user
    @game_new = Game.new
    @game_comment = GameComment.new
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    redirect_to games_path
  end
  
  private
  
  def game_params
    params.require(:game).permit(:title, :hard, :game_image, :body, :user_id)
  end
end
