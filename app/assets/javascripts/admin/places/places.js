$(document).on('turbolinks:load', function() {
  var lat = 21.0167326
  var long = 105.78417680000007
  lat = $('#place-lat').val() == '' ? lat : parseFloat($('#place-lat').val())
  long = $('#place-long').val() == '' ? long : parseFloat($('#place-long').val())
  $('#place-map').locationpicker({
    location: {latitude: lat, longitude: long},
    inputBinding: {
      latitudeInput: $('#place-lat'),
      longitudeInput: $('#place-long'),
      locationNameInput: $('#place-address')
    },
    enableAutocomplete: true
  });
});
