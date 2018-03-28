# Job factory for generating random number of jobs
class JobFactory
  def self.create(num, company, category)
    jobs = []
    expected = {}
    num.times do
      job = Job.new
      job.title = rand(36**8).to_s(36)
      job.city  = rand(36**8).to_s(36)
      job.company = company
      job.category = category
      interest = rand(0..100)
      job.level_of_interest = interest
      job.save
      jobs.push(job)
      normalized = interest / 20.0
      whole_part = normalized.to_i
      partial = normalized - whole_part
      partial = 0.5 unless partial.zero?
      interest_string = (whole_part + partial).to_s
      expected[interest_string] = 0 if expected[interest_string].nil?
      expected[interest_string] += 1
    end

    expected.keys.each do |key|
      expected[key.to_f] = expected.delete(key)
    end

    {
      jobs: jobs,
      expected: expected.sort.to_h
    }
  end
end
