#!/usr/bin/env ruby

if __FILE__ == $0

  require 'optparse'

  options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: #{$0} [options]"

    opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
      options[:verbose] = v
    end
  end.parse!

  argv = ARGV.select{true}

end
