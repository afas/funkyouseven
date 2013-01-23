$(document).ready(function () {

    if ($(".markdown_field").length > 0) {
        mySettings = {
            previewParserPath:'/markdown/preview',
            onShiftEnter:{keepDefault:false, replaceWith:'<br />\n'},
            onCtrlEnter:{keepDefault:false, openWith:'\n<p>', closeWith:'</p>\n'},
            onTab:{keepDefault:false, openWith:' '},
            markupSet:[
                {name:'Paragraph', openWith:'<p(!( class="[![Class]!]")!)>', closeWith:'</p>' },
                {name:'Heading 3', key:'3', openWith:'<h3(!( class="[![Class]!]")!)>', closeWith:'</h3>', placeHolder:'Your title here...' },
                {separator:'---------------' },
                {name:'Bold', key:'B', openWith:'(!(<strong>|!|<b>)!)', closeWith:'(!(</strong>|!|</b>)!)' },
                {name:'Italic', key:'I', openWith:'(!(<em>|!|<i>)!)', closeWith:'(!(</em>|!|</i>)!)' },
                {separator:'---------------' },
                {name:'Ul', openWith:'<ul>\n', closeWith:'</ul>\n' },
                {name:'Ol', openWith:'<ol>\n', closeWith:'</ol>\n' },
                {name:'Li', openWith:'<li>', closeWith:'</li>' },
                {separator:'---------------' },
                {name:'Quotes', openWith:'<q>\n', closeWith:'</q>\n'},
                {name:'Link', key:'L', openWith:'<a href="[![Link:!:http://]!]"(!( title="[![Title]!]")!)>', closeWith:'</a>', placeHolder:'Your text to link...' },
                {name:'Picture', key:'P', replaceWith:'<img src="[![Source:!:http://]!]" alt="[![Alternative text]!]" />' },
                {separator:'---------------' },
                {name:'Clean', className:'clean', replaceWith:function (markitup) {
                    return markitup.selection.replace(/<(.*?)>/g, "")
                } },
                {name:'Preview', className:'preview', call:'preview' }
            ]
        }
        $("textarea.markdown_field").markItUp(mySettings);
    }

    if ($("#notice").length > 0) {
        setTimeout(function () {
            $("#notice").animate({top:-144}, 555, function () {
                $("#notice").remove();
            });
        }, 2000);
    }

    if ($(".menu-top").length > 0) {
        menu = Meny.create({
            menuElement:document.querySelector('.menu-top'),
            contentsElement:document.querySelector('.page-content'),
            position:Meny.getQuery().p || 'left',
            threshold:13,
            width:431,
//            position:POSITION_L,
//            threshold:40000,
            overlap:34,
            transitionDuration:'0.5s',
            transitionEasing:'ease'
        });
    }

    if ($("#jms-slideshow").length > 0) {
        var jmpressOpts = {
            animation:{ transitionDuration:'0.8s' }
        };

        $("#jms-slideshow").jmslideshow($.extend(true, { jmpressOpts:jmpressOpts }, {
            autoplay:true,
            height:422,
            width:630,
            arrows:false,
            interval:'4000'
        }));
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
});

//var _gaq = _gaq || [];
//_gaq.push(['_setAccount', 'UA-31898771-1']);
//_gaq.push(['_trackPageview']);

//(function () {
//    var ga = document.createElement('script');
//    ga.type = 'text/javascript';
//    ga.async = true;
//    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
//    var s = document.getElementsByTagName('script')[0];
//    s.parentNode.insertBefore(ga, s);
//})();

//(function (d, s, id) {
//    var js, fjs = d.getElementsByTagName(s)[0];
//    if (d.getElementById(id)) return;
//    js = d.createElement(s);
//    js.id = id;
//    js.src = "//connect.facebook.net/ru_RU/all.js#xfbml=1&appId=423133141046951";
//    fjs.parentNode.insertBefore(js, fjs);
//}(document, 'script', 'facebook-jssdk'));

//!function (d, s, id) {
//    var js, fjs = d.getElementsByTagName(s)[0];
//    if (!d.getElementById(id)) {
//        js = d.createElement(s);
//        js.id = id;
//        js.src = "//platform.twitter.com/widgets.js";
//        fjs.parentNode.insertBefore(js, fjs);
//    }
//}(document, "script", "twitter-wjs");

//    $(".menu-top").addClass();
//    menu.stop();
//    menu.close();
//    menu.undelegate();

//    Avgrund.show("#default-popup");

var menu, croppable_image_id, current_width, current_height, width, height, original_width, original_height;

function initCrop() {
//    croppable_image_id = id;
//    crop_content = $("#crop_content").remove();
//    crop_content.appendTo('#default-popup');

//    current_width = eval("original_width");
//    current_height = eval("original_height");


    $("#crop_image").Jcrop({
        onChange:update_crop,
        onSelect:update_crop,
        setSelect:[Math.floor(0.5 * (current_width - w_select)), Math.floor(0.5 * (current_height - h_select)), w_select, h_select],
//        minSize:[width, height],
        aspectRatio:width / height
    });
}

function closeDialog() {
    Avgrund.hide();
}

function update_crop(coords) {
    var rx = width / coords.w;
    var ry = height / coords.h;

    $('#preview').css({
        width:Math.round(rx * current_width) + 'px',
        height:Math.round(ry * current_height) + 'px',
        marginLeft:'-' + Math.round(rx * coords.x) + 'px',
        marginTop:'-' + Math.round(ry * coords.y) + 'px'
    });

    $("#crop_x").val(Math.round(coords.x));
    $("#crop_y").val(Math.round(coords.y));
    $("#crop_w").val(Math.round(coords.w));
    $("#crop_h").val(Math.round(coords.h));
}

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

var shop = ["wear", "gear", "equipment"];

function setSex() {
    if ($.inArray(window.location.pathname.split("/").pop(), shop) < 0) {
        section = 'brands'
    } else {
        section = 'shop'
    }

    sex = $("#sex_id").val();
    if (sex == '') {
        sex = 'empty'
    }
    $.get('/products/section/' + section + '/sex/' + sex);
}

function setCareer() {
    if ($.inArray(window.location.pathname.split("/").pop(), shop) < 0) {
        section = 'brands'
    } else {
        section = 'shop'
    }
    career = $("#career_id").val();
    if (career == '') {
        career = 'empty'
    }
    $.get('/products/section/' + section + '/career/' + career);
}

function checkHref() {
    href = $("#add_product_button").attr("href");
    if (href == "#") {
        $("#cuselFrame-product_size_id").toggle("shake", {distance:34, times:2}, 300);
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