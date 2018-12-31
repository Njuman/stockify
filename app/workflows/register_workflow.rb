class RegisterWorkflow < WorkflowEngine
  workflow do
    state :new do
      event :entity_action, transitions_to: :pending
    end
    state :pending do
      event :accept, transitions_to: :confirmed
      event :reject, transitions_to: :rejected
    end
  end

  def entity_action
    payload = payload_as_hash
    User.new(payload).save unless payload.nil?
  end
end