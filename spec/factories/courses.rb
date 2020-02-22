# frozen_string_literal: true

require './authentication/user'

FactoryBot.define do
  factory :course, class: 'Registration::Course' do
    sequence(:name) { |n| "Course #{n}" }
    sequence(:code) { |n| "MCPS - #{n}" }
  end
end
