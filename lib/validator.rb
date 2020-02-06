class Validator

	def check_self_depedency(job_arr, splitted_jobs)
		if splitted_jobs[0].eql?(splitted_jobs[1])
			return 'Jobs can’t depend on themselves.'
		end
	end

	def check_circular_depedency(job_arr, splitted_jobs)
		if job_arr.include?(splitted_jobs[0]) && job_arr.include?(splitted_jobs[1])
			return 'Jobs can’t have circular dependencies.'
		end
	end

end