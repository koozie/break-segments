#!/usr/bin/env ruby 


require 'pp'
require 'time'

NodeSegment = Struct.new(:time_start, :time_end, :words)


def parse_line(line)
  # clean up line: sample:  <p begin="00:00:00.00" end="00:00:04.12">From now on I will start work earlier.</p>
  rec = line.chomp.gsub(/</,' ').gsub(/>/, ' ').split
  rec.pop
  rec.shift

  #clean up begin and end times
  rec[0] = rec[0].to_s.split('=').last.delete('"')
  rec[1] = rec[1].to_s.split('=').last.delete('"')

  time_start = Time.parse(rec.shift)
  time_end = Time.parse(rec.shift)
  words = rec

  return NodeSegment.new(time_start, time_end, words)
end

def time_periods(segment)
  seg = segment
  time_diff = (seg.time_end - seg.time_start) / seg.words.size
  times = []
  (seg.words.size).times do |i|
    times << (seg.time_start + time_diff * i).strftime("%H:%M:%S:%2N")
  end
  times << seg.time_end.strftime("%H:%M:%S:%2N")

  return times
end

def main
  if ARGV.size == 1 and File.readable?(ARGV.first)
    File.open(ARGV.first,'r') do |file|
      file.each do |line|
        seg = parse_line(line)
        times = time_periods(seg) 
        seg.words.each_with_index do |w,i|
          puts "<p begin=\"#{times[i]}\" end=\"#{times[i+1]}\">#{w.strip}</p>"
        end
      end
    end
  else
    puts "Missing source filename...."
  end
end



main

