require_relative 'application_record'

class User < ApplicationRecord
  has_many :comment
  has_many :post
  has_many :like
end