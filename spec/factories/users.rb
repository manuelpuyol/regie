# frozen_string_literal: true

require './authentication/user'

FactoryBot.define do
  factory :user, class: 'Authentication::User' do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { '123456' }
    type { Authentication::User::TYPES[:student] }
  end

  trait :student do
    type { Authentication::User::TYPES[:student] }
  end

  trait :staff do
    type { Authentication::User::TYPES[:staff] }
  end

  trait :admin do
    type { Authentication::User::TYPES[:admin] }
  end
end
