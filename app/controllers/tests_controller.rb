class TestsController < ApplicationController

  def createboard
    board = CreateBoardService.new(current_user, "board-test")
    board.call
    redirect_to root_path
  end

  def getboard
    board = GetCardsFromTrello.new(current_user, "5e5d2468afb9ce59727e2540")
    board_list = board.call
    raise
    redirect_to root_path
  end
end
