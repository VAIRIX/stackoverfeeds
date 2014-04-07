$(document).ready(function(){

    $('body').on('click', '.load-body.expander-arrow-small-hide', function(){
        if ($(this).hasClass('hide-body expander-arrow-small-show')){
            $(this).removeClass('hide-body expander-arrow-small-show');
            $(this).find('~ span').hide();
        }else{
            var span = $(this).find('~ span');
            if(span.html() == ''){
                var attr_id = $(this).parent('TD').attr('id').split('-');
                var id = attr_id[attr_id.length - 1]
                $.get('/stackoverfeeds/feed_summary', {entry_id: id}, function (data) {
                    span.html(data);
                });
            }
            $(this).addClass('hide-body expander-arrow-small-show');
            span.show();
        }
    });

});
