module TreeHelper

  def draw_heirarcy(path = "")
    raw(Dir[Rails.root.join(path).to_s + "/*"].sort.group_by{ |content| File.directory?(content) }.instance_eval{ |h| [h[true], h[false]] }.compact.flatten.map do |content|
      if File.directory?(content)
        simple_node Pathname.new(content).basename.to_s do
          draw_heirarcy content
        end
      else
        simple_node Pathname.new(content).basename.to_s
      end
    end.join)
  end

end
