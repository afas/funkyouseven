var page_container,
    menu, current_width,
    current_height, width, height,
    current_cover_param = null;

$(document).ready(function () {

    if ($('#fix-here').length > 0) {
        right = (window.innerWidth - 994) / 2;
        var fixedElement = $('#fix-here').offset();
        scrolled = $(window).scroll(function () {
            var winScrolled = $(this).scrollTop();
            if (winScrolled > fixedElement.top - 55) {
                $('#fix-here').css({'position':'fixed', 'top':'10px', 'right':right + 'px'})
            }
            else {
                $('#fix-here').css({'position':'static'})
            }
        });
    }

    if ($('.range_slider').length > 0) {
        $('.range_slider').each(function () {
            id = $(this).attr("id");
            min = $(this).attr("min");
            max = $(this).attr("max");
            initRangeSlider(id, min, max, 0);
        });
    }

    if ($(".draggable").length > 0) {
        $(".magazine_cover .draggable").mousedown(function () {
            class_name = $(this).attr("class").split(' ')[0];
            attr_name = class_name.split('_')[2];

            if (attr_name != current_cover_param) {
                current_cover_param = attr_name;
                initWigetData();
            }
        });

        $(".instrumental-dock").draggable({});
    }

    if ($('#full_list').length == 1) {
        page_container = $('#full_list');
        page_container.imagesLoaded(function () {
            page_container.masonry({
                itemSelector:'.list_preview',
                isAnimated:true,
                isFitWidth:true,
                columnWidth:300,
                gutterWidth:40
            });
        });

        page_container.infinitescroll({
                navSelector:'#page-nav',
                nextSelector:'#page-nav a',
                itemSelector:'.list_preview',
                loading:{
                    img:'/assets/preloader-34.png',
                    msgText:onLoadPhrase,
                    finishedMsg:onPaginateFinishPhrase
                }
            },
            function (newElements) {
                var $newElems = $(newElements).css({ opacity:0 });
                $newElems.imagesLoaded(function () {
                    $newElems.animate({ opacity:1 });
                    page_container.masonry('appended', $newElems, true);
                });
            }
        );
    }


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

    if ($(".menu-top").length > 0) {
        menu = Meny.create({
            menuElement:document.querySelector('.menu-top'),
            contentsElement:document.querySelector('.page-content'),
            position:Meny.getQuery().p || 'left',
            threshold:21,
            width:431,
            overlap:0,
            transitionDuration:'0.5s',
            transitionEasing:'ease'
        });
    }

    if ($("#notice").length > 0) {
        openModal("#default-popup");
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

    if ($("input[type=checkbox]").length > 0) {
        $("input[type=checkbox]").iphoneStyle({
            onChange:function (e) {
                eval($(e).parent().children("input[type=checkbox]").attr("onchange"));
            }
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


function refreshWigetData() {
    param_style = "";

    color = $(".magazine_cover_" + current_cover_param).css("color");
    param_style += "color:" + color + "; ";

    left_px = $(".magazine_cover_" + current_cover_param).css("left");
    param_style += "left:" + left_px + "; ";

    top_px = $(".magazine_cover_" + current_cover_param).css("top");
    param_style += "top:" + top_px + "; ";

    font_size = parseInt($(".magazine_cover_" + current_cover_param).css("font-size"));
    param_style += "font-size:" + font_size + "px; ";

    angle = getRotationDegrees();
    param_style += "transform:rotate(" + angle + "deg);";
    param_style += "-webkit-transform:rotate(" + angle + "deg);";
    param_style += "-moz-transform:rotate(" + angle + "deg);";
    param_style += "-ms-transform:rotate(" + angle + "deg);";
    param_style += "-o-transform:rotate(" + angle + "deg);";
    param_style += "filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=" + angle + "); ";

    $("#cover_magazine_" + current_cover_param + "_html_data").attr("value", param_style);
}

function initWigetData() {
    console.log("Init Data");
    $(".magazine_cover .draggable").draggable({
        stop:function (event, ui) {
            refreshWigetData();
        }
    });

    color = $(".magazine_cover_" + current_cover_param).css("color");
    if (color) {
        initColorpicker(color)
    }

    font_size = parseInt($(".magazine_cover_" + current_cover_param).css("font-size"));
    if (font_size) {
        min = $("#font_size").attr("min");
        max = $("#font_size").attr("max");
        initRangeSlider("font_size", min, max, font_size);
    }

    angle = getRotationDegrees();
    min = $("#text_angle").attr("min");
    max = $("#text_angle").attr("max");
    initRangeSlider("text_angle", min, max, angle);
}

function initRangeSlider(id, min, max) {
    $("#" + id).slider({
        min:min,
        max:max,
        step:1,
        value:current,
        slide:function (event, ui) {
            update_slide_data(id, ui.value);
        }
    });
}

function initColorpicker(color) {
    color = rgb2hex(color);

    if ($.jPicker.List.length > 0) {
        $.jPicker.List.length = 0;
        $('span.jPicker').remove();
    }

    $('#font_color').val(color);
    $('#font_color').jPicker({
        window:{
            expandable:true
//            , alphaSupport:true
        },
        images:{
            clientPath:'/assets/jpicker/'
        },
        localization:{
            text:{
                title:'Выберите цвет',
                newColor:'новый',
                currentColor:'текущий',
                ok:'ОК',
                cancel:'Отмена'
            }
        }
    }, function (color, context) {
        update_slide_data("font_color", "'#" + color.val('hex') + "'")
    });
}

function update_slide_data(id, value) {
    eval("update_" + id + "(" + value + ");");
    refreshWigetData();
}

function update_font_color(color) {
    $(".magazine_cover_" + current_cover_param).css("color", color);
}

function update_font_size(value) {
    $(".magazine_cover_" + current_cover_param).css("font-size", value);
}

function update_text_angle(angle) {
    $(".magazine_cover_" + current_cover_param).css('transform', 'rotate(' + angle + 'deg)');
    $(".magazine_cover_" + current_cover_param).css('-webkit-transform', 'rotate(' + angle + 'deg)');
    $(".magazine_cover_" + current_cover_param).css('-moz-transform', 'rotate(' + angle + 'deg)');
    $(".magazine_cover_" + current_cover_param).css('-o-transform', 'rotate(' + angle + 'deg)');
    $(".magazine_cover_" + current_cover_param).css('-ms-transform', 'rotate(' + angle + 'deg)');
    $(".magazine_cover_" + current_cover_param).css('filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation=' + angle + ')');
}

function update_font_data() {
    font_data = $("#font_data").val();
    font_face_name = "coverMagazineTitle" + parseInt(100 * Math.random());
    $("head").prepend(
        "<style type=\"text/css\">" +
            "@font-face {" +
            "font-family: " + font_face_name + ";" +
            "font-style: normal;" +
            "font-weight: 400;" +
            "src: url(\"" + font_data + "\");" +
            "}" +
            "</style>");

    $(".magazine_cover_title").css("font-family", font_face_name);
    $("#cover_magazine_" + current_cover_param + "_font_data").val(font_data);
}

function update_title_coords() {
    product_title_x = parseInt($("#product_cover_title").css("left"));
    product_title_y = parseInt($("#product_cover_title").css("top"));

    $("#product_title_x").val(product_title_x);
    $("#product_title_y").val(product_title_y);
}

function update_title_preview() {
    title = $("#product_title").val();
    color = $("#product_title_color").val();
    price = parseInt($("#product_price").val());

    title = title.replace("{", "<span style='color:" + color + ";'>");
    title = title.replace("}", "</span>");

    $("#product_cover_title").html("<a href='#'>" + title + "<p>" + price + " p.</p></a>");
}

function initCrop() {
    $("#crop_image").Jcrop({
        boxWidth:800,
        onChange:update_crop,
        onSelect:update_crop,
        aspectRatio:width / height
    });
}

function openModal(id) {
    Avgrund.show(id);
}

function closeModal() {
    Avgrund.hide();
}

function cursorWait() {
    $('body').css('cursor', 'wait');
}

function cursorAuto() {
    $('body').css('cursor', 'auto');
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

function rgb2hex(rgb) {
    if (rgb.search("rgb") == -1) {
        return rgb;
    } else {
        rgb = rgb.match(/^rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(\d+))?\)$/);
        function hex(x) {
            return ("0" + parseInt(x).toString(16)).slice(-2);
        }

        return hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
    }
}

function getRotationDegrees() {
    var matrix = 'none';
    matrix = $(".magazine_cover_" + current_cover_param).css("-webkit-transform") ||
        $(".magazine_cover_" + current_cover_param).css("-moz-transform") ||
        $(".magazine_cover_" + current_cover_param).css("-ms-transform") ||
        $(".magazine_cover_" + current_cover_param).css("-o-transform") ||
        $(".magazine_cover_" + current_cover_param).css("transform");

    if (matrix !== 'none') {
        var values = matrix.split('(')[1].split(')')[0].split(',');
        var a = values[0];
        var b = values[1];
        var angle = Math.round(Math.atan2(b, a) * (180 / Math.PI));

        if (angle < 0) {
            angle += 360;
        }
    } else {
        var angle = 0;
    }

    return angle;
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
        $("#cuselFrame-product_size_id").effect("shake", {distance:13, times:2}, 1597);
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

function xy(x) {
    o = document.getElementById(x);
    var l = o.offsetLeft;
    var t = o.offsetTop;
    while (o = o.offsetParent)
        l += o.offsetLeft;
    o = document.getElementById(x);
    while (o = o.offsetParent)
        t += o.offsetTop;
    return [l, t];
}

function goUrl(href) {
    window.location = href;
}