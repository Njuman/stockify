class WithdrawalWorkflow < WorkflowEngine

  workflow do
    state :new do
      event :submit, :transitions_to => :pending
    end
    state :pending do
      event :accept, :transitions_to => :confirmed
      event :reject, :transitions_to => :rejected
    end
    state :confirmed
    state :rejected
  end

  def submit
    puts 'i guess this worked as place i should celebrate this victory'
  end

  def accept
    puts 'i guess this worked as place i should celebrate this victory'
  end

  def reject
    puts 'i guess this worked as place i should celebrate this victory'
  end
end