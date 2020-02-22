# frozen_string_literal: true

require './authentication/user'

FactoryBot.define do
  factory :course, class: 'Registration::Course' do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "Course #{n}" }
    sequence(:code) { |n| "MCPS - #{n}" }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
