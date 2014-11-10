class Payment < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordQueries
  has_many :payment_transitions

  def state_machine
    @state_machine ||= PaymentStateMachine.new(self, transition_class: PaymentTransition)
  end

  private

  def self.transition_class
    PaymentTransition
  end

  def self.initial_state
    PaymentStateMachine.initial_state
  end

end
