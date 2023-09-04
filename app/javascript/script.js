//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .


  $(document).ready(function() {
    $('#deleteButton').click(function(e) {
      e.preventDefault(); // Prevent the default form submission

      // Open the modal
      $('#deleteModal').modal('show');

      // Handle the deletion if the user confirms
      $('#deleteConfirmButton').click(function() {
        // Perform the delete action by submitting the form
        $('#deleteForm').submit();
      });
    });
  });
