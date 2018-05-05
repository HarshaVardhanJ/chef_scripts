#Chef recipe that creates a file and adds certain content to it

file 'hello.txt' do
	content "First Chef Recipe!"
end
