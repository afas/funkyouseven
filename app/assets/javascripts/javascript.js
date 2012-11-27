var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-31898771-1']);
_gaq.push(['_trackPageview']);

(function () {
    var ga = document.createElement('script');
    ga.type = 'text/javascript';
    ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(ga, s);
})();

(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s);
    js.id = id;
    js.src = "//connect.facebook.net/ru_RU/all.js#xfbml=1&appId=423133141046951";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

!function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (!d.getElementById(id)) {
        js = d.createElement(s);
        js.id = id;
        js.src = "//platform.twitter.com/widgets.js";
        fjs.parentNode.insertBefore(js, fjs);
    }
}(document, "script", "twitter-wjs");


$(document).ready(function () {
    if ($("#notice").length > 0) {
        setTimeout(function () {
            $("#notice").animate({top:-144}, 555, function () {
                $("#notice").remove();
            });
        }, 2000);
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
//        var params = {
//            changedEl:"select",
//            scrollArrows:false
//        }
//        cuSel(params);
        $("select").selectBox();
    }

    if ($(".product_previews li").length > 0) {
        $(".product_previews li div").click(function () {
            $("#current_image").attr("src", $(this).attr("image_url"));
        })
    }

    if ($(".slider_box").length > 0) {
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

function updateProductLook(look_id) {
    look = $("#product_look").is(':checked');

    if (look) {
        $(".for_look").show();
        $(".not_for_look").hide();
    } else {
        $(".for_look").hide();
        $(".not_for_look").show();
    }
}

function split(val) {
    return val.split(/,\s*/);
}

function extractLast(term) {
    return split(term).pop();
}

function processProductToLook(product_id, look_id) {
    yes = $("#" + product_id + "-" + look_id).is(':checked');
    $.get('/product_to_look/' + product_id + "/" + look_id + "/" + yes);
}

function setSex() {
    sex = $("#sex_id").val();
    if (sex == '') {
        sex = 'empty'
    }
    $.get('/products/sex/' + sex);
}

function setCareer() {
    career = $("#career_id").val();
    if (career == '') {
        career = 'empty'
    }
    $.get('/products/career/' + career);
}

function checkHref() {
    href = $("#add_product_button").attr("href");
    if (href == "#") {
        $("a.product_size").toggle("shake", {distance:8, times:1}, 300);
        return false;
    } else {
        $.get(href);
    }
}

function setMySize(product_id, product_size) {
    new_size = $("#size_" + product_id + "-" + product_size).val();
    product_count = $("#counter-" + product_id + "-" + product_size).val();

    $.get("/basket/update_size/" + product_count + "/" + product_id + "/" + new_size)
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

    if ($("#size_" + product_id + "-" + product_size).length > 0) {
        new_size = $("#size_" + product_id + "-" + product_size).val();
    } else {
        new_size = product_size
    }

    product_count = "";
    product_count = parseInt($("#counter-" + product_id + "-" + product_size).val());

    if ((keynum > 47 && keynum < 58 || keynum > 95 && keynum < 106) && product_count >= 0) {
        if (parseInt(product_count) == 0) {
            $("#" + product_id + "-" + product_size).toggle("shake", {distance:13, times:2}, 300, function () {
                $("#" + product_id + "-" + product_size).animate({marginLeft:-1000}, 800, function () {
                    $("#" + product_id + "-" + product_size).remove();
                });
            });

        }
        $.get("/basket/" + product_count + "/" + product_id + "/" + new_size);
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