def check_user_input
  abort("mkdir: missing input") if ARGV.empty?
end

def get_folder_name
  return ARGV.join('-')
end

def create_folder(name)
  Dir.mkdir(name)
end

def create_bundle
  system('bundle init')
  file = file.open('Gemfile','a')
  file.puts("ruby '2.7.1'")
  file.puts("gem 'rspec'")
  file.puts("gem 'pry'")
  file.puts("gem 'dotenv'")
  file.puts("gem 'rubocop'")
  file.close
  system('bundle install')
end
def init_rspec
  system('bundle exec rsprec --init')
end

def create_lib
  Dir.mkdir('lib')
end

def create_readme
  file = File.open('README.md','w')
  file.puts("# Project Ruby")
  file.close

end
def create_gitingore_ruby
  file = File.open('.gitinogre','w')
  file.puts("
    *.gem
    *.rbc
    /.config
    /coverage/
    /InstalledFiles
    /pkg/
    /spec/reports/
    /spec/examples.txt
    /test/tmp/
    /test/version_tmp/
    /tmp/
    
    # Used by dotenv library to load environment variables.
    # .env
    
    # Ignore Byebug command history file.
    .byebug_history
    
    ## Specific to RubyMotion:
    .dat*
    .repl_history
    build/
    *.bridgesupport
    build-iPhoneOS/
    build-iPhoneSimulator/
    
    ## Specific to RubyMotion (use of CocoaPods):
    #
    # We recommend against adding the Pods directory to your .gitignore. However
    # you should judge for yourself, the pros and cons are mentioned at:
    # https://guides.cocoapods.org/using/using-cocoapods.html#should-i-check-the-pods-directory-into-source-control
    #
    # vendor/Pods/
    
    ## Documentation cache and generated files:
    /.yardoc/
    /_yardoc/
    /doc/
    /rdoc/
    
    ## Environment normalization:
    /.bundle/
    /vendor/bundle
    /lib/bundler/man/
    
    # for a library or gem, you might want to ignore these files since the code is
    # intended to run in multiple environments; otherwise, check them in:
    # Gemfile.lock
    # .ruby-version
    # .ruby-gemset
    
    # unless supporting rvm < 1.11.0 or doing something fancy, ignore this:
    .rvmrc
    
    # Used by RuboCop. Remote config files pulled in from inherit_from directive.
    # .rubocop-https?--*
    © 20
    ")
    file.close
end

def perform
  check_user_input()
  create_folder(get_folder_name)
  create_bundle()
  init_rspec()
  create_readme()
  create_lib()

end
perform()

