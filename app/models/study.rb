class Study < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :drug
    validates_numericality_of :age_limit , :greater_than => 7
    validates_numericality_of :phase , :less_than_or_equal_to => 5
    after_save :send_email
    
    belongs_to :study_group , optional: true
    has_many :sites


    has_one_attached :my_image do |attachable|
        attachable.variant :thumb, resize: "100x100"
      end

    has_many :enrollments
    has_many :subjects , through: :enrollments

    scope :usable_drugs, -> { where("phase >= 4") }
    scope :under_trials, -> { where("phase < 4") }
    
    private

  def send_email
    StudyMailer.with( study: @study ).success_email.deliver_later
  end
end
