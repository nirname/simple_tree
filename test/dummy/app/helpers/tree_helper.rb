module TreeHelper

  def draw_heirarcy(path = "")
    raw(Dir[Rails.root.join(path).to_s + "/*"].sort.group_by{ |content| File.directory?(content) }.instance_eval{ |h| [h[true], h[false]] }.compact.flatten.map do |content|
      name = Pathname.new(content).basename.to_s

      title = link_to(name, "#") +
        content_tag(:div, class: "btn btn-tree") do
          content_tag(:i, nil, class: "icon-list")
        end +
        content_tag(:div, class: "btn btn-tree") do
          content_tag(:i, nil, class: "icon-th")
        end
      if File.directory?(content)
        simple_node title do
          draw_heirarcy content
        end
      else
        simple_node title
      end
    end.join)
  end

end
