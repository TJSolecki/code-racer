class RaceController < ApplicationController
  def start
    @prompt = %Q{class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        count = {}
        freq = [[] for i in range(len(nums) + 1)]
        for n in nums:
            count[n] = 1 + count.get(n, 0)
        for n, c in count.items():
            freq[c].append(n)
        res = []
        for i in range(len(freq) - 1, 0, -1):
            for n in freq[i]:
                res.append(n)
                if len(res) == k:
                    return res}

    pattern = /(\S+\s{0,1})/
    @sections = @prompt.scan(pattern).flatten
    lines = @prompt.split("\n")
    @whitespace_array = lines.map { |line| line.match(/^(\s*)/)[0] }

    p @whitespace_array
    puts @sections.inspect
    puts @prompt
  end
end
