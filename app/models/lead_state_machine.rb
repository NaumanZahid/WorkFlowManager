class LeadStateMachine < ActiveRecord::Base
  include Statesman::Machine

  #transition from: :active, to: :tech_review
  #transition from: :tech_review, to: :communication
  #transition from: :communication, to: :converted
  #transition from: :converted, to: :fell_off
  #transition from: :fell_off, to: :sleep
  #
  #
  #before_transition to: :active do |lead, transition|
  #  asd
  #  lead.active_exit_action
  #end

end
