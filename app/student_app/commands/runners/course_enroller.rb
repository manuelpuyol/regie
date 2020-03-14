# frozen_string_literal: true

require './app/commands/runners/base'
require './registration/errors/base'
require './registration/fetchers/available_courses'
require './registration/presenters/available_courses'
require './registration/course_enroller'

module App
  module StudentApp
    module Commands
      module Runners
        class CourseEnroller < App::Commands::Runners::Base
          def run
            @logger.print "\nThese are the available courses for the current quarter:\n\n"

            presented_courses.each_with_index do |course, idx|
              @logger.print "#{idx} - #{course}"
            end

            @logger.print "\n"

            print "Select a course (0 - #{presented_courses.size - 1}): "
            @course_idx = @logger.get.to_i

            @logger.print "Selected: #{presented_courses[@course_idx]}"

            enroll

            @logger.print 'Successfully enrolled!'
          rescue Registration::Errors::Base => e
            @logger.print e.message
          end

          private

          def enroll
            Registration::CourseEnroller.new(course: selected_course).call
          end

          def selected_course
            courses[@course_idx]
          end

          def courses
            Registration::Fetchers::AvailableCourses.new.call.sort_by(&:code)
          end

          def presented_courses
            Registration::Presenters::AvailableCourses.new.call
          end
        end
      end
    end
  end
end
