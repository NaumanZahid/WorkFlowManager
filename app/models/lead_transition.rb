class LeadTransition < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordTransition

  
  belongs_to :lead, inverse_of: :lead_transitions

end
