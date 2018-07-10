<div class="modal nrc" tabindex="-1" role="dialog" id="nrc">
  <div class="modal-dialog" role="document">
    <div class="nrc_wrap">
        <button type="button" class="close_visit" data-dismiss="modal"></button>
        <div class="col-xs-12">
            <div class="caption">Заказать звонок</div>
            <form action="#" method="POST" id="recall_form_modal">
                <input type="hidden" name="action" value="recall">
                <input type="text" name="phone" class="mask">
                <button type="button" class="submit" onclick="upd.recall();">Перезвоните мне</button>
                <p class="response"></p>
            </form>
        </div>
        <div class="clear"></div>
    </div>
  </div>
</div>