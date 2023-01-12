class GamesController < ApplicationController
  def index
    @user = current_user
    @game = Game.new
    @games = Game.all
  end

  def create
    @user = current_user
    @games = Game.all
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    if @game.save
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
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    redirect_to games_path
  end
  
  private
  
  def game_params
    params.require(:game).permit(:title, :body, :user_id)
  end
end
