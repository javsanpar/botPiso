require 'telegram/bot'

token = '362499253:AAHGkSVHLZa_oasHBhUMD0WI8rcR-LCDsnE'

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
