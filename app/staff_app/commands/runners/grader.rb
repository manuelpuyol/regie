# frozen_string_literal: true

require './app/commands/runners/base'
require './db/errors/base'
require './grading/presenters/student_sections'
require './grading/grader'

module App
  module StaffApp
    module Commands
      module Runners
        class Grader < App::Commands::Runners::Base
          def run
            @logger.print "\nThis are the quarters:\n\n"

            sections.each_with_index do |quarter, idx|
              @logger.print "#{idx} - #{quarter.first}"
            end

            print "\nSelect a quarter (0 - #{sections.size - 1}): "
            @quarter_idx = @logger.get.to_i
            @logger.print "Selected: #{selected_quarter}"

            selected_quarter_courses.each_with_index do |course, idx|
              @logger.print "#{idx} - #{course.first}"
            end

            print "\nSelect a course (0 - #{selected_quarter_courses.size - 1}): "
            @course_idx = @logger.get.to_i
            @logger.print "Selected: #{selected_course}"

            selected_course_students.each_with_index do |student, idx|
              @logger.print "#{idx} - #{student[:label]}"
            end

            print "\nSelect a student (0 - #{selected_course_students.size - 1}): "
            @student_idx = @logger.get.to_i
            @logger.print "Selected: #{selected_student[:label]}\n"

            print "\nGrade (A, B, C, F): "
            @grade = @logger.get

            grade

            @logger.print "\nGraded successfully!"
          rescue DB::Errors::Base => e
            @logger.print e.message
          end

          private

          def selected_student
            selected_course_students[@student_idx]
          end

          def selected_course_students
            selected_quarter_courses[@course_idx].last.to_a
          end

          def selected_course
            selected_quarter_courses[@course_idx].first
          end

          def selected_quarter
            sections[@quarter_idx].first
          end

          def selected_quarter_courses
            sections[@quarter_idx].last.to_a
          end

          def sections
            @sections ||= Grading::Presenters::StudentSections.new.call.to_a
          end

          def grade
            Grading::Grader.new(
              student_section_id: selected_student[:id],
              grade: @grade
            ).call
          end
        end
      end
    end
  end
end
