[![Build
Status](https://secure.travis-ci.org/lex148/beautiful-css.png)](http://travis-ci.org/lex148/beautiful-css)
# Beautiful::Css

Beautiful Css is a gem to help clean up your css. It reorders your style to
remove duplication.

## Installation

Add this line to your application's Gemfile:

    gem 'beautiful-css'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install beautiful-css

## Usage

Beautiful Css can be used from the command line:

    beautifulcss style.css

Or directly from code:

    styles = 'a {color:red}'
    BeautifulCss::Engine.new(styles).render

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
