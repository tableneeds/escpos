require 'erb'

module Escpos
  class Report
    include ERB::Util
    include Helpers

    attr_reader :options

    def initialize(file_or_template, options = {}, trim_mode: nil)
      @options = options
      if file_or_template.is_a?(String) || file_or_template.is_a?(File)
        @template = ERB.new(file_or_template, trim_mode: trim_mode)
      else
        raise ArgumentError.new("Must pass instance of file or path as argument.")
      end
    end

    def render
      @template.result binding
    end
  end
end
