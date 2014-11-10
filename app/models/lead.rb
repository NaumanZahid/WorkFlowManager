class Lead < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordQueries
  has_many :lead_transitions
  delegate :current_state, to: :state_machine

  def state_machine
    @state_machine ||= LeadStateMachine.new(self, transition_class: LeadTransition)
  end

  private

  def self.transition_class
    LeadTransition
  end

  def initial_state
    LeadStateMachine.initial_state
  end

  def send_email
    puts '####################################################'
    puts "Sending Email......."
    puts '####################################################'
  end

  def assign_task
    puts '####################################################'
    puts "Assigning Tasks"
    puts '####################################################'
  end

  def active_exit_action
    puts '####################################################'
    puts 'I am performing an action after exiting ACTIVE state.'
    puts '####################################################'
  end

end
