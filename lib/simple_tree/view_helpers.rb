module SimpleTree

  module ViewHelpers

    def simple_tree(options = {}, &block)
      if block_given?
        block = capture &block
        "<ul class='simple-tree #{ options[:class] }'>
          #{ block }
        </ul>".html_safe
      else
        ""
      end
    end

    def simple_node(content, options = {}, &block)

      options = HashWithIndifferentAccess.new(options)

      if block_given?
        block_content = capture &block
        descendatns = "
        <ul class='descendants'>
          #{ block_content }
        </ul>"
        if (options[:opened] == true)
          css_expand_class = "expand-opened"
          css_icon_class = "icon-minus"
        else
          css_expand_class = "expand-closed"
          css_icon_class = "icon-plus"
        end
      else
        css_expand_class = "expand-leaf"
        css_icon_class = ""
      end

      "<li class='node #{ css_expand_class } #{ options[:class] }' #{ hash_to_html_options(options.except(:class)) }>
        <div class='node-action expand #{ css_icon_class }'></div>
        <div class='node-content'>
          #{ content }
        </div>
        #{ descendatns }
      </li>".html_safe
    end

    def hash_to_html_options(hash)
      hash.map{ |p, v| "#{p.to_s}=\"#{v.to_s}\"" }.join(" ")
    end

  end

end
