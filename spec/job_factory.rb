# Job factory for generating random number of jobs
class JobFactory
  def self.create(num)
    jobs = Array.new(num, Job.new)
    expected = {}
    jobs.map do |job|
      job.title = rand(36**8).to_s(36)
      job.city  = rand(36**8).to_s(36)

      interest = rand(1..5)
      job.level_of_interest = interest
      expected[interest] = 0 if expected[interest].nil?
      expected[interest] += 1
    end

    {
      jobs: jobs,
      expected: expected
    }
  end
end
