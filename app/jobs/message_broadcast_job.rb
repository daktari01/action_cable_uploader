class MessageBroadcastJob < ApplicationJob
    queue as :default
    def perform(message)
        ActionCable.server.broadcast 'chat_channel', message: render_message(message)
    end
    
    private
    def render_message(message)
        MessageController.render partial: 'messages/message', locals: {message: message}
    end
end