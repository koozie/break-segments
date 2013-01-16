#!/usr/bin/env ruby 


require 'pp'
require 'time'

NodeSegment = Struct.new(:time_start, :time_end, :words)



if ARGV.size == 1 and File.readable?(ARGV.first)
  File.open(ARGV.first,'r') do |file|
    file.each do |line|
      rec = line.chomp.gsub(/</,' ').gsub(/>/, ' ').split
      rec.pop
      rec.shift
      rec[0] = rec[0].to_s.split('=').last.delete('"')
      rec[1] = rec[1].to_s.split('=').last.delete('"')
      time_start = Time.parse(rec.shift)
      time_end = Time.parse(rec.shift)
      words = rec
      time_diff = (time_end - time_start) / words.size
      times = []
      (words.size).times do |i|
        times << (time_start + time_diff * i).strftime("%H:%M:%S:%2N")
      end
      times << time_end.strftime("%H:%M:%S:%2N")
      words.each_with_index do |w,i|
        puts "<p begin=\"#{times[i]}\" end=\"#{times[i+1]}\">#{w.strip}</p>"
      end
    end
  end
else
  puts "Missing source filename...."
end

