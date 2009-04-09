module Hello
  KINDS = %w(male female morning afternoon evening inoffensive)
end

module Parser
  def self.parse(input)
    each_line(input) do |line|
      Hello::KINDS.each { |kind| append(line, kind) }
    end
  end

  def self.append(line, kind)
    File.open(kind, "a") do |file|
      file.write(line.hello) if line.send(:"#{kind}?")
    end
  end

  def self.each_line(input)
    IO.foreach(input) { |each| yield Line.new(each) }
  end
end

module Cleaner
  def self.clean
    Hello::KINDS.each { |each| system "rm #{each}" }
  end
end

class Line
  attr_accessor :hello, :about

  def initialize(input)
    @about = input[0..44]
    @hello = input[45..input.length].lstrip.rstrip << "\n"
  end

  Hello::KINDS.each do |kind|
    define_method(:"#{kind}?") do
      about.include? kind
    end
  end

  def inoffensive?
    Hello::KINDS.all? { |kind| ! about.include?(kind) }
  end
end

Cleaner.clean
Parser.parse "all"

