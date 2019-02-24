require 'tsort'
require_relative 'lib/pluggaloid/version'

class Hash
  include TSort
  alias tsort_each_node each_key
  def tsort_each_child(node, &block)
    fetch(node).each(&block)
  end
end

MRuby::Gem::Specification.new('mruby-pluggaloid') do |spec|
  spec.license     = 'MIT'
  spec.authors     = ['Toshiaki Asai', 'shibafu528']
  spec.version     = Pluggaloid::VERSION
  spec.summary     = %q{Extensible plugin system}
  spec.description = %q{Pluggaloid is extensible plugin system for mikutter.}

  external_rb_require = %w[delayer instance_storage securerandom set]
  require_graph = external_rb_require.map {|item| [item, []] }.to_h
  Dir["#{__dir__}/lib/**/*.rb"].sort.each { |file|
    require_graph[file[/\A#{__dir__}\/lib\/(.*)\.rb\Z/, 1]] = File.readlines(file).grep(/^#require/) {|g| g.scan(/^#require ["'](.*)["']/) }.flatten
  }
  spec.rbfiles = (require_graph.tsort - external_rb_require).map { |file| File.expand_path("#{__dir__}/lib/#{file}.rb") }

  spec.add_dependency 'mruby-delayer', :github => 'shibafu528/mruby-delayer'
  spec.add_dependency 'mruby-instance-storage', :github => 'shibafu528/mruby-instance-storage'
  spec.add_dependency 'mruby-set', :github => 'yui-knk/mruby-set'
  spec.add_dependency 'mruby-method', :core => 'mruby-method'
  spec.add_dependency 'mruby-catch-throw', :github => 'IceDragon200/mruby-catch-throw'
  spec.add_dependency 'mruby-struct', :core => 'mruby-struct'
  spec.add_dependency 'mruby-secure-random', :github => 'monochromegane/mruby-secure-random'
end
