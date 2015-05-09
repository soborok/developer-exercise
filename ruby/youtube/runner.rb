require_relative 'youtube_client'

client = YoutubeClient.new

puts "Welcome to commanline Youtube!"

loop do 
  print "Search: "

  search_term = gets.chomp

  break if search_term.downcase == 'q'

  client.execute_search(search_term)

  puts "### Video links for #{search_term} ###"
  puts client.display_results
  puts
end
