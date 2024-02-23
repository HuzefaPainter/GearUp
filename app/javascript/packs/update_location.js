doument.addEventListener('DOMContentLoaded', function() {
  var form = document.getElementById('update-location-form');
  var locationDropdown = form.querySelector('#user_location_id'); // Adjust the ID based on your actual HTML

  locationDropdown.addEventListener('change', function() {
    form.submit();
  });
});

