class GameCommentsController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    comment = current_user.game_comments.new(game_comment_params)
    comment.game_id = game.id
    if comment.save
      flash[:notice] = "コメント投稿されました！"
      redirect_to game_path(game)
    else
      flash[:notice] = "エラーコメント内容を入力して下さい"
      redirect_to game_path(game)
    end
  end
  
  def destroy
    GameComment.find_by(id: params[:id]).destroy
    redirect_to game_path(params[:game_id])
  end
  
  private
  
  def game_comment_params
    params.require(:game_comment).permit(:comment)
  end
end
