StatesAssign.all.each_with_index do |states_assign|
  initial = false
  initial = true if states_assign.state.name == 'active'
  "#{states_assign.assigned_to}StateMachine".constantize.state states_assign.state.name.to_sym, initial: initial
end

puts '##############################'
puts  LeadStateMachine.states
puts '##############################'