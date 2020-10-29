class Race < ApplicationRecord
  require 'mechanize'

  has_one :rap

  with_options presence: true do
    validates :name
    validates :racetrack
    validates :day

  end
