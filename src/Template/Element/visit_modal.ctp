<div class="modal visit_modal" tabindex="-1" role="dialog" id="visit_modal">
  <div class="modal-dialog" role="document">
    <div class="vm_wrap">
      <div class="col-lg-5 col-md-5 hidden-sm hidden-xs pn">
        <div class="image"></div>
      </div>
      <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 boot_wrap">
        <form action="#" method="POST" id="visit_form">
          <input type="hidden" name="action" value="appointment" />
          <p class="caption">Записаться на просмотр</p>

          <p class="form_label">Ваше имя</p>
          <input type="text" name="name" />

          <p class="form_label">Ваш телефон или email</p>
          <input type="text" name="contact" />
          <div class="clear"></div>
          <button type="button" class="order_btn" onclick="ga('send', 'event', 'Кнопка', 'Отправить заявку');">Отправить заявку</button>
          <p class="response"></p>
        </form>
        <button type="button" class="close_visit" data-dismiss="modal"></button>
      </div>

      <div class="clear"></div>
    </div>
  </div>
</div>