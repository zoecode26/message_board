require 'pg'

class MessageList

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'message_board_test')
    else
      connection = PG.connect(dbname: 'message_board')
    end
  end

  def self.all
    connection = connect
    result = connection.exec("SELECT * FROM messages;")

    all_messages = []
    result.each do |message|
      current_message = { message['name'] => message['message'] }
      all_messages << current_message
    end

    return all_messages
  end

  def self.add(new_name, new_message)
    connection = connect
    connection.exec("INSERT INTO messages (name, message) VALUES('#{new_name}', '#{new_message}')")
  end
end
