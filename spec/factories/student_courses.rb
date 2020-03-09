# frozen_string_literal: true

FactoryBot.define do
  factory :student_section, class: 'Registration::StudentSection' do
    student_id { create(:user, :student).id }
    course_id { create(:course).id }
    grade { ['A', 'B', 'C', 'F'].sample }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
