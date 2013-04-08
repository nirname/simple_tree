$(function() {
  return $(document).on("click", ".simple-tree .expand", function(element) {
    var parent;
    parent = $(this).parent();
    if (parent.hasClass("expand-closed")) {
      return parent.removeClass("expand-closed").addClass("expand-opened");
    } else if (parent.hasClass("expand-opened")) {
      return parent.removeClass("expand-opened").addClass("expand-closed");
    }
  });
});
