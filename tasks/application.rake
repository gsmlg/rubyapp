desc 'Run the app'
task :s do
  system "rackup -p 10086"
end
