class FavoritesController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    favorite = current_user.favorites.new(game_id: game.id)
    if current_user.email == 'guest@example.com'
      flash[:notice] = 'ゲストユーザーはいいねできません。'
      redirect_to game_path(game)
    else
      favorite.save
      redirect_to game_path(game)
    end
  end

  def destroy
    game = Game.find(params[:game_id])
    favorite = current_user.favorites.find_by(game_id: game.id)
    favorite.destroy
    redirect_to game_path(game)
  end
end
