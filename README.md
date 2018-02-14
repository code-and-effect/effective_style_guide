# Effective Style Guide

Ensure that your custom CSS theme looks good with all Twitter Bootstrap html components.

Creates a `/styleguide` page that renders the correct HTML for all bootstrap4 (v4.0.0) components.

Creates a `/styleguide/bootstrap3` page that renders the correct HTML for all bootstrap3 (v3.2.0) components.

Use this page to ensure that your custom CSS theme looks good with the bootstrap components.

Create a `_my_component.html.erb` partial in the `views/effective/style_guide/` or `views/effective/style_guide_bootstrap3/` directory to add your own custom components.

Works with simple_form to ensure that the generated form HTML matches the bootstrap3 HTML.


## Getting Started

Add to your Gemfile:

```ruby
gem 'effective_style_guide'
```

Run the bundle command to install it:

```console
bundle install
```

Then run the generator:

```ruby
rails generate effective_style_guide:install
```

The generator will install an initializer which describes all configuration options.

You must include the Twitter Bootstrap3 Javascript and CSS assets on your own.  They are not included with this gem.

## Usage

Visit `/styleguide` to test how the bootstrap4 components look with your site's design (css theme).

Visit `/styleguide/bootstrap3` to test how the bootstrap3 components look with your site's design (css theme).


### Add Custom Components

Create a `_my_component.html.erb` partial in the `views/effective/style_guide/` or `views/effective/style_guide_bootstrap3/` directory.

This file will be automatically detected and included in the `/styleguide` page.

### effective_bootstrap

Checkout effective_bootstrap (https://github.com/code-and-effect/effective_bootstrap) for an effective bootstrap4 experience.

### simple_form

simple_form (https://github.com/plataformatec/simple_form) is a pretty good FormBuilder gem.

At this time of writing, the latest simple_form v3.2.1 includes a bootstrap3 config/initializer that generates correct bootstrap3 form HTML (as per bootstrap's example page).

It does a great job with vertical and inline forms, but needs a little bit of help with the horizontal forms.

Add the following snippet to the bottom of the `config/initializers/simple_form_bootstrap.rb` file:

```ruby
### Custom as per Effective Style Guide ###
config.browser_validations = true

config.wrapper_mappings[:horizontal_form] = {
  check_boxes: :horizontal_radio_and_checkboxes,
  radio_buttons: :horizontal_radio_and_checkboxes,
  file: :horizontal_file_input,
  boolean: :horizontal_boolean,
  datetime: :horizontal_radio_and_checkboxes,
  date: :horizontal_radio_and_checkboxes,
  time: :horizontal_radio_and_checkboxes
}
```

To create a bootstrap3 vertical_form:

```ruby
= simple_form_for(@post) do |f|
  # one or more inputs....
  = f.buttom :submit
```

To create a bootstrap3 horizontal_form:

```ruby
= simple_form_for(@post, html: {class: 'form-horizontal'}, wrapper: :horizontal_form, wrapper_mappings: SimpleForm.wrapper_mappings[:horizontal_form]) do |f|
  # one or more inputs....
  .form-group
    .col-sm-offset-3.col-sm-9= f.button :submit
```

To create a bootstrap3 inline_form:

```ruby
= simple_form_for(@post, html: {class: 'form-inline'}, wrapper: :inline_form) do |f|
  # one or more inputs....
  = f.button :submit
```

## Authorization

All authorization checks are handled via the config.authorization_method found in the config/initializers/ file.

It is intended for flow through to CanCan or Pundit, but that is not required.

This method is called by all controller actions with the appropriate action and resource

Action will be `:show` and the resource `Effective::StyleGuide.new()`

The authorization method is defined in the initializer file:

```ruby
# As a Proc (with CanCan)
config.authorization_method = Proc.new { |controller, action, resource| authorize!(action, resource) }
```

```ruby
# As a Custom Method
config.authorization_method = :my_authorization_method
```

and then in your application_controller.rb:

```ruby
def my_authorization_method(action, resource)
  current_user.is?(:admin) || EffectivePunditPolicy.new(current_user, resource).send('#{action}?')
end
```

or disabled entirely:

```ruby
config.authorization_method = false
```

If the method or proc returns false (user is not authorized) an Effective::AccessDenied exception will be raised

You can rescue from this exception by adding the following to your application_controller.rb:

```ruby
rescue_from Effective::AccessDenied do |exception|
  respond_to do |format|
    format.html { render 'static_pages/access_denied', :status => 403 }
    format.any { render :text => 'Access Denied', :status => 403 }
  end
end
```

### Permissions

The permissions you actually want to define are as follows (using CanCan):

```ruby
if user.is?(:admin)
  can :show, Effective::StyleGuide
end
```

## License

MIT License.  Copyright [Code and Effect Inc.](http://www.codeandeffect.com/)

## Testing

The test suite for this gem is unfortunately not yet complete.

Run tests by:

```ruby
rake spec
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Bonus points for test coverage
6. Create new Pull Request

