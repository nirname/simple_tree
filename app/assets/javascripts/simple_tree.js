$(function() {
  return $(document).on("click", ".simple-tree .expand", function(element) {
    var parent;

    parent = $(this).parent();
    if (parent.hasClass("expand-closed")) {
      parent.removeClass("expand-closed").addClass("expand-opened");
    } else if (parent.hasClass("expand-opened")) {
      parent.removeClass("expand-opened").addClass("expand-closed");
    }
    if ($(this).closest(".simple-tree").hasClass("simple-tree-bootstrap")) {
      if (parent.hasClass("expand-closed")) {
        return $(this).removeClass("icon-minus").addClass("icon-plus");
      } else if (parent.hasClass("expand-opened")) {
        return $(this).removeClass("icon-plus").addClass("icon-minus");
      }
    }
  });
});
