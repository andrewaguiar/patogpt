require 'net/http'
require 'json'
require 'tty-markdown'
require 'pastel'

class Patogpt
  def self.ask(q)
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

  def self.start(_args)
    q = ''

    pastel = Pastel.new

    puts "  _____      _         _____       _   "
    puts " |  __ \    | |       / ____|     | |  "
    puts " | |__) |_ _| |_ ___ | |  __ _ __ | |_ "
    puts " |  ___/ _` | __/ _ \| | |_ | '_ \| __|"
    puts " | |  | (_| | || (_) | |__| | |_) | |_ "
    puts " |_|   \__,_|\__\___/ \_____| .__/ \__|"
    puts "                            | |        "
    puts "                            |_|        "
    puts ""

    while true
      puts '..........................................................................................'
      puts ''
      print "@You: "

      q = gets.chomp

      break if q == "exit"

      if q.strip.length > 0
        a = ask(q)

        puts ''
        print '@PatoGtp: '
        puts TTY::Markdown.parse(a)
      end
    end
  end
end
