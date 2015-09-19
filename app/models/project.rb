class Project < ActiveRecord::Base

  include TrelloConnect

  validates_presence_of :name

  after_create :init_trello_board!

  def trello_board
    Trello::Board.find trello_board_id
  end

  protected

  def init_trello_board!
    board = init_board! name
    update! trello_board_id: board.id
  end

end