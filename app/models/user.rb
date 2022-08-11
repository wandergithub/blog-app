require_relative 'application_record'

class User < ApplicationRecord
  has_many :comment, :post, :like
end