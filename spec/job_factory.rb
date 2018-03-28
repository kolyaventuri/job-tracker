# Job factory for generating random number of jobs
class JobFactory
  def self.create(num)
    jobs = []
    expected = {}
    num.times do
      job = Job.new
      job.title = rand(36**8).to_s(36)
      job.city  = rand(36**8).to_s(36)
      interest = rand(1..5)
      job.level_of_interest = interest
      jobs.push(job)
      expected[interest.to_s] = 0 if expected[interest.to_s].nil?
      expected[interest.to_s] += 1
    end

    {
      jobs: jobs,
      expected: expected.sort.to_h
    }
  end
end
