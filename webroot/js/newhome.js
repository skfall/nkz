var reinit_home = {
    all: () => {

    },
    owl: (selector, params) => {
        var selector = selector || false;
        var params = params || {};
        if(!selector) return false;
        selector.owlCarousel(params);
    },
    fancy: (selector, params) => {
        var selector = selector || false;
        var params = params || {};
        if(!selector) return false;
        selector.fancybox(params);
    },
    home_map: () => {
        var lat = parseFloat($('#hs_map').data('lat')) || 0;
        var lng = parseFloat($('#hs_map').data('lng')) || 0;

        var map = new google.maps.Map($('#hs_map')[0], {
            zoom: 16,
            center: {lat:lat, lng:lng}
        });
        var marker = new google.maps.Marker({
            position: {lat:lat, lng:lng},
            map: map
        });
    },
};


var home = {
    start: () => {
        $('body').imagesLoaded(() => {
            reinit_home.owl($('.home_slider_owl'), {items: 1});
            reinit_home.owl($('.home_mob_owl_grid'), {items: 1, autoHeight: true});
        });

        setTimeout(function(){
            if (typeof(google) !== "undefined") {
                reinit_home.home_map();
            }
        }, 20);

        $('.new_map_trigger').click(function(){
            var lat = $(this).data('lat');
            var lng = $(this).data('lng');
            var from = $(this).data('from');
            var offset = $(this).offset().top;
            home.new_modal_map(lat, lng, offset + 25, from);
        });
        
    },
    new_modal_map: (lat, lng, offset, from) => {
        var from = from || "";
			var lat = lat || 0;
			var lng = lng || 0;
			var offset = offset || 0;
			var map = new google.maps.Map($('.map_hold').find('.map_target')[0], {
	          zoom: 16,
	          center: {lat:lat, lng:lng}
	        });
	        var marker = new google.maps.Marker({
				position: {lat:lat, lng:lng},
				map: map
	        });
	        $('.map_hold').css({
	        	//top: offset + "px"
	        	top: $(window).scrollTop()
	        });

	        if (from) {


                var from_lat = parseFloat($('[data-from="'+from+'"]').data('nlat'));
                var from_lng = parseFloat($('[data-from="'+from+'"]').data('nlng'));


                var start_point = {lat: from_lat, lng: from_lng};

		        home.set_map_route(map, start_point, {lat: lat, lng: lng});

	        }
	        
	        $('.map_overlay').show(0);
    },
    set_map_route: function(map, start, finish){
        if (map && start && finish) {

            var dirrectionsDisp =  new google.maps.DirectionsRenderer();
            var dirrections = new google.maps.DirectionsService;

            var start_point = start;
            var final_point = finish;
            dirrectionsDisp.setMap(map);
            dirrectionsDisp.setOptions( { suppressMarkers: false } );
            dirrections.route({
              origin: start_point,
              destination: final_point,
              travelMode: 'DRIVING'
            }, function(response, status) {
              if (status === 'OK') {
                dirrectionsDisp.setDirections(response);
              }
            });

  
        }
    },
    handle_slider_section: (self) => {
        $('.home_tab_body_item').removeClass('active');
        $('.home_tab_nav_item').removeClass('active');

        var target = $('.' + $(self).data('target'));
        $(self).addClass("active");
        $(target).addClass("active");
    },
};

(function($){
    home.start();
})(jQuery);
