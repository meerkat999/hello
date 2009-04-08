class Hello
  DATA_PATH = File.join(File.dirname(__FILE__), "..", "data")

  def self.random(opts = {})
    if opts.key?(:gender)
      random_gender_hello(opts[:gender])
    elsif opts.key?(:time)
      random_time_hello(opts[:time])
    elsif opts.keys.any?
      invalid_option_feedback
    else
      random_agnostic_hello
    end
  end

  protected

  def self.method_missing(name, *args, &block)
    if name.to_s =~ /^random_(.*)_hello$/
      if args.any?
        data = args.first.to_s
      else
        data = $1
      end
      hellos = collect_hellos(data)
      hellos[rand(hellos.size)]
    else
      super
    end
  end

  def self.collect_hellos(kind)
    File.open(File.join(DATA_PATH, kind)) do |file|
      file.readlines.collect { |each| each.chomp }
    end
  end

  def self.invalid_option_feedback
    raise StandardError, "see the README for valid options"
  end
end
