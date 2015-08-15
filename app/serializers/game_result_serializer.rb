class GameResultSerializer < ActiveModel::Serializer
  attributes :id, :game_id, :user_id, :problem_id, :correct, :consumed_time, :result
end
