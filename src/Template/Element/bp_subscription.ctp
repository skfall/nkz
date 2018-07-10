<div class="modal bp_subscription" tabindex="-1" role="dialog" id="bp_subscription">
  <div class="modal-dialog" role="document">
    <div class="vm_wrap">

      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 boot_wrap">
        <form action="#" method="POST" id="bp_subscription_form">
          <input type="hidden" name="action" value="bp_subscription" />
          <input type="hidden" name="cat"/>
          <p class="caption">Рады сообщать о ходе строительства</p>
          <p class="sub_caption">Выберите дом</p>
          <?php if ($all_cats): ?>
            <?php foreach ($all_cats as $key => $ci): ?>
              <label class="bp_cats_cbx">
                <span></span>
                <input type="checkbox" class="dn" name="cat_name[]" value="<?= $ci->name; ?>" />
                <?= $ci->name; ?>
              </label>
            <?php endforeach ?>
          <?php endif ?>

          <hr />
          <div class="clear"></div>


          <div class="clear"></div>
          <div class="col-lg-12 col-lg-12 col-xs-12 col-xs-12 pn">
            <p class="delivery">Как желаете получать</p>
            <input type="text" name="email" placeholder="email" />
            <input type="text" name="phone"  class="mask" placeholder="+380" />
          </div>
          <div class="clear"></div>
          
          
          <button type="button" class="order_btn">Следить за строительством</button>
          <p class="response"></p>
        </form>
        <button type="button" class="close_visit" data-dismiss="modal"></button>
      </div>

      <div class="clear"></div>
    </div>
  </div>
</div>