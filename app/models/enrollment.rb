class Enrollment < ApplicationRecord
  belongs_to :study
  belongs_to :subject

  after_save :audit

  def audit
  	Rails.logger.info "**************inside audit log************"
  	AuditJob.perform_later self  #queue
  	#AuditJob.perform_later self  #queue
    #enrollment = args[0]  #enrollment object
    study_name, subject_name = study.name, subject.name

  	file = File.join(File.dirname(__FILE__), 'audit.txt')
	File.open(file, 'a') { |f| f.puts "A subject named #{subject_name} , enrolled to a Study named #{study_name}" }
  end
  handle_asynchronously :audit

end
