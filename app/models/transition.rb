class Transition < ActiveRecord::Base
  belongs_to :from_state, :class_name => 'State', foreign_key: 'from_state_id'
  belongs_to :to_state, :class_name => 'State', foreign_key: 'to_state_id'
  belongs_to :workflow
end
