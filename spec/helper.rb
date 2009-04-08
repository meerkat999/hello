require 'rubygems'
require 'spec'

$: << File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))

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

  def &(other)
    self.collect & other.collect
  end
end

