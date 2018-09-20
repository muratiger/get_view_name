# GetViewName

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'get_view_name'
```

And then execute:

    $ bundle

## Usage

You can get the name of the view (not the action) to be rendered using the `view_name` method in the view context (which includes layout and parcial).

Controller: render index 
```ruby
  def index
    @samples = Sample.all
  end
```
View:
```ruby
<% @samples.each do |blog| %>
  render partial: 'sample', sample: sample
<% end %>

<%= view_name %>  => "index"
```
Parcial:
```ruby
<% @samples.each do |blog| %>
  render partial: 'sample', sample: sample
<% end %>

<%= view_name %>  => "index"
```

Layout:
```ruby
<html>
  <head>
    <title>Sample</title>
    <%= stylesheet_link_tag    'application' %>
    <%= javascript_include_tag 'application' %>
  </head>
  <body>
    <%= yield %>
  </body>
</html>

<%= view_name %>  => "index"
```
## Convenient usage

If you want new.html.erb to read css and javascript for new,

In the action_name method, create is returned when new is rendered with create action as shown below.

In such a case gem get_view_name can get the name of the rendered file, so it is possible to load assets to the view to be rendered.

Controller: render new
```ruby
  def create
    @sample = Sample.new(sample_params)

      if @sample.save # return false!
        redirect_to @sample
      else
        render :new
      end
  end
```

Layout:
```ruby
<html>
  <head>
    <%= stylesheet_link_tag    'application' %>
    <%= javascript_include_tag 'application' %>

    <% if view_name == 'new' %> # action_name method returns 'create'
      <%= stylesheet_link_tag 'new' %>
      <%= javascript_include_tag 'new' %>
    <% end %>
  </head>

  <body>
    <%= yield %>
  </body>
</html>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/get_view_name.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
