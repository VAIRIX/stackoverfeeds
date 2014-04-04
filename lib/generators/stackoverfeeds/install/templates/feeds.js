$(document).ready(function(){

    $('body').on('click', '.load-body.expander-arrow-small-hide', function(){
        $(this).find('~ span').slideDown();
        $(this).addClass('hide-body expander-arrow-small-show');
    });

    $('body').on('click', '.hide-body.expander-arrow-small-show', function(){
        $(this).find('~ span').slideUp();
        $(this).removeClass('hide-body expander-arrow-small-show');
    });

});
