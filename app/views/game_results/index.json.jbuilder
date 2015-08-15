json.array!(@game_results) do |game_result|
  json.extract! game_result, :id, :game_id, :user_id, :problem_id, :correct, :consumed_time
  json.url game_result_url(game_result, format: :json)
end
