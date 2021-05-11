class Study < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :drug
    validates_numericality_of :age_limit , :greater_than => 7
    validates_numericality_of :phase , :less_than_or_equal_to => 5
    
    belongs_to :study_group
    has_many :sites

    has_many :enrollments
    has_many :subjects , through: :enrollments
end
