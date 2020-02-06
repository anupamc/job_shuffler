require_relative '../lib/shuffle'
require_relative '../lib/validator'

str = String.new
input_job_arr = Array.new

until ARGF.eof
	input_job_arr << ARGF.gets.chomp.split('=>').collect!(&:strip)
end

job_arr = []

input_job_arr.each do |job|
	validator = Validator.new
	@validation_msg = validator.check_self_depedency(job_arr, job), validator.check_circular_depedency(job_arr, job) if job.size.eql?(2)
	job_arr << job
	job_arr.flatten!
end

validation_msg = @validation_msg.nil? ? [] : @validation_msg


puts validation_msg unless validation_msg.empty?


unless validation_msg.any?
	input_job_arr.each do |job|
		shuffle = Shuffle.new
		@formatted_job = shuffle.shuffle_job(str, job)
	end
end

puts @formatted_job unless @formatted_job.nil?