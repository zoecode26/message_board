require 'message_list'

describe MessageList do

  describe '#all' do
    it 'returns list of all names and messages' do
      connection = PG.connect(dbname: 'message_board_test')
      connection.exec("INSERT INTO messages (name, message) VALUES ('Bob','Hello');")
      expect(MessageList.all).to include({ 'Bob' => 'Hello' })
    end
  end
end
