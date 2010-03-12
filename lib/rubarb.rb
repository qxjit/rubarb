module Rubarb
  DefaultConfig = {:forall_amount => 100}

  @config_stack = [DefaultConfig]
  @generators = {}

  def self.with_config(config)
    @config_stack.push config
    yield
  ensure
    @config_stack.pop
  end

  def self.config
    @config_stack.last
  end

  def self.define(type, &generator)
    @generators[type] = generator
  end

  def self.generator(klass)
    @generators[klass]
  end
end

require 'rubarb/top_level_methods'
Dir[File.join(File.dirname(__FILE__), 'rubarb', 'generators', '*.rb')].each {|f| require f}
