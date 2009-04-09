class Hello
  DATA_PATH = File.join(File.dirname(__FILE__), "..", "data")

  def self.random(opts = {})
    invalid_option_feedback unless valid_options?(opts)
    hellos = collect_hellos("inoffensive")
    hellos |= collect_hellos("male")      if male?(opts)
    hellos |= collect_hellos("female")    if female?(opts)
    hellos |= collect_hellos("morning")   if morning?(opts)
    hellos |= collect_hellos("afternoon") if afternoon?(opts)
    hellos |= collect_hellos("evening")   if evening?(opts)
    hellos[rand(hellos.size)]
  end

  protected

  def self.collect_hellos(kind)
    File.open(File.join(DATA_PATH, kind)) do |file|
      file.readlines.collect { |each| each.chomp }
    end
  end

  def self.male?(opts)
    opts.key?(:gender) && opts[:gender] == :male
  end

  def self.female?(opts)
    opts.key?(:gender) && opts[:gender] == :female
  end

  def self.morning?(opts)
    opts.key?(:time) && opts[:time] == :morning
  end

  def self.afternoon?(opts)
    opts.key?(:time) && opts[:time] == :afternoon
  end

  def self.evening?(opts)
    opts.key?(:time) && opts[:time] == :evening
  end

  def self.invalid_option_feedback
    raise StandardError, "see the README for valid options"
  end

  def self.valid_options?(opts)
    opts.keys.empty? ||
      male?(opts) || female?(opts) ||
      morning?(opts) || afternoon?(opts) || evening?(opts)
  end
end
