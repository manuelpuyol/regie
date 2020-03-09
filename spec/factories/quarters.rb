# frozen_string_literal: true

FactoryBot.define do
  factory :quarter, class: 'Registration::Quarter' do
    year { 2020 }
    code { 1 }
    active { true }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
