module TrelloConnect

  ORG_ID = ENV['TRELLO_ORG_ID']

  DEFAULTS = {
    description: 'created via gt',
    list_names:  ["Milestones", "Assets", "Backlog", "Todo", "Sprint", "Doing", "Pending Merge", "Done", "Staging", "Production"]
  }

  def init_board!(name)
    board = create_board! name
    board.lists.each &:close!
    create_default_lists! board.id
  end

  protected

  def create_board!(name)
    Trello::Board.create(
      name: name,
      description: DEFAULTS[:description],
      organization_id: ORG_ID,
      prefs: {
        permissionLevel: 'org'
      }
    )
  end

  def create_default_lists!(board_id)
    DEFAULTS[:list_names].each_with_index do |name, index|
      Trello::List.create name: name, board_id: board_id, pos: (index + 1)
    end
  end

end