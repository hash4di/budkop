class AddInitialTags < ActiveRecord::Migration
 
  TAGS = [ "Ruby", "Rails", "Mac", "iPhone", "HTML5", "Web2.0", "CSS3", "Rspec", "Cucumber", "Capybara", "Haml", "Sass", "jQuery", "jQTouch", "FactoryGirl", "BDD", "GTD", "GettingReal", "SDK", "GitHub", "Heroku", "WebApplications", "PostgreSQL", "MySQL", "Sphinx", "Searchlogic", "Authlogic", "MacVIM" ,"VIM", "TextMate", "Bash", "Unix", "Linux", "Gentoo", "Linchpin", "Rework", "The Pomodoro Technique", "Mac OSX", "AppleScript", "Fluid", "Things", "Self-Development", "Lifehack" ]

  

  def self.up
    TAGS.each do |tag|
      Tag.create(:name => tag)
    end
  end

  def self.down
    Tag.destroy_all
  end

end
