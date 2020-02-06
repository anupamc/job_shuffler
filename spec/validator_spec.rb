require_relative '../lib/shuffle'
require_relative '../lib/validator'

describe Validator do
	let(:validator) { Validator.new }
	let(:job_arr) { Array.new }

	describe '#check_self_depedency' do

		context 'scenario_001' do
		  let(:spitted_job) { [['a'], ['b'], ['c', 'c']] }

		  it "returns Jobs can’t depend on themselves" do
		  	spitted_job.each do |job|
		  		@validation_msg = validator.check_self_depedency(job_arr, job) if job.size.eql?(2)
		  		job_arr << job
		  		job_arr.flatten!
		  	end

		    expect(@validation_msg).to eq('Jobs can’t depend on themselves.')
		  end
		end

		context 'scenario_002' do
		  let(:spitted_job) { [['a'], ['b', 'c'], ['c', 'f'], ['d', 'a'], ['e'], ['f', 'b']] }

		  it "returns Jobs can’t have circular dependencies" do
		  	spitted_job.each do |job|
		  		@validation_msg = validator.check_circular_depedency(job_arr, job) if job.size.eql?(2)
		  		job_arr << job
		  		job_arr.flatten!
		  	end

		    expect(@validation_msg).to eq('Jobs can’t have circular dependencies.')
		  end
		end
	end

end