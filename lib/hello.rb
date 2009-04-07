class Hello
  DATA_PATH = File.join(File.dirname(__FILE__), "..", "data")

  def self.random
    agnostic[rand(agnostic.size)]
  end

  protected

  def self.agnostic
    collect_hellos("agnostic")
  end

  def self.collect_hellos(kind)
    File.open(File.join(DATA_PATH, kind)) do |file|
      file.readlines.collect { |each| each.chomp }
    end
  end
end
