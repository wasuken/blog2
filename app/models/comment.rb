class Comment < ApplicationRecord
  belongs_to :blog, optional: true
end
