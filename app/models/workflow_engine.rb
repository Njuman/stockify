class WorkflowEngine < ActiveRecord::Base
  include Workflow

  self.table_name = 'workflows'

  workflow_column :status

  after_initialize :create_workflow

  before_create do |record|
    self.metadata = record.metadata
    self.name = self.class
  end

  def create_workflow
    @entity_action = entity_action if new_record? && save
  end

  def payload_as_hash
    Hash.try_convert(eval(metadata))
  end
end