require 'natto'

class Blog < ApplicationRecord
  has_many :comments
  def create_tags_string_from_body(body)
    nm = Natto::MeCab.new
    results = []
    nm.parse(body) do |n|
      puts " >> #{n.surface} \t>> #{n.feature}"
      results.push n.surface
    end
    results.select{|v| v.size >= 3}.join(' ')
  end
end
