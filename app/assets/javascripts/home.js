var when_page_is_ready = function() {

$(".notice").fadeOut(1000);
$(".alert").fadeOut(1000);


$(".course_check").hide();
  $(".location_check").change(function() {
    var location_id = $(this).attr("location_id")
      $(".location_" + location_id).show()
      
})
   $(".alert").addClass("in").fadeOut(4500);

/* swap open/close side menu icons */
$('[data-toggle=collapse]').click(function(){
    // toggle icon
    $(this).find("i").toggleClass("glyphicon-chevron-right glyphicon-chevron-down");
}) 

$(document.body).on("click", "a.change_workflow", function() {
    $.ajax({
      type: "PATCH",
      url: $(this).attr("submission_url"),
      dataType: "script"
    })
  });
        
}
$(document).ready(when_page_is_ready);
$(document).on("page:load", when_page_is_ready);