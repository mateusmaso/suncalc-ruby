require "suncalc/version"
require "pathname"
require "execjs"

module SunCalc
  def self.source
    "window = {}; #{File.read(Pathname(__FILE__).dirname.join('..', 'vendor', 'assets', 'javascripts', 'suncalc.js'))}"
  end

  def self.context
    ExecJS.compile(source)
  end

  def self.times(date, latitude, longitude)
    times = self.context.eval("window.SunCalc.getTimes(new Date(#{date.to_f * 1000}), #{latitude}, #{longitude})")

    times.keys.each do |key|
      old_key = key
      key = key.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr('-', '_').
      gsub(/\s/, '_').
      gsub(/__+/, '_').
      downcase.
      to_sym

      times[key] = times.delete(old_key)
    end

    times
  end
end
