# Simple Tree

This project rocks and uses MIT-LICENSE.

It contains simple javascripts, stylesheets and helpers for rendering expandable trees.

## Installation

Write in your Gemfile:
```ruby
gem "simple_tree", github: "nirname/simple_tree"
```
Add this string to your `application.css`
```css
/*
  *= require simple_tree
*/
```
... and that one to your `application.js`
```js
//= require simple_tree/simple_tree
```

## Using

Now you can use the followin helpers inside your views:
* simple_tree
* simple_node

For example (using 'haml'):

```haml
= simple_tree do
  = simple_node "First node" do
    = simple_node "Sub-node"
  = simple_node "Second node"
```

... produces html code that will be similar to the one below:

```html
<ul class="simple-tree ">
  <li class="node expand-opened">
      ... First node ...
    <ul class="descendants">
      <li class="node expand-leaf">
          ... Sub-node ...
      </li>
    </ul>
  </li>
  <li class="node expand-leaf">
      ... Second node ...
  </li>
</ul>
```

You can pass `:opened` option to node:

```haml
= simple_tree do
  = simple_node "Opened node", opened: true do
    = simple_node "Leaf 1"
  = simple_node "Closed node" do
    = simple_node "Leaf 2"
```

By default node is supposed to be closed.


## Customizing

### HTML options

You are able to pass additional HTML options to your tree and its' nodes by passing them as a hash to your helper's calls:

```haml
= simple_tree class: "my_simple_tree" do
  = node "My node", "data-id" => 1
```

### Bootstrap

If you are using [`bootstrap`](https://github.com/twitter/bootstrap "Twitter Bootstrap on GitHub") (check your `Gemfile`):
```ruby
gem "twitter-bootstrap-rails"
```
... and want to see similar styled tree add this string to your `application.css`
```css
/*
*= require simple_tree_bootstrap
*/
```
... then add the `simple-tree-bootstrap` class as an option:
```haml
= simple_tree class: "simple-tree-bootstrap" do
```

#### Node buttons

You can add some buttons to nodes by passing html code to node content.
Use `.btn-tree` and `.btn-group-tree` classes with [`bootstrap`](https://github.com/twitter/bootstrap "Twitter Bootstrap on GitHub")
`.btn` and `.btn-group` classes to get pretty style inline buttons, fox example:
```haml
.btn.btn-tree
.btn-group.btn-group-tree
```
You can still combine it with different classes such as `.btn-primary` and so on.

## Interaction

It can be easily integrated with existing gems, such as sortable_tree, for example:

```haml
= simple_tree do
  = just_tree @your_tree, render_module: YourTreeHelper %>
```
... where YourTreeHelper module might looks like:

```ruby
module YourTreeHelper
  class Render
    class << self
      attr_accessor :h, :options
      def render_node(h, options)
        @h, @options = h, options
        node_content = options[:node].name)
        if options[:children].blank?
          h.simple_node(node_content) # draw leaf
        else
          h.simple_node(node_content) do # draw node
            h.raw options[:children]
          end
        end
      end
    end
  end
end
```
