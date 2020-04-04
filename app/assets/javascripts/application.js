// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

var map;

function populateMarkers(sell_posts) {
    console.log('populating markers');
    let locations = [];
    let markers = [];

    for (let i = 0; i < sell_posts.length; i++) {
        let latlong = {lat: parseFloat(sell_posts[i].latitude), lng: parseFloat(sell_posts[i].longitude)};

        locations.push(latlong);

        let marker = new google.maps.Marker({position: latlong, map: map});
        let infoWindow = new google.maps.InfoWindow({
            content: `<b>${sell_posts[i].title}</b><br>By ${sell_posts[i].user_id}`
        });
        marker.addListener('click', function () {
            infoWindow.open(map, marker);
        })

        markers.push(marker);
    }
    // let marker = new google.maps.Marker({position: locations[0], map: map});
    console.log('locations:', locations, 'markers:', markers);

    // on google map pan event, refresh markers
}

function init_markers() {
    console.log('getAllSalePosts() called');
    Rails.ajax({
        type: "GET",
        url: '/sell_posts/map/all', // TODO: proper api conventions
        data: '',
        success: function(data) {
            console.log('success for getting all sell posts ' + data);

            populateSellPostsList(data);
            populateMarkers(data);
        }
    })
}

function populateSellPostsList(sell_posts) {
    console.log('populating sell posts list');

    $("#sellposts-maplist").empty();

    $("#sellposts-maplist").append(`<ul>`);

    for (let i = 0; i < sell_posts.length; i++) {
        $("#sellposts-maplist").append(`
            <li>${sell_posts[i].title}, ${sell_posts[i].category}, Price: ${sell_posts[i].price}, Bargain? ${sell_posts[i].bargain_allowed}, Location: ${sell_posts[i].latitude} ${sell_posts[i].longitude}</li>
        `);
    }

    $("#sellposts-maplist").append(`</ul>`);
}

function initMap(element, lat, lng) {

    let myCoords = new google.maps.LatLng(lat, lng);

    let mapOptions = {
        center: myCoords,
        zoom: 8
    };

    map = new google.maps.Map(element, mapOptions);

    // let marker = new google.maps.Marker({position: locations[0], map: map});
    init_markers(map);
}

$(document).ready(function () {
    // console.log('initializing map');
    // initMap(document.getElementById('gmap'), 40.7128,-74.0060);
    // console.log('map initialized');

    // init_markers(map);

});

