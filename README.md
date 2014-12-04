# Effective Style Guide

Ensure that your custom CSS theme looks good with all Twitter Bootstrap3 html components.

Creates a /styleguide page that renders the correct HTML for all bootstrap3 (v3.2.0) components.

Use this page to ensure that your custom CSS theme looks good with the bootstrap3 components.

Create a _my_component.html.erb partial in the /effective/style_guide/ directory to add your own custom components.

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

Visit /styleguide to test how the bootstrap3 components look with your site's design (css theme).


### Add Custom Components

Create a _my_component.html.erb partial in the app/views/effective/style_guide/ directory.

This file will be automatically detected and included in the /styleguide page.


### simple_form

simple_form (https://github.com/plataformatec/simple_form) is a pretty good FormBuilder gem.

At this time of writing, the latest simple_form v3.1.0.rc2 includes a bootstrap3 config/initializer that gets very close to generating the correct bootstrap3 form HTML (as per bootstrap's example page).

Very close, but not quite perfect.

It is also somewhat cumbersome to work with vertical, horizontal and inline forms from within the same app.

Due to these limitations, we have created our own custom config/initializer that does generate the correct bootstrap3 form HTML.

Here is the initializer:

```ruby
SimpleForm.setup do |config|
  config.error_notification_class = 'alert alert-danger'
  config.button_class = 'btn btn-primary'
  config.boolean_label_class = nil

  config.boolean_style = :nested
  config.browser_validations = true

  config.form_class = ''
  config.default_wrapper = :vertical_form

  config.wrapper_mappings = {
    :boolean => :vertical_boolean,
    :check_boxes => :vertical_radio_and_checkboxes,
    :radio_buttons => :vertical_radio_and_checkboxes,

    :horizontal_form => {
      :boolean => :horizontal_boolean,
      :check_boxes => :horizontal_radio_and_checkboxes,
      :radio_buttons => :horizontal_radio_and_checkboxes
    }
  }

  config.wrappers :vertical_form, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'control-label'

    b.use :input, class: 'form-control'
    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :vertical_file_input, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :readonly
    b.use :label, class: 'control-label'

    b.use :input
    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :vertical_boolean, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly

    b.wrapper tag: 'div', class: 'checkbox' do |ba|
      ba.use :label_input
    end

    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :vertical_radio_and_checkboxes, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly
    b.use :label_input, :class => 'control-label'
    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :vertical_inline_radio_and_checkboxes, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly

    b.use :label, class: 'control-label'

    b.wrapper tag: 'div', class: 'inline-radio-or-checkboxes' do |ba|
      ba.use :input
    end

    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :horizontal_form, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'col-sm-3 control-label'

    b.wrapper tag: 'div', class: 'col-sm-9' do |ba|
      ba.use :input, class: 'form-control'
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :horizontal_file_input, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :readonly
    b.use :label, class: 'col-sm-3 control-label'

    b.wrapper tag: 'div', class: 'col-sm-9' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :horizontal_boolean, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly

    b.wrapper tag: 'div', class: 'col-sm-offset-3 col-sm-9' do |wr|
      wr.wrapper tag: 'div', class: 'checkbox' do |ba|
        ba.use :label_input, class: 'col-sm-9'
      end

      wr.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      wr.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :horizontal_radio_and_checkboxes, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly

    b.use :label, class: 'col-sm-3 control-label'

    b.wrapper tag: 'div', class: 'col-sm-9' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :horizontal_inline_radio_and_checkboxes, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly

    b.use :label, class: 'col-sm-3 control-label'

    b.wrapper tag: 'div', class: 'col-sm-9' do |ba|
      ba.wrapper tag: 'div', :class => 'inline-radio-or-checkboxes' do |bb|
        bb.use :input
      end

      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :inline_form, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'sr-only'

    b.use :input, class: 'form-control'
    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

end
```

To create a bootstrap3 vertical_form:

```ruby
= simple_form_for(@post) do |f|
  # one or more inputs....
  = f.buttom :submit
```

To create a bootstrap3 horizontal_form:

```ruby
= simple_form_for(@post, :html => {:class => 'form-horizontal'}, :wrapper => :horizontal_form, :wrapper_mappings => SimpleForm.wrapper_mappings[:horizontal_form]) do |f|
  # one or more inputs....
  .form-group
    .col-sm-offset-3.col-sm-9= f.button :submit
```

To create a bootstrap3 inline_form:

```ruby
= simple_form_for(@post, :html => {:class => 'form-inline'}, :wrapper => :inline_form) do |f|
  # one or more inputs....
  = f.button :submit
```

In all 3 of the above examples, the proper wrappers will be used to generate the correct HTML for every type of form field.

This includes the frustrating booleans, radio and checkbox groups.

One gotcha, if you'd like to use the 'Inline checkboxes and radios' component, you will need to pass a wrapper to the f.input.

For a vertical_form or inline_form:

```ruby
= f.input :favorite_drink, :as => :check_boxes, :wrapper => :vertical_inline_radio_and_checkboxes, :collection => ['Water', 'Tea', 'Coffee', 'Soda']
```

For a horizontal_form:

```ruby
= f.input :favorite_drink, :as => :check_boxes, :wrapper => :horizontal_inline_radio_and_checkboxes, :collection => ['Water', 'Tea', 'Coffee', 'Soda']
```

And add the following CSS:

```css
form .inline-radio-or-checkboxes > span {
  display: inline-block;
  margin: 0px 10px 0px 0px;
}
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

## License

MIT License.  Copyright Code and Effect Inc. http://www.codeandeffect.com

You are not granted rights or licenses to the trademarks of Code and Effect


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


