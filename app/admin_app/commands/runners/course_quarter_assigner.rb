# frozen_string_literal: true

require './app/commands/runners/base'
require './administration/course_section_creator'
require './registration/fetchers/existing_courses'
require './registration/presenters/existing_courses'

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

            # create
          end

          private

          def selected_course
            courses[@course_idx]
          end

          def courses
            @courses ||= Registration::Fetchers::ExistingCourses.new.call
          end

          def courses_view
            Registration::Presenters::ExistingCourses.new.call
          end

          def create
            Administration::CourseSectionCreator.new(
              course_id: @course.id,
              quarter_id: @quarter.id
            ).call
          end
        end
      end
    end
  end
end
