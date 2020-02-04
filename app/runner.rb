# frozen_string_literal: true

require_relative 'login_app/runner'

module App
  class Runner
    def initialize
      $running = true
    end

    def start
      run_login
    end

    private

    def run_login
      LoginApp::Runner.new.start
    end
  end
end
