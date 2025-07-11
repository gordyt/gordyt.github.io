+++
title = "Liquid Exception: undefined method sort"
author = ["Gordon Tillman"]
date = 2014-11-26
tags = ["org-mode"]
draft = false
+++

I was getting this strange error when I tried to generate my site via
the `rake generate` command:

```text
## Generating Site with Jekyll
identical source/stylesheets/screen.css
Configuration file: /Users/gordy/Documents/Personal/gordyt.github.io/_config.yml
            Source: source
       Destination: public
      Generating...
  Liquid Exception: undefined method `sort!' for nil:NilClass in _includes/post/categories.html, included in _layouts/post.html
jekyll 2.5.2 | Error:  undefined method `sort!' for nil:NilClass
```

<!--more-->

Did some search about and found [this website](http://uli-heller.github.io/blog/2013/08/04/octopress-category-generator/).  It is in German;
however the code sample was clear.  The fix was to edit the file
`plugins/category_generator.rb` as follows:

```ruby
def category_links(categories)
  if categories != nil     # Added this line
    categories = categories.sort!.map { |c| category_link c }

    case categories.length
    when 0
      ""
    when 1
      categories[0].to_s
    else
      "#{categories[0...-1].join(', ')}, #{categories[-1]}"
    end
  end                      # Added this line
end

```
