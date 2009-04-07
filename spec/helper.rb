require 'rubygems'
require 'spec'

libdir = File.dirname(File.dirname(__FILE__)) + '/lib'
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include?(libdir)

require 'hello'

class String
  def blank?
    self == ""
  end
end

class File
  def self.hello_data(kind)
    File.new(File.join(Hello::DATA_PATH, kind))
  end
end

