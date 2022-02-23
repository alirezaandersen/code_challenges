# We want to write a webcrawler that, given a URL A, finds all URLs reachable from A on the same host and protocol.
#
# So, if we find the following set of links:
#
#     https://crawl.opendoor.com/1 -> https://crawl.opendoor.com/2
#     https://crawl.opendoor.com/1 -> https://crawl.opendoor.com/3
#     https://crawl.opendoor.com/2 -> https://crawl.opendoor.com/4
#     https://crawl.opendoor.com/3 -> http://crawl.opendoor.com/5
#     https://crawl.opendoor.com/3 -> https://www.somewhere-else.com/6
#     http://crawl.opendoor.com/5 -> https://crawl.opendoor.com/7
#
# And an initial URL of: https://crawl.opendoor.com/1
#
# We expect to get back a list/set (we do not care about order) of:
#
#     [
#       "https://crawl.opendoor.com/1",
#       "https://crawl.opendoor.com/2",
#       "https://crawl.opendoor.com/3",
#       "https://crawl.opendoor.com/4"
#     ]
#
# We are not *given* the above set of links, we are initially given only one URL,
# and must fetch the URLs contents to discover the links it points to.
# We get 4 because we are recursing. We skip 5 because it is on the wrong protocol (
# http), and 6 because it is on the wrong host (www.somewhere-else.com). We do not see 7
# because we do not search pages with URLs that do not meet our criteria, so we do not scan 5 for links.
#
# Start your crawl at 1.html and you should get 1.html, 2.html, 3.html and 4.html in your return list

PAGES = {
  "https://crawl.opendoor.com/1" => ["https://crawl.opendoor.com/2"],
  "https://crawl.opendoor.com/2" => ["https://crawl.opendoor.com/4"],
  "https://crawl.opendoor.com/3" => ["http://crawl.opendoor.com/5", "https://www.somewhere-else.com/6"],
  "http://crawl.opendoor.com/5" => ["https://crawl.opendoor.com/7"]
}



def curl_url(url, parent_kepts: [])
  kept_pages = [url]
  pages = PAGES[url]
  return kept_pages if pages.nil?

  pages.map do |s|
    if s.include?('http:') || !s.include?('crawl.opendoor')
      next
    elsif parent_kepts.include?(s)
      break
    else
      kept_pages += curl_url(s, parent_kepts: kept_pages)
    end
  end

  kept_pages
end

puts curl_url('https://crawl.opendoor.com/1').inspect
