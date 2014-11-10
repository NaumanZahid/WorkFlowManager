class State < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :states_assigns
  has_and_belongs_to_many :tasks, autosave: true
  accepts_nested_attributes_for :tasks, :reject_if => :all_blank, :allow_destroy => true
end
