$(document).ready(function () {

//    jQuery('.parallax-layer').parallax({
//        mouseport:jQuery("#parallax")
//    });

    if ($("#fullover").length > 0) {
        $("#fullover > a").click(function () {
            $("#fullover").hide();
        });
    }

    if ($(".size_unit").length > 0) {
        $(".size_unit input[type=text]").click(function () {
            $(this).select();
        });
    }

    if ($(".cat_item form input[type=text]").length > 0) {
        $(".cat_item form input[type=text]").click(function () {
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

function checkHref() {
    href = $("#add_product_button").attr("href");
    if (href == "#") {
//        $("#cuselFrame-product_size_id").toggle("shake", {distance:8}, 144);
        $("#cuselFrame-product_size_id .cuselText")
            .animate({color:'#ff0000'}, 330)
            .animate({color:'#000000'}, 330)
            .animate({color:'#ff0000'}, 330)
            .animate({color:'#000000'}, 330);

//        $("#cuselFrame-product_size_id .cuselText").addClass("attention");
//        setTimeout(function(){
//            $("#cuselFrame-product_size_id .cuselText").removeClass("attention");
//        }, 1000);
        return false;
    }
}

function setSize() {
    product_size = $("#product_size_id").val();
    if (product_size == "") {
        link = "#"
    } else {
        link = $("#add_product_button").attr("link") + product_size;
    }
    $("#add_product_button").attr("href", link);
}

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

    if ((keynum > 47 && keynum < 58 || keynum > 95 && keynum < 106) && product_count >= 0) {
        if (parseInt(product_count) == 0) {
            $("#" + product_id + "-" + product_size).remove();
        }
        $.get("/basket/" + product_count + "/" + product_id + "/" + product_size);
    }
}

function updateStuffImage(stuff_image_id, classname) {
    title = $("#" + classname + "_image_" + stuff_image_id + " input[type='text']").val();
    cover = $("#" + classname + "_image_" + stuff_image_id + " .upload_cover").is(':checked');
    preview = $("#" + classname + "_image_" + stuff_image_id + " .upload_preview").is(':checked');

    if (title == '') {
        title = 'empty'
    }

    $.get("/" + classname + "_images/update/" + stuff_image_id + "/" + cover + "/" + preview + "/" + title);
}

function onKeyUpSizeCount(e, product_id, size_code) {
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
    product_count = parseInt($("#size_to_product_count-" + product_id + "-" + size_code).val());

    if ((keynum > 47 && keynum < 58 || keynum > 95 && keynum < 106) && product_count >= 0) {
        $.get("/size_to_product_count/" + product_id + "/" + size_code + "/" + product_count);
    }
}