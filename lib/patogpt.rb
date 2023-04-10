require 'net/http'
require 'json'
require 'tty-markdown'
require 'tty-spinner'
require 'pastel'

module Patogpt
  def start(_args)
    def ask(q)
      payload = {
        model: 'gpt-3.5-turbo',
        messages: [{ role: 'user', content: q }]
      }

      uri = URI("https://api.openai.com/v1/chat/completions")

      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true

      request = Net::HTTP::Post.new(uri)
      request["Content-Type"] = "application/json"
      request["Authorization"] = "Bearer #{ENV['OPENAI_API_KEY']}"
      request.body = JSON.generate(payload)

      response = https.request(request)

      resp_json = JSON.parse(response.read_body)

      resp_json['choices'][0].dig('message', 'content')
    end

    q = ''

    pastel = Pastel.new

    while true
      puts ''
      puts ''
      print pastel.green(" >  ")

      q = gets.chomp

      break if q == "exit"

      if q.strip.length > 0
        a = ask(q)
        puts ''
        puts ''
        puts TTY::Markdown.parse(a)
      end
    end
  end
end
