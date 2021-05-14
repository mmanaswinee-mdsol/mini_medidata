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
    Rake::Task['hello:process'].invoke

  	file = File.join(File.dirname(__FILE__), 'audit.txt')
    File.open(file, 'a') { |f| f.puts "A subject named #{subject_name} , enrolled to a Study named #{study_name} with priority 0" }
  end
  def audit_new
  	Rails.logger.info "**************inside audit log************"
    study_name, subject_name = study.name, subject.name

  	file = File.join(File.dirname(__FILE__), 'audit.txt')
	  File.open(file, 'a') { |f| f.puts "A subject named is being enrolled with priority -5" }
  end

  handle_asynchronously :audit, queue: :least_priority
  # handle_asynchronously :audit_new, queue: :top_most_priority
end

