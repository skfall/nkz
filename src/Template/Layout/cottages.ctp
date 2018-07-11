<!DOCTYPE html>
<html lang="ru">
<head>
    <!-- Google Tag Manager -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-NPVJTMK');</script>
    <!-- End Google Tag Manager -->
    
    <?= $this->Html->charset() ?>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no" />
    <title><?= $meta_title ?: "" ?></title>

    <!-- SITE INDEX -->
    <?php if (isset($site_config['index']) && $site_config['index'] == 1): ?>
        <meta name="robots" content="index, follow" />
    <?php else: ?>
        <meta name="robots" content="noindex, nofollow" />
    <?php endif ?>

    <meta name="description" content="<?= $meta_desc ?: "" ?>" />
    <meta name="keywords" content="<?= $meta_keys ?: "" ?>" />
    <meta name="author" content="Positive Business" />

    <link rel="shortcut icon" href="<?= RS."favicon.ico" ?>" type="image/x-icon" />


    <?= $this->fetch('meta') ?>
    <?= $this->fetch('css') ?>
    <?= $this->fetch('script') ?>

    <?= $this->Html->css('bootstrap.min') ?>
    <?= $this->Html->css('jquery-ui.min') ?>
    <?= $this->Html->css('owl.carousel.min') ?>
    <?= $this->Html->css('aos') ?>
    <?= $this->Html->css('animate') ?>
    <?= $this->Html->css('jquery.fancybox.min') ?>
    <?= $this->Html->css('cottages.min') ?>
    <?= $this->Html->css('fonts.min') ?>
    <?= $this->Html->css('ct_fonts.min') ?>


   <link rel="stylesheet" type="text/css" href="<?= RS.'css/new_th.css'; ?>">

   <!-- Global site tag (gtag.js) - Google Analytics -->
   <script async src="https://www.googletagmanager.com/gtag/js?id=UA-68794044-1"></script>
    <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'UA-68794044-1');
    </script>


  
    <?= (isset($site_config['afterHead']) && $site_config['afterHead'] ? $site_config['afterHead'] : ''); ?>
</head>
<body class="<?= $page; ?>">

    <!-- Google Tag Manager (noscript) -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NPVJTMK"
    height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
    
    <script type="text/javascript">
        var RS = '<?= RS ?>';
        var LANG = '<?= LANG ?>';
        var PAGE = '<?= $page; ?>';
        var MOBILE = '<?= $this->request->is('mobile') ? 1 : 0; ?>';

        var appct = {
            load_rd_ct: (th_id, self) => {
                var th_id = th_id || 0;
                $('.rd_th_layouts').addClass("op06");
                setTimeout(function(){
                    $.post(RS + "ajax/", {action: "load_rd_ct_new", id: th_id}, (data, status) => {
                        if (status == "success") {
                            if (data.status == "success") {
                                $('.layouts_switcher li').removeClass('active');
                                var layouts = data.layouts;
                                $('.rd_th_layouts_holder').html(layouts);
                                setTimeout(function(){
                                    appct.ct_layout_gal();
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
            ct_layout_gal: (selector1, selector2, params) => {
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

        };


    </script>
    

    
    
    <div class="wrapper" id="wrapper">
        <?= $this->element('header'); ?>
        <?= $this->fetch('content') ?>
        <div class="clear"></div>
        <div id="go_up" class="animated2"></div>
        <?= $this->element('footer'); ?>
    </div>



    <?= $this->element('visit_modal'); ?>
   

    <div class="dark_overlay animated2"></div>


    
    
  
    
   
    <?= $this->Html->script('jquery-2.2.4.min'); ?>
    <?= $this->Html->script('jquery-ui.min'); ?>
    <?= $this->Html->script('bootstrap.min'); ?>
    <?= $this->Html->script('jquery.fancybox.min'); ?>
    <?= $this->Html->script('jquery.maskedinput.min'); ?>
    <?= $this->Html->script('owl.carousel.min'); ?>
    <?= $this->Html->script('aos'); ?>
    <?= $this->Html->script('parallax.min'); ?>
    <?= $this->Html->script('core.min'); ?>
    <script src="<?= RS.'js/imagesLoaded.js'; ?>"></script>
    <script type="text/javascript">
            $('body').imagesLoaded( function() {
                appct.ct_layout_gal();
            });
    </script>
    <?php
        if ($page == 'townhouses') {
            echo $this->Html->script('simplebar.min');
        }
    ?>

    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCXyEPsmtB3A9txZSYdV2j7d8TeAj82iWQ">
        </script>

    <?= (isset($site_config['afterBody']) && $site_config['afterBody'] ? $site_config['afterBody'] : ''); ?>

    <?php if (!$this->request->is('mobile')): ?>
        <script type="text/javascript" charset="utf-8" src="https://callmenow.com.ua/client_site.js?delay=60&btn_color=grass_green&u_id=488&x_gr=left&y_gr=bottom"></script>
    <?php endif ?>

     <!-- BEGIN JIVOSITE CODE {literal} -->
    <script type='text/javascript'>
    (function(){ var widget_id = 'ItSs7PO0fU';
    var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = '//code.jivosite.com/script/widget/'+widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);})();</script>
    <!-- {/literal} END JIVOSITE CODE -->


    <!-- этот код вставляется перед закрывающим тегом </BODY> -->
    <script type="text/javascript" charset="utf-8"
    src="//istat24.com.ua/js/replace.js"></script>
    <script type="text/javascript">replaceIstatDynamic(1,748);</script>
    <!-- конец кода который вставляется перед закрывающим тегом </BODY> -->
</body>
</html>
