require_relative '../lib/shuffle'
require_relative '../lib/validator'

describe Shuffle do
	let(:shuffle) { Shuffle.new }
	let(:str) { String.new }

	describe '#shuffle_job' do

		context 'scenario_001' do
		  let(:spitted_job) { ["''"] }

		  it " returns empty sequence "''" " do
		  	spitted_job.each do |job|
		  		@formatted_job = shuffle.shuffle_job(str, job)
		  	end

		    expect(@formatted_job).to eq("''")
		  end
		end

		context 'scenario_002' do
		  let(:spitted_job) { [['a']] }

		  it "returns job 'a'" do
		  	spitted_job.each do |job|
		  		@formatted_job = shuffle.shuffle_job(str, job)
		  	end

		    expect(@formatted_job).to eq('a')
		  end
		end

		context 'scenario_003' do
		  let(:spitted_job) { [['a'], ['b', 'c'], ['c']] }

		  it "returns job 'acb'" do
		  	spitted_job.each do |job|
		  		@formatted_job = shuffle.shuffle_job(str, job)
		  	end

		    expect(@formatted_job).to eq('acb')
		  end
		end

		context 'scenario_004' do
		  let(:spitted_job) { [['a'], ['b'], ['c']] }

		  it "returns job 'abc'" do
		  	spitted_job.each do |job|
		  		@formatted_job = shuffle.shuffle_job(str, job)
		  	end

		    expect(@formatted_job).to eq('abc')
		  end
		end

		context 'scenario_005' do
		  let(:spitted_job) { [['a'], ['b', 'c'], ['c', 'f'], ['d', 'a'], ['e', 'b'], ['f']] }

		  it "returns job 'adfcbe'" do
		  	spitted_job.each do |job|
		  		@formatted_job = shuffle.shuffle_job(str, job)
		  	end

		    expect(@formatted_job).to eq('adfcbe')
		  end
		end
	end

end