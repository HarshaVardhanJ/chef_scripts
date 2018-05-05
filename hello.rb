#Chef recipe that creates a file in the home folder of the user and adds certain content to it

file "#{ENV['HOME']}/hello.txt" do
	content "First Chef Recipe!"
end
