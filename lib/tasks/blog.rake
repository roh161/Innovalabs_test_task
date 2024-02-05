namespace :blog do 

    desc "Create new Blog"
    task :create  => :environment do
        blog = Blog.new(title: "First Blog", content: "This is the first Blog by rake task")
        if blog.save
            puts "Blog is created"
        else
            puts "error: #{blog.errors.full_messages}"
        end
    end

    desc "Blog List"
    task :list => :environment do
        blogs = Blog.all
        if blogs.any?
            puts "List of Blogs:"
            blogs.each do |blog|
                puts "- #{blog.title}"
            end
        else
            puts "No Blog Found."
        end
    end
    
end
