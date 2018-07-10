<div class="modal bp_question" tabindex="-1" role="dialog" id="bp_question">
  <div class="modal-dialog" role="document">
    <div class="vm_wrap">

      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 boot_wrap">
        <form action="#" method="POST" id="bp_question_form">
          <input type="hidden" name="action" value="bp_question" />
          <input type="hidden" name="cat"/>
          <p class="caption"></p>
          <p class="sub_caption">Что вы хотели узнать о ходе строительства?</p>
          <textarea name="message"></textarea>
        
          <div class="col-lg-6 col-lg-6 col-xs-12 col-xs-12 pn">
            <p class="form_label">Ваше имя</p>
            <input type="text" name="name" />
          </div>
          <div class="col-lg-6 col-lg-6 col-xs-12 col-xs-12 pn">
            <p class="form_label">Телефон или эл. почта</p>
            <input type="text" name="contact" />
          </div>
          
          <button type="button" class="order_btn">Отправить вопрос</button>
          <p class="response"></p>
        </form>
        <button type="button" class="close_visit" data-dismiss="modal"></button>
      </div>

      <div class="clear"></div>
    </div>
  </div>
</div>