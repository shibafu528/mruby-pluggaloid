MRuby::Gem::Specification.new('mruby-pluggaloid') do |spec|
  spec.license     = 'MIT'
  spec.authors     = ['Toshiaki Asai', 'shibafu528']
  spec.version     = '1.1.1'
  spec.summary     = %q{Extensible plugin system}
  spec.description = %q{Pluggaloid is extensible plugin system for mikutter.}
  
  spec.add_dependency 'mruby-delayer', :github => 'shibafu528/mruby-delayer'
  spec.add_dependency 'mruby-instance-storage', :github => 'shibafu528/mruby-instance-storage'
  spec.add_dependency 'mruby-set', :github => 'yui-knk/mruby-set'
  spec.add_dependency 'mruby-method', :core => 'mruby-method'
  spec.add_dependency 'mruby-catch-throw', :github => 'IceDragon200/mruby-catch-throw'
  spec.add_dependency 'mruby-struct', :core => 'mruby-struct'
end
