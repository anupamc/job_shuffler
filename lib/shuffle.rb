class	Shuffle

	def shuffle_job(str, splitted_jobs)
		if splitted_jobs.size.eql? 2
			first_str_index = str.rindex(splitted_jobs[0])
			second_str_index = str.rindex(splitted_jobs[1])
			assign_job(str, splitted_jobs, first_str_index, second_str_index)
		else
			str << splitted_jobs[0] unless str_present?(str, splitted_jobs)
		end
		return str
	end

	def assign_job(str, splitted_jobs, first_str_index, second_str_index)
		str << splitted_jobs[1] << splitted_jobs[0] if first_str_index.nil? && second_str_index.nil?
		str.insert(first_str_index, splitted_jobs[1]) unless first_str_index.nil?
		str.insert(second_str_index + 1, splitted_jobs[0]) unless second_str_index.nil?
		return str
	end

	
	private

	def str_present?(str, splitted_jobs)
		str.include? splitted_jobs[0]
	end

end