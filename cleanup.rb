# Chef recipe that deletes a file if it exists
#
file "#{ENV['HOME']}/hello.txt" do
	action :delete
end
