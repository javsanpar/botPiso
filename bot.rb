require 'telegram/bot'

token = IO.read("myToken.txt") #Change this

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
      when '/prueba'
	bot.api.send_message(chat_id: message.chat.id, text: "Bot en construcción")
      when '/personas'
	      personas = %x( ruby personasNmap.rb  )
	bot.api.send_message(chat_id: message.chat.id, text: "Personas en casa:\n"+personas)
    end
  end
end
