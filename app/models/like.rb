require_relative 'application_record'

class Like < ApplicationRecord
  belongs_to :user, :post
end