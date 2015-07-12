class TrelloConnect

  ORG_ID = ENV['TRELLO_ORG_ID']

  def self.create_board(name, description)
    Trello::Board.create name: name, description: description, organization_id: ORG_ID, prefs: {
      permissionLevel: 'org'
    }
  end

end