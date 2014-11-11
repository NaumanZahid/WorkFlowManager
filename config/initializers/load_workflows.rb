Workflow.all.each do |workflow|
  if workflow.active
    workflow.transitions.each do |transition|
      "#{workflow.workflow_type}StateMachine".constantize.transition from: transition.from_state.name.to_sym, to: transition.to_state.name.to_sym

      "#{workflow.workflow_type}StateMachine".constantize.before_transition from: transition.from_state.name.to_sym, to: transition.to_state.name.to_sym do  |entity, state_machine_transition|
        state = State.find_by_name state_machine_transition.to_state.to_s
        unless state.tasks.nil?
          state.tasks.each do |task|
            entity.send task.name if task.task_type == Task::TASK_TYPE_BEFORE
          end
        end
      end

      "#{workflow.workflow_type}StateMachine".constantize.after_transition from: transition.from_state.name.to_sym, to: transition.to_state.name.to_sym do |entity, state_machine_transition|
        state = State.find_by_name state_machine_transition.to_state.to_s
        unless state.tasks.nil?
          state.tasks.each do |task|
            entity.send task.name if task.task_type == Task::TASK_TYPE_AFTER
          end
        end
      end

    end
  end
end
