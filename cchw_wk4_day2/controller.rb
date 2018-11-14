require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('models/game')

also_reload('models/*')

get('/') do
  erb :welcome
end

get('/:player_1_input/:player_2_input') do
  game = Game.new(params[:player_1_input], params[:player_2_input])
  @outcome = game.outcome()
  erb :display_outcome
end
