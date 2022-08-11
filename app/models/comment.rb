require_relative 'application_record'

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
end