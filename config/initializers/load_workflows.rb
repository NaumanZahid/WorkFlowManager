Workflow.all.each do |workflow|
  if workflow.active
    workflow.transitions.each do |transition|
      puts "From State #{transition.from_state.name.to_sym}"
      puts "To State #{transition.to_state.name.to_sym}"
      "#{workflow.workflow_type}StateMachine".constantize.transition from: transition.from_state.name.to_sym, to: transition.to_state.name.to_sym

      "#{workflow.workflow_type}StateMachine".constantize.before_transition from: transition.from_state.name.to_sym, to: transition.to_state.name.to_sym do  |entity, state_machine_transition|
        puts 'In Before Transition'
        state = State.find_by_name state_machine_transition.to_state.to_s
        unless state.tasks.nil?
          state.tasks.each do |task|
            puts "I am Performing an Action Before entering #{state_machine_transition.to_state.to_s.capitalize} State."
            entity.send task.name if task.task_type == 'before'
          end
        end
        puts 'Before Transition Callback Registering Completed'
      end

      "#{workflow.workflow_type}StateMachine".constantize.after_transition from: transition.from_state.name.to_sym, to: transition.to_state.name.to_sym do |entity, state_machine_transition|
        puts 'In After Transition'
        state = State.find_by_name state_machine_transition.to_state.to_s
        unless state.tasks.nil?
          state.tasks.each do |task|
            entity.send task.name if task.task_type == 'after'
          end
        end
        puts 'After Transition Callback Registering Completed'
      end

      puts "All states #{LeadStateMachine.states}"
      puts "Current State: #{Lead.new.current_state}"
      puts "Allowed State: #{Lead.new.state_machine.allowed_transitions}"

    end
  end
end
