(function($){
	"use strict";

	var storage = {
		w: $(window),
		d: $(document),
		b: $('body'),
		ww: $(window).width(),
		wh: $(window).height(),
		drop_menu: $('.drop_menu'),
		dark_overlay: $('.dark_overlay'),
		open_drop_down_btn: $('.open_drop_down'),
		close_drop_down_btn: $('.close_drop_down'),
		home_map_selector: $('#home_gmap'),
		home_tabs_nav: $('.home_tabs_nav'),
		home_top_tabs: $('.home_top_tabs .scene'),
		home_mobile_sect_h: $('.mobile_toogle_h'),
		home_mobile_sect_c: $('.home_toggle_c'),
		home_infra_tabs_nav: $('.infra_tabs .tab_item'),
		home_infra_tabs_cont: $('.infra_content_blocks .infra_c_item'),
		home_env_tabs_nav: $('.env_nav li'),
		home_env_tabs_cont: $('.home_environment_toggle_c .env_c'),
		go_up_btn: $('#go_up'),
		house_link_tooltip: $('.layouts_area .tooltip_mark'),
		layouts_placement_gmaps: $('.layouts_placement .maps .item'),
		layouts_placement_nav: $('.layouts_placement .nav li'),
		layouts_placement_cont: $('.layouts_placement .maps .item'),
		layouts_features_nav: $('.layout_item .features p a'),
		layouts_features_cont: $('.layout_item .features_tab'),
		layouts_box_header: $('.l_mobile_header'),
		layouts_box: $('.mob_l_box'),
		about_tab_nav: $('.about_projects .tabs_nav .tab'),
		about_tab_cont: $('.about_projects .tabs_cont .item'),
		about_tab_m: $('.about_projects .about_tab_m .tab_h'),
		th_gallery_owl: $('.th_gallery .owl-carousel'),
		map_trigger: $('.map_trigger'),
		map_modal: $('.map_hold')
	}

	var helper = {
		get_window_size: function(){
			var x = $(window).width();
			var y = $(width).height(); 
			return {w: x, h: y}
		}
	}

	var events = {
		resize: function(el, cb){
			$(el).on('resize', function(){
				cb();
			});
		},
		scroll: function(el, cb){
			$(el).on('scroll', function(){
				cb();
			});
		},
	}

	var network = {
		post: function(path, params, cb, type){
			var type = type || "html";
			$.post(path, params, function(data, status){
				if (status == "success") {
					cb(data);
				}
			}, type);
		},
		get: function(path, params, cb, type){
			var type = type || "html";
			$.get(path, params, function(data, status){
				if (status == "success") {
					cb(data);
				}
			}, type);
		},
		appointment: function(){
			var post_data = $('#visit_form').serialize();
			network.post(RS+"ajax/", post_data, function(data){

				if (data.status != 'success') {
					$('#visit_form').find('[name="'+data.reason+'"]').addClass('wrong');
					$('#visit_form').find('[name="'+data.reason+'"]').focus();
				}else{
					dataLayer.push({'event': 'prosmotr'});
					$('#visit_form')[0].reset();
					$('#visit_form p.response').addClass('green').text(data.message)
					setTimeout(function(){
						$('#visit_modal').modal('hide');
						$('#visit_form p.response').removeClass('green').text("");
					}, 2000);
				}
				$('#visit_form input').bind('input', function(){
					$('#visit_form input').removeClass('wrong');
					$('#visit_form p.response').text("");
				});
				$('#visit_form p.response').text(data.message);

			}, "json");
		},
		contact_form: function(){
			var post_data = {
				name: $('#contacts_form input[name="name"]').val(),
				phone: $('#contacts_form input[name="phone"]').val(),
				email: $('#contacts_form input[name="email"]').val(),
				message: $('#contacts_form textarea[name="message"]').val(),
				action: $('#contacts_form input[name="action"]').val()
			}

			network.post(RS+"ajax/", post_data, function(data){

				if (data.status != 'success') {
					$('#contacts_form').find('[name="'+data.reason+'"]').addClass('wrong');
					$('#contacts_form').find('[name="'+data.reason+'"]').focus();
				}else{
					$('#contacts_form')[0].reset();
					$('.contact_form .success_div').find('.name_rw span').text(data.name);

					$('.contact_form .success_div').removeClass('dn');
				}
				$('#contacts_form input').bind('input', function(){
					$('#contacts_form input').removeClass('wrong');
					$('#contacts_form p.response').text("");
				});
				$('#contacts_form p.response').text(data.message);

			}, "json");
		},
		recall: function(){
			var post_data = $('#recall_form').serialize();
			network.post(RS + 'ajax/', post_data, function(data){
				if (data.status != 'success') {
					$('#recall_form').find('[name="'+data.reason+'"]').addClass('wrong');
					$('#recall_form').find('[name="'+data.reason+'"]').focus();
				}else{
					dataLayer.push({'event': 'callback'});
					$('#recall_form')[0].reset();
					$('#recall_form input').removeClass('wrong');
				}
				$('#recall_form input').bind('input', function(){
					$('#recall_form input').removeClass('wrong');
					$('#recall_form p.response').text("");
				});
				$('#recall_form p.response').text(data.message);
			}, 'json');
		},
		show_th_layouts: function(self, block_id, floor_id, from_floor){
			var from_floor = from_floor || "";
			var block_id = block_id || 0;
			var floor_id = floor_id || 1;
			if (!from_floor) {
				var btn = $(self);
				btn.addClass('loading');

				if (block_id) {
					network.post(RS + "ajax/", {action: "getThLayouts", block_id: block_id, floor_id: floor_id}, function(data){
						if (data) {
							var layouts = $('#th_layouts_target');
							data = JSON.parse(data);
							layouts.html(data);
							nkz.launch_event_timers();
							reinit.owl_layouts_double();
							
							var block = btn.closest('.th_block');
							setTimeout(function(){
								if (block.hasClass('opened')) {
									$('.floors_select').hide(0);							
									btn.removeClass('active').find('span').text("Показать планировки");
									block.removeClass('opened');
									layouts.slideUp(500);
									setTimeout(function(){
										layouts.html("");
										$('.floors_select').hide(0);
										btn.removeClass('loading');
									}, 500);
								}else{
									btn.removeClass('loading');
									btn.addClass('active').find('span').text("Скрыть планировки");
									block.addClass('opened');
									layouts.slideDown(300);
									setTimeout(function(){
										$('.floors_select').fadeIn(500);
										$('html, body').animate({
											scrollTop: $('.floors_select').offset().top - 30
										}, 1000);
									}, 500);
								}
							}, 100);
						}else{
							var layouts = $('#th_layouts_target');
							layouts.html("<p>В данный раздел - пуст.</p>");
						}
					}, "html");
				}
			}else{
				if (block_id) {
					network.post(RS + "ajax/", {action: "getThLayouts", block_id: block_id, floor_id: floor_id}, function(data){
						if (data) {
							var layouts = $('#th_layouts_target');
							data = JSON.parse(data);
							layouts.html(data);
							nkz.launch_event_timers();
							reinit.owl_layouts_double();
							$('#th_layouts_target').removeClass('loading');							
						}else{
							var layouts = $('#th_layouts_target');
							layouts.html("<p>В данный раздел - пуст.</p>");
						}
					}, "html");
				}
			}
		},
		load_th_block: function(block_name){
			var target = $('.blocks_holder');
			$('button[data-target="' + block_name + '"]').addClass('loading');
			target.addClass('loading');
			network.post(RS + 'ajax/', {action: "getThBlock", block_name: block_name}, function(data){
				if (data) {
					data = JSON.parse(data);
					target.html(data);

					$('button[data-target="' + block_name + '"]').removeClass('loading');
					target.removeClass('loading');
					$('html, body').animate({
						scrollTop: $('.th_blocks').offset().top
					}, 1000);

					reinit.owl_th_block();
					$('.show_th_layouts_btn').click(function(){
						var block = $(this).data('block');
						if (block) {
							network.show_th_layouts(this, block, 1);
						}
					});

					$('.floors_select li').click(function(){
						var block = $(this).data('block');
						var floor = $(this).data('floor');
						if (block && floor) {
							$('.floors_select li').removeClass('active');
							$(this).addClass('active');
							$('#th_layouts_target').addClass('loading');
							network.show_th_layouts(null, block, floor, "from_floor");
						}
					});
				}else{

				}	
			}, "html");
		},
		subscribe: function(is_mob){
			var is_mob = is_mob || false;
			var form;
			if (is_mob) {
				form = $('#subscribtion_mob_form');
			}else{
				form = $('#subscribtion_form');
			}

			var post_data = form.serialize();
			network.post(RS + "ajax/", post_data, function(data){
				if (data.status != 'success') {
					form.find('[name="'+data.reason+'"]').addClass('wrong');
					form.find('[name="'+data.reason+'"]').focus();
				}else{
					form[0].reset();
					form.find('input').removeClass('wrong');
				}
				form.find('input').bind('input', function(){
					form.find('input').removeClass('wrong');
					form.find('p.response').text("");
				});
				form.find('p.response').text(data.message);
			}, "json");
		},
		loadMoreBp: function(curr_cat, curr_period){
			var curr_cat = curr_cat || false;
			var curr_period = curr_period || false;

			var post_data = {
				action: "loadMoreBp"
			}
			if (curr_cat) {
				post_data.curr_cat = curr_cat;
			}
			if (curr_period) {
				post_data.curr_period = curr_period;
			}
			network.post(RS + "ajax/", post_data, function(data){
				if (data) {
					data = JSON.parse(data);

					var prev_p = $('#load_more_items').data('curr_period');
					var next_p = $('#periods').find('[value='+prev_p+']');
					next_p = next_p.next().val();
					$('.more_items_target').append(data);


					var height = $('.more_items_target')[0].offsetHeight;
					if (height) {
						$('.bp_load_wrapper').animate({
							height: height
						}, 1000);
					}
					$('.show_btn_targ').css('paddingTop', '50px');
					setTimeout(function(){
						$('#load_more_items').removeClass('loading');
					}, 500);


					if (next_p) {
						$('#load_more_items').attr('data-curr_period', next_p);

						var clone = $('#load_more_items').clone();
						$('#load_more_items').remove();

						$('.show_btn_targ').html(clone);


						clone.click(function(e){
							clone.addClass('loading');
							network.loadMoreBp(curr_cat, next_p);
							e.stopPropagation();
						});

						$('.bp_target a.question').click(function(){
							var cat = $(this).data('cat');
							$('.bp_question').find('.caption').text("Готовы ответить на ваш вопрос о '" + cat + "'");
							$('.bp_question').find('input[name="cat"]').val(cat);
							var modal = $('#bp_question').modal('show');
						});

						$('.bp_subscription').on('hide.bs.modal', function (e) {
						    $('.bp_subscription form input[type="checkbox"]').prop('checked', false);
						    $('.bp_subscription .bp_cats_cbx').removeClass('checked');
						});

						$('.bp_target a.subscribe').click(function(){
							var cat = $(this).data('cat');
							$('.bp_subscription').find('input[value="'+cat+'"]').prop('checked', true);
							$('.bp_subscription').find('input[value="'+cat+'"]').parent('.bp_cats_cbx').addClass('checked');
							var modal = $('#bp_subscription').modal('show');
						});
						$('#bp_subscription_form input[type="checkbox"]').change(function(){
							var label = $(this).parent('.bp_cats_cbx');

							if ($(this).is(":checked")) {
								label.addClass('checked');
							}else{
								label.removeClass('checked');
							}
						});

						$('#bp_subscription_form .order_btn').click(function(){
							network.subscribeBp();
						});
						
					}else{
						$('#load_more_items').fadeOut(300).remove();
					}
					

				}
			}, "html")

		},
		sendBpQustion: function(){
			var post_data = $('#bp_question_form').serialize();
			network.post(RS + 'ajax/', post_data, function(data){
				if (data.status != 'success') {
					$('#bp_question_form').find('[name="'+data.reason+'"]').addClass('wrong');
					$('#bp_question_form').find('[name="'+data.reason+'"]').focus();
				}else{
					$('#bp_question_form')[0].reset();
					$('#bp_question_form input').removeClass('wrong');
					setTimeout(function(){
						$('#bp_question').modal('hide');
					}, 1000);
				}
				$('#bp_question_form input').bind('input', function(){
					$('#bp_question_form input').removeClass('wrong');
					$('#bp_question_form p.response').text("");
				});
				$('#bp_question_form p.response').text(data.message);
			}, 'json');
		},
		subscribeBp: function(){
			var post_data = $('#bp_subscription_form').serialize();
			network.post(RS + 'ajax/', post_data, function(data){
				if (data.status != 'success') {
					$('#bp_subscription_form').find('[name="'+data.reason+'"]').addClass('wrong');
					$('#bp_subscription_form').find('[name="'+data.reason+'"]').focus();
				}else{
					$('#bp_subscription_form')[0].reset();
					$('#bp_subscription_form input').removeClass('wrong');
					setTimeout(function(){
						$('#bp_subscription').modal('hide');
					}, 1000);
				}
				$('#bp_subscription_form input').bind('input', function(){
					$('#bp_subscription_form input').removeClass('wrong');
					$('#bp_subscription_form p.response').text("");
				});
				$('#bp_subscription_form p.response').text(data.message);
			}, 'json');
		}
	}

	var gmaps = {
		home_map: function(){
			var lat = parseFloat(storage.home_map_selector.data('lat')) || 0;
			var lng = parseFloat(storage.home_map_selector.data('lng')) || 0;

	        var map = new google.maps.Map(storage.home_map_selector[0], {
	          zoom: 16,
	          center: {lat:lat, lng:lng}
	        });
	        var marker = new google.maps.Marker({
				position: {lat:lat, lng:lng},
				map: map
	        });
		},
		layouts_placement_gmap: function(){
			if (storage.layouts_placement_gmaps.length > 0) {
				$.each(storage.layouts_placement_gmaps, function(i, el){
					var lat = $(el).data('lat');
					var lng = $(el).data('lng');

					var map = new google.maps.Map($(el)[0], {
			          zoom: 16,
			          center: {lat:lat, lng:lng}
			        });
			        var marker = new google.maps.Marker({
						position: {lat:lat, lng:lng},
						map: map
			        });
				});
			}
		},
		contacts_loc_gmap: function(){
			if ($('.contacts .loc_map').length > 0) {

				// var lat = parseFloat($('.contacts .coords li.active').data('lat')) || 0;
				// var lng = parseFloat($('.contacts .coords li.active').data('lng')) || 0;

				var lat = 50.2765;
				var lng = 30.5315;

		        var map = new google.maps.Map($('.contacts .loc_map')[0], {
		          zoom: 16,
		          center: {lat:lat, lng:lng}
		        });
		        var marker = new google.maps.Marker({
					position: {lat:lat, lng:lng},
					map: map
		        });
			}
		},
		modal_map: function(lat, lng, offset, from){
			var from = from || "";
			var lat = lat || 0;
			var lng = lng || 0;
			var offset = offset || 0;
			var map = new google.maps.Map(storage.map_modal.find('.map_target')[0], {
	          zoom: 16,
	          center: {lat:lat, lng:lng}
	        });
	        var marker = new google.maps.Marker({
				position: {lat:lat, lng:lng},
				map: map
	        });
	        storage.map_modal.css({
	        	//top: offset + "px"
	        	top: $(window).scrollTop()
	        });

	        if (from) {
	        	

		        if (from == "pecherska") {
		        	var start_point = {lat: 50.426, lng: 30.540};
		        	gmaps.set_map_route(map, start_point, {lat: lat, lng: lng});
		        }else if(from == "teremky"){
		        	var start_point = {lat: 50.367, lng: 30.454};
			        gmaps.set_map_route(map, start_point, {lat: lat, lng: lng});
		        }else if(from == "vidubichi"){
		        	var start_point = {lat: 50.402, lng: 30.560};
			        gmaps.set_map_route(map, start_point, {lat: lat, lng: lng});
		        }

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
		init_th_tab_map: function(self){
			var lat = $(self).data('lat') || 0;
			var lng = $(self).data('lng') || 0;

			$(self).closest('.right_text').find('.th_tab_select li').removeClass("active");
			$(self).addClass('active');
			var target = $(self).data("target");
			$(self).closest('.right_text').find('.th_miny_tab').hide(0);
			var victim = $(self).closest('.right_text').find(target);
			victim.show(0);

			if (lat && lng) {
				$('.hd_targ').hide(0);
				var map = new google.maps.Map(victim[0], {
		          	zoom: 16,
		          	center: {lat:lat, lng:lng}
		        });
		        var marker = new google.maps.Marker({
					position: {lat:lat, lng:lng},
					map: map
		        });
			}else{
				$('.hd_targ').show(0);
			}


		}
	}

	var reinit = {
		all: function(){
			reinit.aos();
			reinit.fancybox();
			reinit.owl_home_bp_prog();
			reinit.owl_home_flat();	
			reinit.owl_home_docs();
			reinit.owl_flats_houses();
			reinit.owl_layouts_house();
			reinit.owl_layouts_double();
			reinit.layouts_placement_gmap();
			reinit.contacts_loc_gmap();
			reinit.mask();
			reinit.owl_th_gallery();
			reinit.draggable_y();
			reinit.owl_th_block();
			reinit.owl_th_docs();
			reinit.owl_news_cats();
			reinit.owl_news_item_main();
			reinit.owl_mobile_bp_owl();
			reinit.cottages();
			reinit.triangle_parallax();

			if (PAGE == "cottages") {
				reinit.cottage_gen_plan_hover();

				$('.reasons_btns li').click(function(){
					nkz.handle_reasons(this);
				});
			}

			if (storage.ww <= 993) {
				reinit.owl_home_mobile_projects();
			}			
		},
		triangle_parallax: function(){
		$(window).on('mousemove', function(e) {
		        var w = $(window).width();
		        var h = $(window).height();

		        var offsetX = 0.5 - e.pageX / w;
		        var offsetY = 0.5 - e.pageY / h;
		        $(".parallax_move").each(function(i, el) {
		            var offset = parseInt($(el).data('offset'));
		            var translate = "translate3d(" + Math.round(offsetX * offset) + "px," + Math.round(offsetY * offset) + "px, 0px)";
		            $(el).css({
		                '-webkit-transform': translate,
		                'transform': translate,
		                '-moz-transform': translate
		            });
		        });
		    });
		},
		draggable_y: function(){
			$(".draggable-y:not(.map_wrapper)").draggable({ axis: "y", cancel: '.map_wrapper' });
		},
		mask: function(){
			$(".mask").mask("+380 (99) 999-99-99");
		},
		aos: function(){
			AOS.init();
		},
		home_gmap: function(){
			if (PAGE == "home") {
				setTimeout(function(){
					if (typeof(google) !== "undefined") {
						gmaps.home_map();
					}
				}, 10);
			}
		},
		layouts_placement_gmap: function(){
			if (PAGE == "layouts") {
				setTimeout(function(){
					if (typeof(google) !== "undefined") {
						gmaps.layouts_placement_gmap();
					}
				}, 10);
			}
		},
		contacts_loc_gmap: function(){
			if ($('.loc_map').length) {
				setTimeout(function(){
					if (typeof(google) !== "undefined") {
						gmaps.contacts_loc_gmap();
					}
				}, 30);
			}
		},
		fancybox: function(){
			$('.fancybox').fancybox();
		},
		owl_home_bp_prog: function(){
			$('.building_prog_tab .owl-carousel').owlCarousel({
				items: 2,
				nav: true,
				navText: ["", ""],
				loop: false
			});
		},
		owl_home_flat: function(){
			$.each($('.home_flats .flat_item .owl-carousel'), function(i, el){
				$(el).owlCarousel({
					items: 1,
					nav: false,
					dots: true,
					loop: true
				});
			});
		},
		owl_th_docs: function(){
			$('.th_docs .docs_target .owl-carousel').owlCarousel({
				items: 3,
				nav: false,
				navText: ["", ""],
				loop: false,
				responsive: {
					0: { items: 1 },
					768: { items: 2 },
					993: { items: 3 }
				}
			});
		},
		cottages: function(){
			$('.cottage_equip_owl').owlCarousel({
				items: 3,
				autoWidth: false,
				autoHeight: false,
				nav: false,
				navText: ["", ""],
				autoplay: true,
				autoplayTimeout: 4000,
				loop: true,
				responsive: {
					0: {
						items: 1
					},
					768: {
						items: 2
					},
					993: {
						items: 3
					}
				}
			});
			$('.cottages_gallery .slider').owlCarousel({
				items: 2,
				autoWidth: false,
				autoHeight: true,
				nav: true,
				navText: ["", ""],
				autoplay: true,
				autoplayTimeout: 5000,
				loop: false,
				responsive: {
					0: {
						items: 1
					},
					768: {
						items: 2
					},
					993: {
						items: 2
					}
				}
			});
		},
		owl_mobile_bp_owl: function(){
			$('.bp_prog .mobile .owl-carousel').owlCarousel({
				items: 1,
				nav: false,
				navText: ["", ""],
				loop: false,
				dots: true,
			});
		},
		owl_home_docs: function(){
			$('.home_docs .owl-carousel').owlCarousel({
				items: 3,
				nav: false,
				navText: ["", ""],
				loop: false,
				dots: true,
				responsive: {
					0: { items: 1 },
					768: { items: 2 },
					993: { items: 3 }
				}
			});
		},
		owl_news_cats: function(){
			$('.cats_owl .owl-carousel').owlCarousel({
				items: 2,
				nav: false,
				navText: ["", ""],
				loop: false,
				dots: false,
				autoplay: true,
				responsive: {
					0: { items: 2 },
					768: { items: 2 },
					993: { items: 2 }
				}
			});
		},
		owl_news_item_main: function(){
			$('.news_item_owl_main.owl-carousel').owlCarousel({
				items: 4,
				nav: false,
				navText: ["", ""],
				loop: false,
				dots: false,
				autoplay: true,
				responsive: {
					0: { items: 1 },
					768: { items: 2 },
					993: { items: 4 }
				}
			});
		},
		owl_home_mobile_projects: function(){
			$('.home_guarantees .projects .owl-carousel').owlCarousel({
				items: 3,
				nav: false,
				dots: true,
				navText: ["", ""],
				loop: true,
				responsive: {
					0: { items: 1 },
					500: { items: 2 },
					768: { items: 3 }
				}
			});
		},
		owl_flats_houses: function(){
			$.each($('.flats_houses .house_item .owl-carousel'), function(i, el){
				$(el).owlCarousel({
					items: 1,
					nav: true,
					navText: ["", ""],
					dots: true,
					loop: true
				});
			});
		},
		owl_th_gallery: function(){
			$(storage.th_gallery_owl).owlCarousel({
				items: 1,
				nav: true,
				navText: ["", ""],
				dots: false,
				loop: true,
				responsive: {
					0: {dots: true},
					993: {dots: false}
				}
			});
		},
		owl_layouts_house: function(){
			var sync1 = $(".layouts_house .house_item .owl-carousel.primary");
		    var sync2 = $(".layouts_house .house_item .owl-carousel.secondary");

			sync1.owlCarousel({
				items : 1,
				slideSpeed : 2000,
				nav: true,
				navText: ["",""],
				autoplay: false,
				dots: false,
				loop: true,
				responsiveRefreshRate : 200,
				autoHeight: false,
				responsive: {
					0: { dots: true },
					993: { dots: false }
				}
			}).on('changed.owl.carousel', syncPosition);


			sync2.on('initialized.owl.carousel', function () {
				sync2.find(".owl-item").eq(0).addClass("current");
			}).owlCarousel({
				items: 9,
				dots: false,
				nav: false,
				smartSpeed: 200,
				slideSpeed : 500,
				autoWidth: true,
				loop:false,

				responsiveRefreshRate : 100
			}).on('changed.owl.carousel', syncPosition2);

			function syncPosition(el) {
				var count = el.item.count-1;
				var current = Math.round(el.item.index - (el.item.count/2) - .5);
				if(current < 0) {
					current = count;
				}
				if(current > count) {
					current = 0;
				}
				var fix_index = 0;
				if (sync2.find(".owl-item").length <= 2) {
					fix_index = 1;
				}
				
				sync2.find(".owl-item").removeClass("current").eq(current - fix_index).addClass("current");
				if($(sync2).data("owlCarousel") !== undefined){
	                center(current);
	            }
				var onscreen = sync2.find('.owl-item.active').length - 1;
				var start = sync2.find('.owl-item.active').first().index();
				var end = sync2.find('.owl-item.active').last().index();
				if (current > end) {
					sync2.data('owl.carousel').to(current, 100, true);
				}
				if (current < start) {
					sync2.data('owl.carousel').to(current - onscreen, 100, true);
				}
			}
			function syncPosition2(el) {
				var number = el.item.index;
				sync1.data('owl.carousel').to(number, 100, true);
			}
			sync2.on("click", ".owl-item", function(e){
				e.preventDefault();
				var number = $(this).index();
				sync1.data('owl.carousel').to(number, 300, true);
			});
		},
		cottage_gen_plan_hover: function(){
			$('.cottage_poly').hover(function(){
				var container = $('#cottages_genplan');
				var container_w = $('#cottages_genplan').outerWidth();
				var cottage = this;
				var dialog = $('#cot_gen_plan_dialog');
				var dialog_h = $(dialog).outerHeight();
				var container_ofs_top = $(container).offset().top;
				var c_ofs_top = ($(cottage).offset().top) - ($(container).offset().top);
				var c_ofs_left = $(cottage).offset().left;
				var c_ofs_right = container_w - c_ofs_left;

				var ct_status = $(cottage).data('status');
				var ct_text = $(cottage).data('text');

				var flag = false;
				if (ct_status == '1') {
					$(dialog).removeClass('sold available sector').addClass('sector');
					$(dialog).find('.capt').text("Участок под застройку");
					$(dialog).find('.desc').text(ct_text);
					flag = true;
				}else if(ct_status == '2'){
					$(dialog).removeClass('sold available sector').addClass('available');
					$(dialog).find('.capt').text("В наличии");
					$(dialog).find('.desc').text(ct_text);
					flag = true;
				}else if(ct_status == '3'){
					$(dialog).removeClass('sold available sector').addClass('sold');
					$(dialog).find('.capt').text("Продано");
					$(dialog).find('.desc').text("");
					flag = true;
				}else{
					flag = false;
				}

				var dialog_left_post = 0;
				if (c_ofs_right < 260) {
					dialog_left_post = c_ofs_left - 260;
				}else{
					dialog_left_post = c_ofs_left - 20;
				}
				if (flag == true) {
					$(dialog).css({
						display: 'block',
						top: (c_ofs_top - dialog_h)+'px',
						left: dialog_left_post+'px',
					});
				}
			}, function(){
				$('#cot_gen_plan_dialog').hide(0);
			});
		},
		owl_layouts_double: function(){
			$.each($('.layout_item'), function(i, el){
				var sync1 = $(el).find('.owl-carousel.primary');
			    var sync2 = $(el).find('.owl-carousel.secondary');

				sync1.owlCarousel({
					items : 1,
					slideSpeed : 2000,
					nav: false,
					navText: ["",""],
					autoplay: false,
					dots: false,
					loop: true,
					responsiveRefreshRate : 200,
					autoHeight: false,
					responsive: {
						0: { dots: true },
						993: { dots: false }
					}
				}).on('changed.owl.carousel', syncPosition);


				sync2.on('initialized.owl.carousel', function () {
					sync2.find(".owl-item").eq(0).addClass("current");
				}).owlCarousel({
					items: 5,
					dots: false,
					nav: false,
					smartSpeed: 200,
					slideSpeed : 500,
					loop:false,

					responsiveRefreshRate : 100
				}).on('changed.owl.carousel', syncPosition2);

				function syncPosition(el) {
					var count = el.item.count-1;
					var current = Math.round(el.item.index - (el.item.count/2) - .5);
					if(current < 0) {
						current = count;
					}
					if(current > count) {
						current = 0;
					}
					var fix_index = 0;
					if (sync2.find(".owl-item").length <= 2) {
						fix_index = 1;
					}
					
					sync2.find(".owl-item").removeClass("current").eq(current - fix_index).addClass("current");
					if($(sync2).data("owlCarousel") !== undefined){
		                center(current);
		            }
					var onscreen = sync2.find('.owl-item.active').length - 1;
					var start = sync2.find('.owl-item.active').first().index();
					var end = sync2.find('.owl-item.active').last().index();
					if (current > end) {
						sync2.data('owl.carousel').to(current, 100, true);
					}
					if (current < start) {
						sync2.data('owl.carousel').to(current - onscreen, 100, true);
					}
				}
				function syncPosition2(el) {
					var number = el.item.index;
					sync1.data('owl.carousel').to(number, 100, true);
				}
				sync2.on("click", ".owl-item", function(e){
					e.preventDefault();
					var number = $(this).index();
					sync1.data('owl.carousel').to(number, 300, true);
				});
			});
		},
		owl_th_block: function(){
			$('.th_blocks .th_block .block_slider.owl-carousel').owlCarousel({
				items: 1,
				nav: true,
				navText: ["", ""],
				loop: true,
				dots: true
			});
		}
	}


	var nkz = {
		start: function(){
			$(storage.open_drop_down_btn).click(function(){
				nkz.open_drop_down();
			});
			$(storage.close_drop_down_btn).click(function(){
				nkz.close_drop_down();
			});
			$(storage.dark_overlay).click(function(){
				nkz.close_drop_down();
			});
			$(storage.home_tabs_nav).find('a').click(function(){
				nkz.show_home_tab(this);
			});
			$(storage.home_mobile_sect_h).click(function(){
				nkz.toggle_mobile_sect(this);
			});
			$(storage.home_infra_tabs_nav).click(function(){
				nkz.toggle_infra_tabs(this);
			});
			$(storage.home_env_tabs_nav).click(function(){
				nkz.toggle_env_tabs(this);
			});
			$(storage.go_up_btn).click(function(){
				$("html, body").animate({scrollTop: 0}, 1000, 'swing');
			});
			$(storage.house_link_tooltip).hover(function(e){
				var el = this;
				nkz.show_house_tooltip(el, e);
			}, function(){
				nkz.hide_house_tooltip();
			});
			$(storage.layouts_placement_nav).click(function(){
				nkz.toggle_layout_placement_maps(this);
			});
			$(storage.layouts_features_nav).click(function(){
				nkz.toggle_layout_features_tabs(this);
			});
			$(storage.layouts_box_header).click(function(){
				nkz.toggle_mob_box(this);
			});
			$(storage.about_tab_nav).click(function(){
				nkz.toggle_about_tabs(this);
			});
			$(storage.about_tab_m).click(function(){
				nkz.toogle_about_mob_tab(this);
			});
			$(storage.map_trigger).click(function(){
				var lat = $(this).data('lat');
				var lng = $(this).data('lng');
				var from = $(this).data('from');
				var offset = $(this).offset().top;
				gmaps.modal_map(lat, lng, offset + 25, from);
			});

			$('.map_close_btn, .map_overlay').click(function(){
				$('.map_hold').css({top:-2000});
				$('.map_overlay').hide(0);
				$('#map_target').html("");
			});
			events.scroll(window, function(){
				var offset = storage.d.scrollTop();
				if (offset > 500) {
					storage.go_up_btn.removeClass('fadeOutUp').addClass('fadeInDown db');
				}else{
					storage.go_up_btn.removeClass('fadeInDown').addClass('fadeOutUp');
				}
			});

			$('.contacts .coords li').click(function(){
				$('.contacts .coords li').removeClass('active');
				$(this).addClass('active');
				reinit.contacts_loc_gmap();
			});

			$('.th_tab_select li').click(function(){
				gmaps.init_th_tab_map(this);
			});

			$('.th_env_tabs .nav_item').click(function(){
				nkz.toggle_th_tabs(this);
			});

			// TOWNHOUSES GENPLAN
			$('.th_genplan_holder .gp_item button').hover(function(){
				var el = $(this);
				var target = el.data('target');
				$('.th_svg_element').css({opacity: 0});
				$('[data-victim='+target+']').css({opacity: 0.6});
			}, function(){
				$('.th_svg_element').css({opacity: 0});
			});

			$('#townhouses_svg .th_svg_element.town').hover(function(){
				$('.th_svg_element').css({opacity: 0});
				var el = $(this);
				var target = el.data('victim');
				$('[data-target='+target+']').addClass('active');
				el.css({opacity: 0.6});
			}, function(){
				$('.th_svg_element').css({opacity: 0});
				$('.th_genplan_holder .gp_item button').removeClass("active");
			});

			$('[data-target="praha_town"], [data-victim="praha_town"]').click(function(){
				network.load_th_block('praha_town');
			});
			$('[data-target="amst_town"], [data-victim="amst_town"]').click(function(){
				network.load_th_block('amst_town');
			});
			$('[data-target="bud_town"], [data-victim="bud_town"]').click(function(){
				network.load_th_block('bud_town');
			});

			$('[data-target="praha_house"], [data-victim="praha_house"]').click(function(){
				network.load_th_block('praha_house');
			});
			$('[data-target="amst_house"], [data-victim="amst_house"]').click(function(){
				network.load_th_block('amst_house');
			});
			$('[data-target="bud_house"], [data-victim="bud_house"]').click(function(){
				network.load_th_block('bud_house');
			});


			$('.show_th_layouts_btn').click(function(){
				//nkz.toggle_th_layouts(this);
				var block = $(this).data('block');
				if (block) {
					network.show_th_layouts(this, block, 1);
				}
			});

			$('.floors_select li').click(function(){
				var block = $(this).data('block');
				var floor = $(this).data('floor');
				if (block && floor) {
					$('.floors_select li').removeClass('active');
					$(this).addClass('active');
					$('#th_layouts_target').addClass('loading');
					network.show_th_layouts(null, block, floor, "from_floor");
				}
			});

			$('.th_docs .docs_target .nav_item').click(function(){
				nkz.toggle_th_docs(this);
			});

			$('.th_mobile_toogle_h').click(function(){
				var el = $(this);
				var cont = el.parent().find('.th_env_content');
				if (el.hasClass('active')) {
					el.removeClass('active');
					cont.slideUp(300);
				}else{
					el.addClass('active');
					cont.find('.hd_targ').show(0);
					cont.find('.item_map').hide(0);
					cont.slideDown(300);
				}
			});

			// ROOMS ATTR CHANGE
			/*
			$('.flats_houses .rooms_count button').click(function(){
				var btn = $(this);
				var target = btn.data('target');
				var link = btn.closest('.right').find('a.show_layouts');
				btn.closest('.right').find('.rooms_count button').removeClass('active');
				btn.addClass('active');

				if (target) {
					link.attr('href', target);
				}
			});

			$('.flat_item .rooms_count button').click(function(){
				var btn = $(this);
				var target = btn.data('target');
				var link = btn.closest('.text_area').find('a.show_layouts');
				btn.closest('.text_area').find('.rooms_count button').removeClass('active');
				btn.addClass('active');

				if (target) {
					link.attr('href', target);
				}
			});
			*/

			nkz.launch_event_timers();

			// VISIT MODAL
			$('#visit_form').find('.order_btn').click(function(){
				network.appointment();
			});
			$("#visit_form input").keyup(function(e) {
				var code = e.keyCode ? e.keyCode : e.which;
				if (code == 13) { 
					network.appointment();
				}
			});

			// CONTACT FORM
			$('#contacts_form').find('.submit').click(function(){
				network.contact_form();
			});
			$("#contacts_form input").keyup(function(e) {
				var code = e.keyCode ? e.keyCode : e.which;
				if (code == 13) { 
					network.contact_form();
				}
			});

			$('.success_div .close').click(function(){
				$('.success_div').addClass('dn');
			});

			$('.phone.shadow_wrap .show_recall').click(function(){
				$('.contacts .phone').removeClass('with_bg');
				$('.contacts .phone').css('padding-left', '25px');
				$('.recall_hide').hide(0);
				$('.recall_wrap').show(0);
			});

			$('.close_recall').click(function(){
				$('.contacts .phone').addClass('with_bg');
				$('.contacts .phone').css('padding-left', '45px');
				$('.recall_hide').show(0);
				$('.recall_wrap').hide(0);
			});

			$('.phone.shadow_wrap .submit').click(function(){
				network.recall();
			});

			$('#mob_news_cats_form select').change(function(){
				var val = this.value;
				if (val) {
					document.location.href = val;
				}
			});

			$('#subscribtion_form .submit').click(function(){
				network.subscribe();
			});

			$('#subscribtion_mob_form .submit').click(function(){
				network.subscribe(true);
			});

			$('.bp_target .show_more').click(function(){
				$(this).parent().find('.item_desc').css('max-height','none');
				$(this).hide(0);
			});

			$('#mob_bp_cat_select_form select').change(function(){
				var val = this.value;
				if (val) {
					document.location.href = val;
				}
			});

			$('#bp_period_form select[name="bp_period"]').change(function(){
				var val = this.value;
				var cat = $(this).data("curr_cat");
				if (val) {
					if (cat) {
						document.location.href = RS+"building-progress/?cat=" + cat + "&period=" + val;
					}else{
						document.location.href = RS+"building-progress/?period=" + val;
					}
				}
			});


			$('.load_more_items').click(function(e){
				$(this).addClass('loading');
				var curr_cat = $(this).data('curr_cat');
				var curr_period = $(this).data('curr_period');
				network.loadMoreBp(curr_cat, curr_period);
				e.stopPropagation();
			});

			$('.show_btn_targ').fadeIn(300);


			$('.bp_target a.question').click(function(){
				var cat = $(this).data('cat');
				$('.bp_question').find('.caption').text("Готовы ответить на ваш вопрос о '" + cat + "'");
				$('.bp_question').find('input[name="cat"]').val(cat);
				var modal = $('#bp_question').modal('show');
			});

			$('#bp_question_form .order_btn').click(function(){
				network.sendBpQustion();
			});




			$('.bp_subscription').on('hide.bs.modal', function (e) {
			    $('.bp_subscription form input[type="checkbox"]').prop('checked', false);
			    $('.bp_subscription .bp_cats_cbx').removeClass('checked');
			});

			$('.bp_target a.subscribe').click(function(){
				var cat = $(this).data('cat');
				$('.bp_subscription').find('input[value="'+cat+'"]').prop('checked', true);
				$('.bp_subscription').find('input[value="'+cat+'"]').parent('.bp_cats_cbx').addClass('checked');
				var modal = $('#bp_subscription').modal('show');
			});



			$('#bp_subscription_form input[type="checkbox"]').change(function(){
				var label = $(this).parent('.bp_cats_cbx');

				if ($(this).is(":checked")) {
					label.addClass('checked');
				}else{
					label.removeClass('checked');
				}
			});

			$('#bp_subscription_form .order_btn').click(function(){
				network.subscribeBp();
			});



			$('.modal').on('show.bs.modal', function (e) {
			    nkz.modalAnim('fadeInDown');
			});
			$('.modal').on('hide.bs.modal', function (e) {
			    nkz.modalAnim('fadeOutLeft');
			});

			reinit.all();
		},
		modalAnim: function(anim_name){
			var anim = anim_name || '';
			$('.modal .modal-dialog').attr('class', 'modal-dialog  ' + anim + '  animated4');
		},
		launch_event_timers: function(){
			if ($('.event.timer').length) {				
				$.each( $('.event.timer'), function(i, el) {
					var start_time = $(el).data('time_val');
					var time_left = start_time - (Date.parse(new Date()) / 1000);

					setInterval(function(){
						if (time_left > 0) { 

							var seconds = Math.floor((time_left) % 60);
							var minutes = Math.floor((time_left/60) % 60);
							var hours = Math.floor((time_left/(60*60)) % 24);
							var days = Math.floor(time_left/(60*60*24));
							$(el).find('.days .b').text(days);
							$(el).find('.hours .b').text(hours);
							$(el).find('.minutes .b').text(minutes);

							if (!$(el).hasClass('op1')) {
								$(el).addClass('op1');
							}
						}else{
							$(el).hide(0);
							
						}
						time_left--;
					}, 200);
				});
			}
		},
		toggle_th_docs: function(self){

			var el = $(self);
			$('.th_docs .docs_target .nav_item').removeClass('active');
			$('.th_docs .docs_target .docs_content .item').removeClass('active');
			el.addClass('active');
			var target = el.data('target');
			$('.th_docs .docs_target .docs_content').find(target).addClass("active");
		},
		toggle_th_layouts: function(self){
			var btn = $(self);
			var block = btn.closest('.th_block');
			var layouts = block.find('.th_layouts_target');

			if (block.hasClass('opened')) {
				btn.removeClass('active').find('span').text("Показать планировки");
				block.removeClass('opened');
				layouts.slideUp(300);
			}else{
				btn.addClass('active').find('span').text("Скрыть планировки");
				block.addClass('opened');
				layouts.slideDown(300);
			}
		},
		toggle_th_tabs: function(self){
			var s = $(self);
			var target = s.data("target");
			$('.th_env_tabs .nav_item').removeClass("active");
			$(s).addClass('active');

			$('.th_env_tabs .content .item').removeClass("active");
			$('.th_env_tabs').find(target).addClass("active");
		},
		toggle_about_tabs: function(self){
			storage.about_tab_nav.removeClass('active');
			$(self).addClass('active');
			storage.about_tab_cont.removeClass('active');
			var target = $(self).data('target');
			$(target).addClass('active');
		},
		toogle_about_mob_tab: function(self){
			$(self).toggleClass("active");
			$(self).find('.tab_c').slideToggle(300);
		},
		toggle_mob_box: function(self){
			var target = $(self).data('target');
			$(self).toggleClass('active');
			$(target).slideToggle(300);
		},
		toggle_layout_features_tabs: function(self){
			$(self).closest('.features').find('p a').removeClass('active');
			$(self).addClass('active');
			$(self).closest('.features').find('.features_tab').removeClass('active');
			var target = $(self).data('target');

			$(self).closest('.features').find(target).addClass('active');
		},
		toggle_layout_placement_maps: function(self){
			storage.layouts_placement_nav.removeClass('active');
			$(self).addClass('active');
			storage.layouts_placement_cont.removeClass('active');
			var target = $(self).data('target');
			$(target).addClass('active');
			reinit.layouts_placement_gmap();
		},
		show_house_tooltip: function(element, e){
            var mouse_x = e.pageX - $('.filter').offset().left;
            var mouse_y = e.pageY - $('.filter').offset().top;

			var tooltip = $(element).data('tooltip');
			var container = $(element).closest('.filter').find('.house_tooltip');
			//var x = $(element).position().left;
            //var y = $(element).position().top;
            container.find('p').text(tooltip);
            var ch = 30; 
            container.css({left: mouse_x + 25, top: mouse_y - ch, bottom: "auto"});
            container.show(0);
		},
		hide_house_tooltip: function(){
			$('.house_tooltip').find('p').text("");
			$('.house_tooltip').hide(0);
		},
		open_drop_down: function(){
			storage.drop_menu.show(0).removeClass('slideOutUp').addClass('slideInDown');
			storage.dark_overlay.show(0).removeClass('fadeOut').addClass('fadeIn');
			setTimeout(function(){
				storage.close_drop_down_btn.show(0).addClass('fadeIn');
			}, 300);
		},
		close_drop_down: function(){
			storage.drop_menu.removeClass('slideInDown').addClass('slideOutUp');
			storage.dark_overlay.removeClass('fadeIn').addClass('fadeOut');
			storage.close_drop_down_btn.show(0).removeClass('fadeIn');
			setTimeout(function(){
				storage.drop_menu.hide(0);
				storage.dark_overlay.hide(0);
				storage.close_drop_down_btn.hide(0);
			}, 300);
		},
		show_home_tab: function(self){
			var target = $(self).data('target');
			storage.home_top_tabs.find('.home_tab').removeClass('active');
			storage.home_top_tabs.find(target).addClass('active');
			storage.home_tabs_nav.find('li').removeClass('active');
			$(self).parent().addClass('active');
			if (target == ".map_tab") {
				reinit.home_gmap();
			}
			if (target == ".building_prog_tab") {
				setTimeout(function(){
					$('.building_prog_tab .b_carousel').addClass('fadeIn');
				}, 400);
			}
		},
		toggle_mobile_sect: function(self){
			var target = $(self).data('target');
			if (target != '.th_ref' && target != '.ct_ref') {
				$(self).toggleClass('active');
				$(target).slideToggle(300);
			}
		},
		toggle_infra_tabs: function(self){
			storage.home_infra_tabs_nav.removeClass('active');
			$(self).addClass('active');
			storage.home_infra_tabs_cont.removeClass('active');
			var target = $(self).data('target');
			$(target).addClass('active');
		},
		toggle_env_tabs: function(self){
			storage.home_env_tabs_nav.removeClass('active');
			$(self).addClass('active');
			storage.home_env_tabs_cont.removeClass('active');
			var target = $(self).data('target');
			$(target).addClass('active');
		},
		handle_reasons: function(el){
			var el = el || {};
			var val = $(el).find('span').text();
			$('.reasons_btns li').removeClass('active');
			$('.reasons_desc .reason_holder').removeClass('active');
			if (val == '1' || val == '2' || val == '3' || val == '4' || val == '5') {
				var img_source = $(el).find('input[name="image_name"]').val();
				$(el).addClass('active');
				$('.reasons_desc .reason'+val).addClass('active');
				$('.reasons_preview')[0].style.backgroundImage = "url('"+img_source+"')";
			}
			
		},
	}
	nkz.start();
})(jQuery);

