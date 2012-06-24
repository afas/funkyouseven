$(document).ready(function () {

//    jQuery('.parallax-layer').parallax({
//        mouseport:jQuery("#parallax")
//    });

    if ( $(".cat_item form input[type=text]").length > 0 ) {
        $(".cat_item form input[type=text]").click(function() {
            $(this).select();
        });
    }

    if ($("select").length > 0) {
        var params = {
            changedEl:"select",
            scrollArrows:false
        }
        cuSel(params);
    }

    if ($(".product_previews li").length > 0) {
        $(".product_previews li div").click(function () {
            $("#current_image").attr("src", $(this).attr("image_url"));
        })
    }

    if ($(".slides").length > 0) {
        $('.slides').slides({
            preload:true,
            preloadImage:'images/loading.gif',
            play:5000,
            pause:2500,
            hoverPause:true,
            animationStart:function (current) {
                $('.caption').animate({
                    bottom:-35
                }, 100);
                if (window.console && console.log) {
                    // example return of current slide number
                    console.log('animationStart on slide: ', current);
                }
                ;
            },
            animationComplete:function (current) {
                $('.caption').animate({
                    bottom:0
                }, 200);
                if (window.console && console.log) {
                    // example return of current slide number
                    console.log('animationComplete on slide: ', current);
                }
                ;
            },
            slidesLoaded:function () {
                $('.caption').animate({
                    bottom:0
                }, 200);
            }
        });
    }
});

function onKeyUp(e, product_id, product_size) {
    var keynum
    if (window.event) // IE
    {
        keynum = e.keyCode
    }
    else if (e.which) // Netscape/Firefox/Opera
    {
        keynum = e.which
    }

    product_count = "";
    product_count = parseInt($("#counter-" + product_id + "-" + product_size).val());

    if ( (keynum > 47 && keynum < 58 || keynum > 95 && keynum < 106) && product_count >= 0) {
        if (parseInt(product_count) == 0) {
            $("#" + product_id + "-" + product_size).remove();
        }
        $.get("/basket/" + product_count + "/" + product_id + "/" + product_size);
    }
}

function setSize(){
    product_size = $("#product_size_id").val();
    link = $("#add_product_button").attr("link") + product_size;
    $("#add_product_button").attr("href", link);
}