class Post < ApplicationRecord
  include Paginatable

  has_many :comments
end
