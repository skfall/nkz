var reinit_th = {
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
    th_layout_gal: (selector1, selector2, params) => {
        var block_id = block_id || 0;
		var sync1 = $('.top_owl');
		var sync2 = $('.bot_owl');
		var slidesPerPage = 4;
		var syncedSecondary = true;

		sync1.owlCarousel({
			items : 1,
			slideSpeed : 2000,
            nav: false,
            navText: false,
			autoplay: false,
			dots: false,
			loop: false,
			responsiveRefreshRate : 200,
			autoHeight: true
		}).on('changed.owl.carousel', syncPosition);
		sync2
			.on('initialized.owl.carousel', function () {
			sync2.find(".owl-item").eq(0).addClass("current");
		}).owlCarousel({
			items : slidesPerPage,
			dots: false,
			nav: false,
			smartSpeed: 200,
			slideSpeed : 500,
			
			responsiveRefreshRate : 100
		}).on('changed.owl.carousel', syncPosition2);

		function syncPosition(el) {
			var current = el.item.index;
			sync2
            .find(".owl-item")
            .removeClass("current")
            .eq(current)
            .addClass("current");
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
			if(syncedSecondary) {
				var number = el.item.index;
				sync1.data('owl.carousel').to(number, 100, true);
			}
		}
		sync2.on("click", ".owl-item", function(e){
			e.preventDefault();
			var number = $(this).index();
			sync1.data('owl.carousel').to(number, 300, true);
		});
    },










    
    th_gal: () => {
        var block_id = block_id || 0;
		var sync1 = $('.th_gal_owl .th_gal_top');
		var sync2 = $('.th_gal_owl .th_gal_bot');
		var slidesPerPage = 4;
		var syncedSecondary = true;

		sync1.owlCarousel({
			items : 1,
			slideSpeed : 2000,
			nav: true,
			autoplay: false,
			dots: false,
			loop: false,
			responsiveRefreshRate : 200,
			autoHeight: true
        }).on('changed.owl.carousel', syncPosition);
        
		sync2.on('initialized.owl.carousel', function () {
			sync2.find(".owl-item").eq(0).addClass("current");
		}).owlCarousel({
			items : slidesPerPage,
			dots: false,
			nav: false,
			smartSpeed: 200,
			slideSpeed : 500,
			
			responsiveRefreshRate : 100
		}).on('changed.owl.carousel', syncPosition2);

		function syncPosition(el) {
            // var c = this.currentItem;
			//var count = el.item.count;
             var current = el.item.index;
            
            // if(current < 0) {
            // current = count;
            // }
            // if(current > count) {
            // current = 0;
            // }


			sync2
            .find(".owl-item")
            .removeClass("current")
            .eq(current)
            .addClass("current");
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
			if(syncedSecondary) {
				var number = el.item.index;
				sync1.data('owl.carousel').to(number, 100, true);
			}
		}
		sync2.on("click", ".owl-item", function(e){
			e.preventDefault();
			var number = $(this).index();
			sync1.data('owl.carousel').to(number, 300, true);
		});
    },












    th_lines_layouts_gal: () => {
        var block_id = block_id || 0;
		var sync1 = $('.block_layout_wrapper .images .primary');
		var sync2 = $('.block_layout_wrapper .images .secondary');
		var slidesPerPage = 4;
		var syncedSecondary = true;

		sync1.owlCarousel({
			items : 1,
			slideSpeed : 2000,
			nav: false,
            autoplay: false,
            lazyLoad: false,
			dots: false,
			loop: false,
			responsiveRefreshRate : 200,
			autoHeight: false
		}).on('changed.owl.carousel', syncPosition);
		sync2
			.on('initialized.owl.carousel', function () {
			sync2.find(".owl-item").eq(0).addClass("current");
		}).owlCarousel({
			items : slidesPerPage,
			dots: false,
			nav: false,
			smartSpeed: 200,
			slideSpeed : 500,
			
			responsiveRefreshRate : 100
		}).on('changed.owl.carousel', syncPosition2);

		function syncPosition(el) {
			// var c = this.currentItem;
			//var count = el.item.count;
            var current = el.item.index;
            
            // if(current < 0) {
            // current = count;
            // }
            // if(current > count) {
            // current = 0;
            // }


			sync2
            .find(".owl-item")
            .removeClass("current")
            .eq(current)
            .addClass("current");
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
			if(syncedSecondary) {
				var number = el.item.index;
				sync1.data('owl.carousel').to(number, 100, true);
			}
		}
		sync2.on("click", ".owl-item", function(e){
			e.preventDefault();
			var number = $(this).index();
			sync1.data('owl.carousel').to(number, 300, true);
		});
    },
};


