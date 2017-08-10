$(document).ready(function() {
$('.delete-portfolio').on('click', function(event) {
  $.ajax({
    type: "DELETE",
    url: '/portfolios/' + $(this).attr("id"),
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
  })
});
});
