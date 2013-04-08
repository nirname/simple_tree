module SimpleTreeHelper

  module ViewHelper

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

      if block_given?
        block_content = capture &block
        descendatns = "
        <ul class='descendants'>
          #{ block_content }
        </ul>"
        css_expand_class = "expand-closed"
      else
        css_expand_class = "expand-leaf"
      end

      "<li class='node #{ css_expand_class } #{ options[:class] }' #{ hash_to_html_options(options.except(:class)) }>
        <div class='node-action expand'></div>
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
