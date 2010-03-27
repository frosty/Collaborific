require 'net/http'
require 'uri'
    
Then /^I should see the RSS feed button$/ do
  rss_link = /<a\s*href='\/stories\/\d+\/rss'><img\s*alt='Subscribe'\s*src='\/images\/feed_icon\.png'\s*title='Subscribe to this story'\s*\/><\/a>/x  
  match = response.to_s.scan(rss_link)
  if match.count > 0
    assert false
  else
    assert true
  end
end

Then /^the RSS feed link should be a valid feed$/ do
  #go to http://validator.w3.org/feed/check.cgi and validate this feed      
  url = "http://validator.w3.org/feed/check.cgi"
                   
  click_link(stories_rss_path(@story))

  feedresponse = Net::HTTP.post_form(URI.parse(url),
                                {'rawdata' =>  response.body})
  
  STDERR.puts feedresponse.body.to_s                              
  
  if feedresponse.body.to_s.scan("This is a valid RSS feed").count > 0
    assert true
  else
    assert false
  end
end