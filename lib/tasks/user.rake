namespace :user do
  desc "Create a new user"
  task :create => :environment do
    user = User.new(email: "rohit.salitra07@gmail.com", password: "123456", password_confirmation: "123456")
    if user.save
      puts "User created successfully"
    end
  end

  desc "List all users"
  task :list => :environment do
    users = User.all
    if users.any?
      puts "List of Users: Total #{users.count} user"
      users.each do |user|
        puts "- #{user.email}"
      end
    else
      puts "No users found."
    end
  end

  desc "Delete all users"
  task :delete_all => :environment do
    User.destroy_all
    puts "All users deleted successfully"
  end
end
