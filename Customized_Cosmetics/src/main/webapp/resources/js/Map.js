// The following example creates five accessible and
// focusable markers.
function initMap() {
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 17,
    center: { lat: 37.4989465, lng: 127.0281631 },
  });
  // Set LatLng and title text for the markers. The first marker (Boynton Pass)
  // receives the initial focus when tab is pressed. Use arrow keys to
  // move between markers; press tab again to cycle through the map controls.
  const tourStops = [
    [{ lat: 37.4989465, lng: 127.0281631 }, "KIC캠퍼스"],
  ];
  // Create an info window to share between markers.
  const infoWindow = new google.maps.InfoWindow();

  // Create the markers.
  tourStops.forEach(([position, title]) => {
    const marker = new google.maps.Marker({
      position,
      map,
      title: `${title}`,
      optimized: false,
    });

    // Add a click listener for each marker, and set up the info window.
    marker.addListener("click", () => {
		map.setZoom(20);
    	map.setCenter(marker.getPosition());
      infoWindow.close();
      infoWindow.setContent(marker.getTitle());
      infoWindow.open(marker.getMap(), marker);
    });
  });
}

window.initMap = initMap;