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
    <?php if (isset($config['index']) && $config['index'] == 1): ?>
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

    <?php 
    	/* 
    		<?= $this->Html->css('jquery.fancybox.min') ?>
    		<?= $this->Html->css('general.min') ?> 
    		<?= $this->Html->css('fonts.min') ?>
    	*/
    ?>
    <link rel="stylesheet" type="text/css" href="<?= RS.'css/jquery.fancybox.min.css'; ?>">


    <?php if ($page == "new_th"): ?>
        <link rel="stylesheet" type="text/css" href="<?= RS.'css/new_th.css'; ?>">
        <link rel="stylesheet" type="text/css" href="<?= RS.'css/fonts_th.css'; ?>">
    <?php else: ?>
        <link rel="stylesheet" type="text/css" href="<?= RS.'css/general.min.css'; ?>">
    <?php endif ?>

    
    <link rel="stylesheet" type="text/css" href="<?= RS.'css/fonts.min.css'; ?>">

    <?php if ($page == "newhome"): ?>
        <link rel="stylesheet" type="text/css" href="<?= RS.'css/newhome.css'; ?>">
    <?php endif ?>    
    
    <link rel="stylesheet" type="text/css" href="<?= RS.'css/upd.css'; ?>">
    

    <?php
        if ($page == 'townhouses') {
            echo $this->Html->css('simplebar.min');
        }
    ?>
    <?= (isset($config['afterHead']) && $config['afterHead'] ? $config['afterHead'] : ''); ?>
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
    </script>

    
    
    <div class="wrapper" id="wrapper">
        <?php
            switch ($page) {
                case 'townhouses':
                    //echo $this->element('header_min');
                    echo $this->element('header');
                    break;
                default:
                    echo $this->element('header');
                    break;
            }
        ?>
        <?= $this->fetch('content') ?>
        <div class="clear"></div>
        <div id="go_up" class="animated2"></div>
        <?= $this->element('footer'); ?>
    </div>

    <?= $this->element('visit_modal'); ?>
    <?= $this->element('nrc'); ?>
    <?= $this->element('map_modal'); ?>

    <div class="dark_overlay animated2"></div>


    
    
  
    
   
    <?= $this->Html->script('jquery-2.2.4.min'); ?>
    <?= $this->Html->script('jquery-ui.min'); ?>
    <?= $this->Html->script('bootstrap.min'); ?>
    <script type="text/javascript" src="<?= RS.'js/jquery.fancybox.min.js'; ?>"></script>

    <?= $this->Html->script('jquery.maskedinput.min'); ?>
    <?= $this->Html->script('owl.carousel.min'); ?>
    <?= $this->Html->script('aos'); ?>
    <?= $this->Html->script('parallax.min'); ?>
    <?php 
    	/* 
    		<?= $this->Html->script('jquery.fancybox.min'); ?>
    		<?= $this->Html->script('core.min'); ?> 
    	*/
    ?>

    <script src="<?= RS.'js/imagesLoaded.js'; ?>"></script>
    <?php if ($page == "new_th"): ?>
        <script type="text/javascript" src="<?= RS.'js/new_th.js'; ?>"></script>            
    <?php endif ?>

    <?php if ($page == "newhome"): ?>
        <script type="text/javascript" src="<?= RS.'js/newhome.js'; ?>"></script>     
    <?php endif ?>    
    
    <script type="text/javascript" src="<?= RS.'js/core.min.js'; ?>"></script>
    
    <?php
        if ($page == 'townhouses') {
            echo $this->Html->script('simplebar');
        }
    ?>


    <script type="text/javascript" src="<?= RS.'js/upd.js'; ?>"></script>

    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCXyEPsmtB3A9txZSYdV2j7d8TeAj82iWQ">
        </script>
    <?= (isset($config['afterBody']) && $config['afterBody'] ? $config['afterBody'] : ''); ?>


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
