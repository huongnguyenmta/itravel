$(document).on('turbolinks:load', function() {
  $('#place-map').locationpicker({
    inputBinding: {
      latitudeInput: $('#place-lat'),
      longitudeInput: $('#place-long'),
      locationNameInput: $('#place-address')
    },
    enableAutocomplete: true
  });
});
