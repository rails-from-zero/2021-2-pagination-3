class Comment < ApplicationRecord
  include Paginatable

  belongs_to :post
end
