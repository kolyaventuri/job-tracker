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
      interest = rand(1..5)
      job.level_of_interest = interest
      job.save
      jobs.push(job)
      expected[interest.to_s] = 0 if expected[interest.to_s].nil?
      expected[interest.to_s] += 1
    end

    expected.keys.each do |key|
      expected[key.to_i] = expected.delete(key)
    end

    {
      jobs: jobs,
      expected: expected.sort.to_h
    }
  end
end
