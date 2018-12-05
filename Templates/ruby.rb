#!/usr/bin/env ruby

RATIO = 0.001

if __FILE__ == $0

  require 'optparse'

  begin
    ARGV << '-h' if ARGV.empty?

    options = {
      ratio: RATIO
    }
    optionparser = OptionParser.new do |opts|
      opts.banner = "Usage: #{$0} [options]"

      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        options[:verbose] = v
      end
      opts.on("-r", "--ratio RATIO", Integer, "Set the ratio (#{RATIO} by default)") do |r|
        options[:ratio] = r
      end

      # opts.on_tail("-h", "--help", "Show this message") do
      #   puts opts
      #   exit
      # end
    end
    optionparser.parse!
  rescue  OptionParser::InvalidOption,
          OptionParser::MissingArgument,
          OptionParser::InvalidArgument => error
    puts error
    puts optionparser.help
    exit 2
  end

  argv = ARGV.select{true}

  if options[:verbose]
    p options
    p argv
  end

end
