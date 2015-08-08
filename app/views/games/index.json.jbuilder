json.array!(@games) do |game|
  json.extract! game, :id, :stock_id, :num_of_words, :player1_id, :player2_id
  json.url game_url(game, format: :json)
end
