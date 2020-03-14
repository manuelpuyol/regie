# frozen_string_literal: true

FactoryBot.define do
  factory :course_section, class: 'Registration::CourseSection' do
    quarter_id { create(:quarter).id }
    course_id { create(:course).id }
    professor_id { create(:user, :staff).id }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
