task :default => [:all_tasks]

task :one do
  ruby "page1.rb"
  Rake::Task["display"].execute
end

task :two do
  ruby "page2.rb"
  Rake::Task["display"].execute
end

task :three do
  ruby "page3.rb"
  Rake::Task["display"].execute
end

task :four do
  ruby "page4.rb"
  Rake::Task["display"].execute
end

task :five do
  ruby "page5.rb"
  Rake::Task["display"].execute
end

task :six do
  ruby "page6.rb"
  Rake::Task["display"].execute
end

task :seven do
  ruby "page7.rb"
  Rake::Task["display"].execute
end

task :eight do
  ruby "page8.rb"
  Rake::Task["display"].execute
end

task :nine do
  ruby "page9.rb"
  Rake::Task["display"].execute
end

task :display do
  `open -a Preview page.pdf`
end

task :all_tasks do
  ruby "resume.rb"
end
