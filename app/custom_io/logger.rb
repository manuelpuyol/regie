# frozen_string_literal: true

module App
  module CustomIO
    class Logger
      def print(str)
        puts str
      end

      def warn(str)
        puts "[WARNING] #{str}"
      end

      def error(str)
        puts "[ERROR] #{str}"
      end

      def get
        gets&.chomp
      end

      def get_cmd # rubocop:disable Naming/AccessorMethodName
        get&.downcase&.to_sym
      end
    end
  end
end
