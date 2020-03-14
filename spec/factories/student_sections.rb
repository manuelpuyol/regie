# frozen_string_literal: true

FactoryBot.define do
  factory :student_section, class: 'Registration::StudentSection' do
    transient do
      quarter { create(:quarter) }
    end

    student_id { create(:user, :student).id }
    section_id { create(:course_section, quarter_id: quarter.id).id }
    grade { %w[A B C F].sample }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
