require_relative 'models/piglatinizer.rb'
require_relative 'config/environment'

# class App < Sinatra::Base
#   get '/' do
#     # erb :index
#     erb :user_input
#   end

#   post '/' do
#     #@piglatinized_text = Piglatinizer.new(params[:user_text])
#     @piglatinized_text = Piglatinizer.new(params[:text])
#     erb :results
#   end

# end


require_relative 'models/text_analyzer.rb'
require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    erb :index
  end
  
  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    erb :results
  end

end

