class Study < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :drug
    validates_numericality_of :age_limit , :greater_than => 7
    validates_numericality_of :phase , :less_than_or_equal_to => 5
    
end
