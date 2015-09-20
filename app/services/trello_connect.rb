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
    board
  end

  def add_user_to_board!(opts)
    user  = User.find_by! github_id: opts[:github_user_id]
    board = find_board_from_github_repo_id opts[:github_repo_id]
    board.add_member user.trello_member
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

  def find_board_from_github_repo_id(github_repo_id)
    Project.find_by(github_repo_id: github_repo_id).try :board
  end

end