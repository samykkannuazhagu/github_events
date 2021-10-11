class GithubEvent < ApplicationRecord
	belongs_to :repo
	belongs_to :actor, class_name: 'User'
	validates :public, length: { minimum: 2, maximum: 4 }
	validates :public, :event_type, presence: true

	default_scope { where(event_type: ["PushEvent", "ReleaseEvent", "WatchEvent"]) }
end



a = [12, 33, 38, 12, 87, 39, 71, 20, 63]
max = {"0" => 0}
a.combination(2).each do|a|
max = {a.sum.to_s => a} if a.sum.to_i > max.keys.first.to_i
end

max.values.first