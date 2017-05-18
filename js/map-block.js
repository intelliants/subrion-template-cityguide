intelli.gm = function () {
    var styleIceGray = [{
        "featureType": "water",
        "elementType": "geometry",
        "stylers": [{"color": "#e9e9e9"}, {"lightness": 17}]
    }, {
        "featureType": "landscape",
        "elementType": "geometry",
        "stylers": [{"color": "#f5f5f5"}, {"lightness": 20}]
    }, {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [{"color": "#ffffff"}, {"lightness": 17}]
    }, {
        "featureType": "road.highway",
        "elementType": "geometry.stroke",
        "stylers": [{"color": "#ffffff"}, {"lightness": 29}, {"weight": 0.2}]
    }, {
        "featureType": "road.arterial",
        "elementType": "geometry",
        "stylers": [{"color": "#ffffff"}, {"lightness": 18}]
    }, {
        "featureType": "road.local",
        "elementType": "geometry",
        "stylers": [{"color": "#ffffff"}, {"lightness": 16}]
    }, {
        "featureType": "poi",
        "elementType": "geometry",
        "stylers": [{"color": "#f5f5f5"}, {"lightness": 21}]
    }, {
        "featureType": "poi.park",
        "elementType": "geometry",
        "stylers": [{"color": "#dedede"}, {"lightness": 21}]
    }, {
        "elementType": "labels.text.stroke",
        "stylers": [{"visibility": "on"}, {"color": "#ffffff"}, {"lightness": 16}]
    }, {
        "elementType": "labels.text.fill",
        "stylers": [{"saturation": 36}, {"color": "#333333"}, {"lightness": 40}]
    }, {"elementType": "labels.icon", "stylers": [{"visibility": "off"}]}, {
        "featureType": "transit",
        "elementType": "geometry",
        "stylers": [{"color": "#f2f2f2"}, {"lightness": 19}]
    }, {
        "featureType": "administrative",
        "elementType": "geometry.fill",
        "stylers": [{"color": "#fefefe"}, {"lightness": 20}]
    }, {
        "featureType": "administrative",
        "elementType": "geometry.stroke",
        "stylers": [{"color": "#fefefe"}, {"lightness": 17}, {"weight": 1.2}]
    }];
    var ultraLight = [{
        "featureType": "water",
        "elementType": "geometry",
        "stylers": [{"color": "#e9e9e9"}, {"lightness": 17}]
    }, {
        "featureType": "landscape",
        "elementType": "geometry",
        "stylers": [{"color": "#f5f5f5"}, {"lightness": 20}]
    }, {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [{"color": "#ffffff"}, {"lightness": 17}]
    }, {
        "featureType": "road.highway",
        "elementType": "geometry.stroke",
        "stylers": [{"color": "#ffffff"}, {"lightness": 29}, {"weight": 0.2}]
    }, {
        "featureType": "road.arterial",
        "elementType": "geometry",
        "stylers": [{"color": "#ffffff"}, {"lightness": 18}]
    }, {
        "featureType": "road.local",
        "elementType": "geometry",
        "stylers": [{"color": "#ffffff"}, {"lightness": 16}]
    }, {
        "featureType": "poi",
        "elementType": "geometry",
        "stylers": [{"color": "#f5f5f5"}, {"lightness": 21}]
    }, {
        "featureType": "poi.park",
        "elementType": "geometry",
        "stylers": [{"color": "#dedede"}, {"lightness": 21}]
    }, {
        "elementType": "labels.text.stroke",
        "stylers": [{"visibility": "on"}, {"color": "#ffffff"}, {"lightness": 16}]
    }, {
        "elementType": "labels.text.fill",
        "stylers": [{"saturation": 36}, {"color": "#333333"}, {"lightness": 40}]
    }, {"elementType": "labels.icon", "stylers": [{"visibility": "off"}]}, {
        "featureType": "transit",
        "elementType": "geometry",
        "stylers": [{"color": "#f2f2f2"}, {"lightness": 19}]
    }, {
        "featureType": "administrative",
        "elementType": "geometry.fill",
        "stylers": [{"color": "#fefefe"}, {"lightness": 20}]
    }, {
        "featureType": "administrative",
        "elementType": "geometry.stroke",
        "stylers": [{"color": "#fefefe"}, {"lightness": 17}, {"weight": 1.2}]
    }];

    var styleLight = [{
        "featureType": "administrative",
        "elementType": "labels.text.fill",
        "stylers": [{"color": "#444444"}]
    }, {"featureType": "landscape", "elementType": "all", "stylers": [{"color": "#f2f2f2"}]}, {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [{"visibility": "off"}]
    }, {
        "featureType": "road",
        "elementType": "all",
        "stylers": [{"saturation": -100}, {"lightness": 45}]
    }, {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [{"visibility": "simplified"}]
    }, {
        "featureType": "road.arterial",
        "elementType": "labels.icon",
        "stylers": [{"visibility": "off"}]
    }, {"featureType": "transit", "elementType": "all", "stylers": [{"visibility": "off"}]}, {
        "featureType": "water",
        "elementType": "all",
        "stylers": [{"color": "#aabcc4"}, {"visibility": "on"}]
    }];

    var paramsEl = document.getElementById('js-gm-data');
    var options = {
        zoom: 8,
        center: new google.maps.LatLng(0, 0),
        styles: styleLight
    };

    this.data = JSON.parse(paramsEl.innerHTML);

    if (1 == this.data.length) {
        options.mapTypeId = google.maps.MapTypeId.HYBRID
    }

    this.map = new google.maps.Map(document.getElementById('js-gm-canvas'), options);

    var self = this;

    var bounds = new google.maps.LatLngBounds();
    var i;

    for (i in this.data) {
        var entry = self.data[i];
        _addMarker(i, new google.maps.LatLng(entry.lat, entry.lng));
    }

    function _composeInfoWindowContent(entry) {
        return '<strong>' + entry.title + '</strong>';
    }

    function _mapCenterAndZoom(coords) {
        self.map.setCenter(coords);

        var maxZoomService = new google.maps.MaxZoomService();
        maxZoomService.getMaxZoomAtLatLng(coords, function (response) {
            if (google.maps.MaxZoomStatus.OK == response.status) {
                self.map.setZoom(response.zoom - 1);
            }
        });
    }

    function _addMarker(entryIdx, coords) {
        var entry = self.data[entryIdx];

        var options = {
            animation: google.maps.Animation.DROP,
            map: self.map,
            position: coords,
            title: entry.title,
            icon: intelli.config.ia_url + 'templates/cityguide/img/marker.png'
        };

        var marker = new google.maps.Marker(options);
        var infowindow = new google.maps.InfoWindow({content: _composeInfoWindowContent(entry)});

        google.maps.event.addListener(marker, 'click', function () {
            infowindow.open(self.map, marker);
        });

        bounds.extend(coords);

        if (entryIdx == (self.data.length - 1)) {
            (1 == self.data.length)
                ? _mapCenterAndZoom(coords)
                : self.map.fitBounds(bounds);
        }
    }

    return self;
};

google.maps.event.addDomListener(window, 'load', intelli.gm);