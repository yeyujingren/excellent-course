/*commentSix.js*/
$(document).ready(function() {
    // 获取链接中的参数
    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;
    }
    var id = GetQueryString('id');
    // alert(id)
    // 点击页码，上下页加载评论
    // $('.fy .btn-id-1').addClass('active')
    // console.log($('.fy>span').find('.active').val())
    $('.fy').on('click', 'input', function() {
        var c_id = $(this).val()
        // alert(c_id)
        $('.fy input').removeClass('active')
        // $(this).addClass('active')
        link(id,c_id)
        // console.log(link(id,c_id))

    })

    $('.fy .next').on('click', function() {
        // alert('aha')
        var c_id = parseInt($('.fy .active').val()) + 1
        console.log(c_id)
        // alert(id)
        $('.fy input').removeClass('active')
        $('.fy .btn-id-' + id).addClass('active')
        link(id,c_id)

    })

    $('.fy .prev').on('click', function() {
        // alert('aha')
        var c_id = parseInt($('.fy .active').val()) - 1
        // alert(id)
        $('.fy input').removeClass('active')
        $('.fy .btn-id-' + id).addClass('active')
        link(id,c_id)

    })

    // 加载第一页
    $('.fy .first-page').on('click', function() {
        // alert('aha')
        var c_id = 1
        // alert(id)
        $('.fy input').removeClass('active')
        $('.fy .btn-id-' + id).addClass('active')
        link(id,c_id)
    })


    // 点击加载最后一页
    $('.last-pages').on('click', function() {
        // alert('aha')
        var c_id = parseInt($('.fy span input:last-child ').val())
        // alert(id)
        $('.fy input').removeClass('active')
        $('.fy .btn-id-' + id).addClass('active')
        link(id,c_id)

    })
})