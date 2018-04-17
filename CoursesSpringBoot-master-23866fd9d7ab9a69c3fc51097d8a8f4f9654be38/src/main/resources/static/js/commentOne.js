/*comment.js*/
$(document).ready(function() {
    link(id,1)

})

// 获取链接中的参数
    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;
    }
    var id = GetQueryString('id');
    // alert(id)

function link(id,c_id) {
    $.ajax({
        url:'/comment/student/'+id +'/'+c_id,
        type: 'GET',
        dataType: 'json',
        contentType: "application/json; charset=utf-8",
        timeout: 5000,
        cache: false,
        beforeSend: LoadFunction,
        error: erryFunction,
        success: succyFunction,
    })

    function LoadFunction() {
        // console.log("加载中请稍后....")
    }

    function erryFunction() {
        alert("哇，貌似服务器失联了，请等待稍后重试...")
    }

    var pages = '';
    function succyFunction(data) {
        console.log(data)
        var _data = data.data.list
        $('.comment-show').html('')
        for (var i in _data) {
            // console.log(i.id)
            $('.comment-show').append('<div class="comment-show-con clearfix">' +
                // '<div class="comment-show-con-img pull-left"><img class="img-id-' + _data[i].id + '" src="" alt="" style="width:48px;height:48px;"></div>' +
                '<div class="comment-show-con-list pull-left clearfix">' +
                '<div class="pl-text clearfix">' +
                '<a href="#" class="comment-size-name pl-name">' + _data[i].author + ' :' + '</a>' +
                '<span class="my-pl-con pl-talk">&nbsp;' + _data[i].content + '</span>' +
                '</div>' +
                '<div class="date-dz">' +
                '<span class="date-dz-left pull-left comment-time pl-time">' + _data[i].updateTime + '</span>' +
                '<div class="date-dz-right pull-right comment-pl-block">' +
                '<a href="javascript:;" class="date-dz-pl hf-con-block pull-left pl-id" style="display:none">' + _data[i].id + '</a>' +
                '<a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>' +
                '<span class="pull-left date-dz-line">|</span>' +
                '<a href="javascript:;" class="pl-sum date-dz-pl hf-con-block pull-left pl-id-' + _data[i].id + '">' + _data[i].reply + '条回复</a>' +
                '<span class="pull-left date-dz-line">|</span>' +
                '<a href="javascript:;" index="' + _data[i].id + '" class="date-dz-z pull-left pull-id-' + _data[i].id + '"><i class="date-dz-z-click-red z-id-' + _data[i].id + '"></i>赞 (<i class="z-num like">' + _data[i].agreeCount + '</i>)</a>' +
                '</div>' +
                '</div>' +
                '<div class="hf-list-con"></div>' +
                '</div>' +
                '</div>')
            $(".img-id-" + _data[i].id).attr('src', _data[i].img)
            if (_data[i].isAgreed) {
                // console.log(0)
                $('.pull-right').find(".pull-id-" + _data[i].id).addClass('date-dz-z-click')
                // console.log(1)
                $('.date-dz-z').find('.z-id-' + _data[i].id).addClass('red');
            }
        }
        // console.log()
        getPages(data.data.pages);
        $('.fy .btn-id-'+c_id).addClass('active')
        // console.log(!data.data.hasNextPage)
        if (data.data.hasPreviousPage) {
            $('.fy .prev').attr('disabled', false)
            // alert(1111)
        } else {
            $('.fy .prev').attr('disabled', true)
        }

        if (data.data.hasNextPage) {
            $('.fy .next').attr('disabled', false)
            // alert(1111)
        } else {
            $('.fy .next').attr('disabled', true)
        }

        if (data.data.isLastPage) {
            $('.fy .last-pages').attr('disabled', true)
            // alert(1111)
        } else {
            $('.fy .last-pages').attr('disabled', false)
        }

        if (data.data.isFirstPage) {
            $('.fy .first-page').attr('disabled', true)
            // alert(1111)
        } else {
            $('.fy .first-page').attr('disabled', false)
        }
    }

    function getPages(t){
        $('.fy span').html(' ')
        for (var i = 1; i <= t; i++) {
            $(".fy span").append('<input class="btn  btn-default btn-id-' + i + '" style="margin:0 5px;" type="button" value="' + i + '">')
        }
    }
}