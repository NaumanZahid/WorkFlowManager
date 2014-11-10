class Workflow < ActiveRecord::Base
  has_many :transitions, autosave: true, dependent: :destroy

end
