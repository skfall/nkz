var upd = {
    start: () => {
        $('body').imagesLoaded( function() {
            upd.flats_list_owl();
        });
        
    },
    scroll_to: (target) => {
        $('html, body').animate({
            scrollTop: $(target).offset().top
        }, 1000);
    },
    recall: () => {
        var post_data = $('#recall_form_modal').serialize();
        $.post(RS + 'ajax/', post_data, (data, status) => {
            if (status == "success") {
                if (data.status != 'success') {
                    $('#recall_form_modal').find('[name="'+data.reason+'"]').addClass('wrong');
                    $('#recall_form_modal').find('[name="'+data.reason+'"]').focus();
                }else{
                    dataLayer.push({'event': 'callback'});
                    $('#recall_form_modal')[0].reset();
                    $('#recall_form_modal input').removeClass('wrong');
                }
                $('#recall_form_modal input').bind('input', function(){
                    $('#recall_form_modal input').removeClass('wrong');
                    $('#recall_form_modal p.response').text("");
                });
                $('#recall_form_modal p.response').text(data.message);
            }
        }, 'json');
    },
    flats_list_owl: () => {
        $.each($('.upd_house_owl_primary'), (i, el) => {
            var sync1 = $(el);
            var sync2 = $('.' + $(el).data('thumbs'));
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
                sync2.find(".owl-item").removeClass("current").eq(current).addClass("current");
                var onscreen = sync2.find('.owl-item.active').length - 1;
                var start = sync2.find('.owl-item.active').first().index();
                var end = sync2.find('.owl-item.active').last().index();
                if (current > end) sync2.data('owl.carousel').to(current, 100, true);
                if (current < start)sync2.data('owl.carousel').to(current - onscreen, 100, true);
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
        });
    },
};

(function($){
    upd.start();
})(jQuery);
