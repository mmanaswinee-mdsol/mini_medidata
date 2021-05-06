class StudyGroup < ApplicationRecord
    has_many :studies
    has_many :sites , through: :studies
end
