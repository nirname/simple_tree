$ ->
  $(document).on "click", ".simple-tree .expand", (element)->
    parent = $(this).parent()
    if parent.hasClass("expand-closed")
      parent.removeClass("expand-closed").addClass("expand-opened");
    else if (parent.hasClass("expand-opened"))
      parent.removeClass("expand-opened").addClass("expand-closed");

#$.fn.tree = function() {
#  $(this).find(".expand").click(function() {
#    var parent = $(this).parent();
#    if(parent.hasClass("expand-closed"))
#      parent.removeClass("expand-closed").addClass("expand-opened");
#    else if (parent.hasClass("expand-opened"))
#      parent.removeClass("expand-opened").addClass("expand-closed");
#  });
#}

#$.fn.expand_tree = function(mode) {
#  if(mode == undefined) mode = "toggle";
#  var opened_nodes = $(this).find(".expand-opened");
#  var closed_nodes = $(this).find(".expand-closed");
#  switch(mode) {
#    case "toggle":
#      opened_nodes.removeClass("expand-opened");
#      opened_nodes.addClass("expand-closed");
#      closed_nodes.removeClass("expand-closed");
#      opened_nodes.addClass("expand-opened");
#      break;
#    case "open":
#      closed_nodes.removeClass("expand-closed");
#      closed_nodes.addClass("expand-opened");
#      break;
#    case "close":
#      opened_nodes.removeClass("expand-opened");
#      opened_nodes.addClass("expand-closed");
#      break;
#  }
#}
