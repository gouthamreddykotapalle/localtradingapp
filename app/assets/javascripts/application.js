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

let locations = [
    // {lat: 40.7128, lng: -74.0060},
    // {lat: 44.971730, lng: -93.217200},
    // {lat:44.971217, lng:-93.214503},
    // {lat: 44.973251, lng: -93.216284},
    // {lat: 44.976029, lng: -93.224546}
];

function getAllSalePosts() {
    console.log('getAllSalePosts() called');
    Rails.ajax({
        type: "GET",
        url: '/sell_posts/map/all', // TODO: proper api conventions
        data: '',
        success: function(data) {
            // let sell_posts = [];
            //
            // for (let i = 0; i < data.length; i++) {
            //     sell_posts.push(JSON.parse(data[i]))
            // }

            console.log('success for getting all sell posts ' + data);

            Rails.$("#sellposts-maplist").html = data;
        }
    })
}

$(document).ready(function () {

    function initMap(element, lat, lng) {

        let myCoords = new google.maps.LatLng(lat, lng);

        let mapOptions = {
            center: myCoords,
            zoom: 8
        };

        let map = new google.maps.Map(element, mapOptions);

        // generate markers here



        let marker = new google.maps.Marker({position: locations[0], map: map});

    }

    console.log('initializing map');
    initMap(document.getElementById('gmap'), 40.7128,-74.0060);
    console.log('map initialized');

    getAllSalePosts();
});
//
// $(document).ready(function() {
//     initMap(0, 0);
// });
