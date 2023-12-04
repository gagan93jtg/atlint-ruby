require 'debug'

class Ballot
  attr_accessor :candidates

  def initialize(array)
    self.candidates = []
    array.each_with_index do |candidate, i|
      candidates << BallotUnit.new(candidate, 3 - i)
    end
  end
end

class BallotUnit
  attr_accessor :candidate_name, :weightage

  def initialize(candidate_name, weightage)
    self.candidate_name = candidate_name
    self.weightage = weightage
  end
end

class Candidate
  include Comparable

  attr_accessor :weightages, :name

  def initialize(name)
    self.name = name
    self.weightages = []
  end

  # override the comparator
  def <=>(second_object)
    -(weightages.sum <=> second_object.weightages.sum)
  end

end

class Runner
  def get_results(ballots)
    candidates_map = Hash.new

    ballots.each do |ballot|
      ballot.candidates.each do |candidate|
        if candidates_map[candidate.candidate_name]
          candidate_object = candidates_map[candidate.candidate_name]
        else
          candidates_map[candidate.candidate_name] = Candidate.new(candidate.candidate_name)
          candidate_object = candidates_map[candidate.candidate_name]
        end

        candidate_object.weightages << candidate.weightage
      end
    end

    debugger

    candidates_map.sort_by {|k, v| v }
  end
end

ballots = [
  Ballot.new(["A", "B", "C"]),
  Ballot.new(["A", "C", "D"]),
  Ballot.new(["B", "D", "C"]),
]
r = Runner.new
puts r.get_results(ballots)


# A = [3]
# B = [1]


# {
#   "A" = [3, 3]
#   "B" = [2,1,3]
# }

