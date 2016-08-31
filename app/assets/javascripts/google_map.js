function loadScript()
{
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'http://maps.googleapis.com/maps/api/js?key=&sensor=false&callback=initialize';
  document.body.appendChild(script);
}

  function initialize() {
    var lat = document.getElementById('googleMap').getAttribute('data-lat');
    var long = document.getElementById('googleMap').getAttribute('data-long');
    var myCenter=new google.maps.LatLng(lat, long);
    var mapProp = {
      center:new google.maps.LatLng(lat, long),
      zoom:15,
      mapTypeId:google.maps.MapTypeId.ROADMAP
    };
    var map=new google.maps.Map(document.getElementById('googleMap'),mapProp);
    var marker=new google.maps.Marker({
      position:myCenter,
    });
    marker.setMap(map);
  }

  google.maps.event.addDomListener(window, 'load', initialize);
