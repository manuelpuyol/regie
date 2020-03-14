# frozen_string_literal: true

FactoryBot.define do
  factory :prerequisite, class: 'Registration::Prerequisite' do
    course_id { create(:course).id }
    prerequisite_id { create(:course).id }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
