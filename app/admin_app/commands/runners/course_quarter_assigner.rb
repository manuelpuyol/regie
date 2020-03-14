# frozen_string_literal: true

require './app/commands/runners/base'
require './administration/course_section_creator'
require './registration/fetchers/existing_courses'
require './registration/presenters/existing_courses'
require './registration/fetchers/available_quarters'
require './registration/presenters/available_quarters'
require './db/errors/record_not_found'

module App
  module AdminApp
    module Commands
      module Runners
        class CourseQuarterAssigner < App::Commands::Runners::Base
          def run
            @logger.print "\nHere are all the existing courses:\n"

            courses_view.each_with_index do |course, i|
              @logger.print "#{i} - #{course}"
            end

            @logger.print "\nSelect a course (0 - #{courses.size - 1}): "
            @course_idx = @logger.get.to_i

            @logger.print "\nSelected => #{courses_view[@course_idx]}"

            @logger.print "\nHere are all the existing quarters:\n"

            quarters_view.each_with_index do |quarter, i|
              @logger.print "#{i} - #{quarter}"
            end

            @logger.print "\nSelect a quarter (0 - #{quarters.size - 1}): "
            @quarter_idx = @logger.get.to_i

            @logger.print "\nSelected => #{quarters_view[@quarter_idx]}"

            @logger.print "\nProfessor email:"
            @email = @logger.get

            create

            @logger.print "\n\nCreated successfully!\n"
          rescue DB::Errors::RecordNotFound => e
            @logger.print e.message
          end

          private

          def selected_course
            courses[@course_idx]
          end

          def courses
            @courses ||= Registration::Fetchers::ExistingCourses.new.call
          end

          def courses_view
            @courses_view ||= Registration::Presenters::ExistingCourses.new.call
          end

          def selected_quarter
            quarters[@quarter_idx]
          end

          def quarters
            @quarters ||= Registration::Fetchers::AvailableQuarters.new.call
          end

          def quarters_view
            @quarters_view ||= Registration::Presenters::AvailableQuarters.new.call
          end

          def create
            Administration::CourseSectionCreator.new(
              course_id: selected_course.id,
              quarter_id: selected_quarter.id,
              professor_email: @email
            ).call
          end
        end
      end
    end
  end
end
