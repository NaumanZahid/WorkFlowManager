class PaymentStateMachine < ActiveRecord::Base
  include Statesman::Machine

  state :pending, initial: :true
  state :confirmed
  state :paid
  state :cancelled

  transition from: :pending, to: [:confirmed, :cancelled]
  transition from: :confirmed, to: [:pending, :paid]
  transition from: :cancelled, to: :pending

  guard_transition to: :paid do |payment|
    payment.cash.to_i < 5000
  end

  event :pending do
   transition from: :cancelled, to: :pending
  end

  event :confirmed do
    transition from: :pending, to: :confirmed
  end

  event :paid do
    transition from: :confirmed, to: :paid
  end

  event :cancelled do
    transition from: :confirmed, to: :cancelled
    transition from: :pending, to: :cancelled
  end




end
