require 'pry'
# 1. Devide current path into schema, authority and path
# 2. For the given link, we want to use a regrex to parse to see what the params is
# 3. if the params starts with '/', then it's the ABSOLUTE PATH case
# 4. if the params starts with '..', then it's the RELATIVE PATH case #1, #2
# 5. if the params starts with any known scheme, it is the BASE PATH case.
# 6. the case remains is the RELATIVE PATH CASE #3

def convert_link(url, link)
  url.match /([a-z]+.)(\/\/[^\/]+)/
  schema = $1
  authority = $2
  path = url.gsub schema+authority, ''
  path = path.gsub(/[a-z]{1}\.html/, '')

  # puts "schema, #{schema}"
  # puts "authority, #{authority}"
  # puts "path, #{path}"

  case link
  when /^(\/{1})/
    schema + authority + link
  when /^(\.{2})/
    result = link.split('/').inject(path) do |memo, element|
      # if element is .., we want to remove one level of the current path
      if element == '..'
        memo.split('/')[0..-2].join('/')
      else
      # if the element is not .., we want to add it to the schema
        memo += ('/' + element)
      end
    end
    schema + authority + result
  when /^([a-z]+:)/
    link
  else
    schema + authority + path + link
  end
end

puts convert_link('https://a.com/b/c/d.html', 'http://b.com/e/f/g.html')
puts convert_link('https://a.com/b/c/d.html', '/e/f/g.html')
puts convert_link('https://a.com/b/c/d.html', 'e/f/g.html')
puts convert_link('https://a.com/b/c/d.html', '../../e/f/g.html')
puts convert_link('https://a.com/b/c/d.html', '../../e/f/../g.html')


# 
# Your previous Plain Text content is preserved below:
# 
# 
# Case 1:
# CURRENT: https://a.com/b/c/d.html
# LINK:    http://b.com/e/f/g.html
# RESULT:  http://b.com/e/f/g.html
# 
# ABSOLUTE PATH
# CURRENT: https://a.com/b/c/d.html
# LINK:    /e/f/g.html
# RESULT:  https://a.com/e/f/g.html
# 
# RELATIVE PATH
# CURRENT: https://a.com/b/c/d.html
# LINK:    e/f/g.html
# RESULT:  https://a.com/b/c/e/f/g.html
# 
# RELATIVE PATH #2
# CURRENT: https://a.com/b/c/d.html
# LINK:    ../../e/f/g.html
# RESULT:  https://a.com/e/f/g.html
# 
# RELATIVE PATH #3
# CURRENT: https://a.com/b/c/d.html
# LINK:    ../../e/f/../g.html
# RESULT:  https://a.com/e/g.html
# 
# SCHEME
# a-z characters followed by a ':'
# http:  https:   ftp:   gopher:
# 
# AUTHORITY
# '//' followed by non-'/' characters
# //cash.me
# //localhost
# //127.0.0.1:8080
# 
# PATH
# /wikipedia
# /e/f/g.html
# ../../a/b/c