var app = {
    start: () => {
        console.log("App started...");

        setTimeout(function(){    
            $("#th_video").bind("timeupdate", app.video_update);
        }, 500);

        $('body').imagesLoaded( function() {
            reinit_th.owl($('.th_slider .sld_holder'), {
                items: 1,
                autoHeight: true
            });

    
            reinit_th.th_layout_gal();
            reinit_th.th_gal();
        });

        reinit_th.fancy($('.fancybox'));

        $('.circle_text').hover((e) => {
            var el = e.currentTarget;
            var el_id = el.id;
            var dot_id = el_id.replace("_t", "");
            $(".time_point").removeClass("hovered");
            $('.circle_text').removeClass('hovered');
            $("#" + dot_id).addClass("hovered"); 
            $(el).addClass("hovered");
        }, () => {
            $('.circle_text').removeClass('hovered');
            $(".time_point").removeClass("hovered");            
        });

        $('.th_svg_element').hover((e) => {
            var el = e.currentTarget;
            var target = $('.floating');
            var margin = ~~(target.width() + 70);
            var childPos = $(el).offset();
            var parentPos = $('.th_genplan').offset();
            var type = $(el).data("type");
            var name = $(el).data("name");
            var area = $(el).data("area");
            var sub_area = $(el).data("sub-area");
            var sub_area2 = $(el).data("sub-area2");
            var price = $(el).data("price");
            var x = ~~$(el).offset().left;
            var y = ~~(childPos.top - parentPos.top);

            target.find(".item_type").text(type);
            target.find(".item_name").text(name);
            target.find(".area .val").text(area);
            target.find(".add_area .val").text(sub_area);
            target.find(".add_area2 .val").text(sub_area2);
            target.find(".price .val").text(price);
            
            target.css({
                left: x - margin,
                top: y
            });
            
            target.show(0);
                
        }, (e) => {
            $('.floating').hide(0);         
        });

        setTimeout(function(){
            $(window).trigger('resize').trigger('scroll');  
        }, 1000);
        
    },
    load_rd_th: (th_id, self) => {
        var th_id = th_id || 0;
        $('.rd_th_layouts').addClass("op06");
        setTimeout(function(){
            $.post(RS + "ajax/", {action: "load_rd_th", id: th_id}, (data, status) => {
                if (status == "success") {
                    if (data.status == "success") {
                        $('.layouts_switcher li').removeClass('active');
                        var layouts = data.layouts;
                        $('.rd_th_layouts_holder').html(layouts);
                        setTimeout(function(){
                            reinit_th.th_layout_gal();
                        }, 20);
    
                        $(self).addClass("active");
                        $(".rd_th_layouts .th_name").text(data.th_name);
                        $(".rd_th_layouts .description").text(data.th_desc);
                    }
                }
    
                $('.rd_th_layouts').removeClass("op06");
            }, "json");
        }, 100);
    },
    load_lines_layouts: (id, self) => {
        var id = id || 0;
        var target = $('#th_blocks_layouts_target');
        if (id > 0) {
            $.post(RS + "ajax/", {action: "load_lines_layouts", id: id}, (data, status) => {
                if (status == "success") {
                    if (data.status == "success") {
                        target.html(data.layouts);
                        setTimeout(function(){
                            reinit_th.th_lines_layouts_gal();
                            reinit_th.fancy($('.fancybox_ajax'));
                            target.show(0);

                            $("html, body").animate({
                                scrollTop:$('#th_blocks_layouts_target').offset().top
                            }, 1000);

                        }, 30);
                    }
                }
            }, "json");
        }
    },
    th_floors_handler: (id, self) => {
        $('.th_blocks_layouts_parent').animate({
            opacity: 0.5
        }, 300);

        var id = id || 0;
        $('.floors_select li a').removeClass("active");
        $(self).addClass("active");

        setTimeout(function(){
            $('.th_blocks_layouts_parent').animate({
                opacity: 1
            }, 200);
            
        }, 300);
        $('.th_block_layout_holder').removeClass("active");
        $('#th_floor_item_' + id).addClass("active");
    },
    video_jump: (self) => {
        $('.circle_text').removeClass("active");
        $('.time_point').removeClass("active");
        $(self).addClass("active");
        var curr_id = self.id;
        var dot_id = curr_id.replace("_t", "");
        $("#" + dot_id).addClass("active"); 
        var video = $('#th_video');
        var target_time = $(self).data("time");
        video[0].currentTime = target_time;
        video[0].play();
    },
    video_update: () => {
        var t = ~~$("#th_video")[0].currentTime;
        var total_duration = ~~$('#th_video')[0].duration;

        var m1 = ~~$('#c_part1_t').data("time");
        var m2 = ~~$('#c_part2_t').data("time");
        var m3 = ~~$('#c_part3_t').data("time");
        var m4 = ~~$('#c_part4_t').data("time");
        var m5 = ~~$('#c_part5_t').data("time");
        
        var active_selector = "c_part1_t";
        
        if(t >= m1 && t < m2){
            active_selector = "c_part1_t";            
        }else if(t >= m2 && t < m3){
            active_selector = "c_part2_t";
        }else if(t >= m3 && t < m4){
            active_selector = "c_part3_t";
        }else if(t >= m4 && t < m5){
            active_selector = "c_part4_t";
        }else if(t >= m5) {
            active_selector = "c_part5_t";
        }

        if (t == total_duration){
            $('section.video').slideUp(1000);
            $(window).trigger('resize').trigger('scroll');  
        }

        $('.circle_text').removeClass('active');
        $(".time_point").removeClass("active");

        $('#' + active_selector).addClass("active");
        var dot_selector = active_selector.replace("_t", "");
        $('#' + dot_selector).addClass("active");
        
    },
    mute_video: (self) => {
        var video = $('#th_video')[0];
        if(video.muted){
            video.muted = false;
            $(self).removeClass("muted");            
        }else{
            video.muted = true;
            $(self).addClass("muted");
        }
    },
    set_gal_image: (self) => {
        var self = self || {};
        var curr_src = $(self).find('img')[0].src;
        var curr_index = $(self).data("index");
        $('.th_gal .circus .item').removeClass("active");
        $(self).addClass("active");


        var target_image = $('.th_gal .preview img')[0];
        var target_fancy = $('.th_gal .preview .fancybox')[0];

        target_fancy.href = curr_src;
        target_image.src = curr_src;

        $('.th_gal .preview').attr("data-current-index", curr_index);

    }, 
    th_gal_handle: (self, action) => {
        var action = action || "next";
        var target = $('.th_gal .preview img');
        var current_index = $('.th_gal .preview').data("current-index");
        //$('.th_gal .circus .item').removeClass("active");
        var new_index = 0;
        if(action == "next"){
            new_index = parseInt(current_index) + 1;
        }else if(action == "prev"){
            new_index = parseInt(current_index) - 1;            
        }
        var new_src = $('.th_gal .item[data-index="'+ new_index+'"] img')[0].src;
        $('.th_gal .preview').attr("data-current-index", new_index);
        target[0].src = new_src;
    },

};

(function($){
    app.start();
})(jQuery);
