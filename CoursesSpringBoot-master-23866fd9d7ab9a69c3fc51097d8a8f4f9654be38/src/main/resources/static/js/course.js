$(document).ready(function () {
    // 获取链接中的参数
    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;
    }
    var id = GetQueryString('id');

    // 获取侧栏课程组信息
    $.ajax({
        url:'/getHomepageInfo',
        timeout:5000,
        type:'GET',
        dataType:'json',
        async:false,
        contentType: "application/json",
        error: function () {console.log("error!")},
        success: funSucc
    })

    function funSucc (data) {
        if(data.success){
            // 获取课程组信息和课程组课程
            for (var i in data.data) {
                $('.subNavBox').prepend('<div class="subNav"><i class="glyphicon glyphicon-chevron-down"></i>&nbsp;&nbsp;&nbsp;' + data.data[i].courseGroup.name + '</div><ul class="navContent ul-' + i + '"></ul> ');
                // var a = i
                for (var y in data.data[i].ordinaryCourse) {
                    // console.log(i)
                    $('.subNavBox').find('.ul-' + i).append('<li><a href="/course?id=' + data.data[i].ordinaryCourse[y].course.id + '">' + data.data[i].ordinaryCourse[y].course.name + '</a></li>');
                }
                for (var x in data.data[i].keyCourses) {
                    // console.log(i)
                    $('.subNavBox').find('.ul-' + i).append('<li><a href="/course?id=' + data.data[i].keyCourses[x].course.id + '">' + data.data[i].keyCourses[x].course.name + '</a></li>');
                }
            }


            $('.subNavBox').prepend('<div style="width:100%;height:50px;line-height: 50px;text-align: center;font-size: 13px;"><i class="glyphicon glyphicon-home"></i>&nbsp;&nbsp;&nbsp;核心课程</div>')
        }else{
            alert(data.message)
        }
    }


    // 获取课程详情
    $.ajax({
        url:'/getCourseDetail',
        // url:'https://easy-mock.com/mock/5a1bc24a9144e669fc6e7744/course/courses',
        type: 'POST',
        timeout: 5000,
        dataType: 'json',
        async:false,
        data: JSON.stringify({
            id: id
        }),
        contentType: "application/json; charset=utf-8",
        success: functionSuccy,
        error: function() {
            console.log('获取课程数据失败！')
        }
    })
    function functionSuccy (data) {
        console.log(data)
        if(data.success){
            $('.group .c-title').html(data.data.course.name);
            $('.group .c-pic img').attr('src',data.data.picture.url)
            $('.c-type .span-one').html('学时：'+data.data.course.hours+'小时')
            $('.c-type .span-two').html('课程类型：'+data.data.course.type)
            $('.c-detail .c-infor').prepend(data.data.course.introduction)
            if(data.data.courseinfo.date != null){
                $('.c-text ul').prepend('<li style="width:110px;height:180px;float:left;list-style:none;margin-left:25px;"><a href="' + data.data.courseinfo.date.viewUrl + '"><div style="width:110px;height:150px"><img src=' + data.data.courseinfo.date.cover + '" width="100%"height="100%" alt=""></div><center>' + data.data.courseinfo.date.description + '</center></a></li>');
            }
            if(data.data.courseinfo.guide != null){
                $('.c-text ul').prepend('<li style="width:110px;height:180px;float:left;list-style:none;margin-left:25px;"><a href="' + data.data.courseinfo.guide.viewUrl + '"><div style="width:110px;height:150px"><img src=' + data.data.courseinfo.guide.cover + '" width="100%"height="100%" alt=""></div><center>' + data.data.courseinfo.guide.description + '</center></a></li>');
            }
            if(data.data.courseinfo.outline != null){
                $('.c-text ul').prepend('<li style="width:110px;height:180px;float:left;list-style:none;margin-left:25px;"><a href="' + data.data.courseinfo.outline.viewUrl + '"><div style="width:110px;height:150px"><img src=' + data.data.courseinfo.outline.cover + '" width="100%"height="100%" alt=""></div><center>' + data.data.courseinfo.outline.description + '</center></a></li>');
            }
            if(data.data.courseinfo.standard != null){
                $('.c-text ul').prepend('<li style="width:110px;height:180px;float:left;list-style:none;margin-left:25px;"><a href="' + data.data.courseinfo.standard.viewUrl + '"><div style="width:110px;height:150px"><img src=' + data.data.courseinfo.standard.cover + '" width="100%"height="100%" alt=""></div><center>' + data.data.courseinfo.standard.description + '</center></a></li>');
            }
            
            // 加载知识点
            for(var i in data.data.knowledgePoints){
                $('#c-points').append('<li data-toggle="modal" data-target="#myModal" index=\'' + data.data.knowledgePoints[i].id + '\'><a href="javascript:void(0);" title="">' + data.data.knowledgePoints[i].content + '</a></li>');
            }
            $('#c-points').append("<div class='clear'></div>")
            // 加载文件
            // 加载章节
            for (var i in data.data.chapters) {
                $('.subNavBoxTwo').append('<div class="subNav">' + data.data.chapters[i].chapter.number + ':' + data.data.chapters[i].chapter.name + '</div><ul class="navContent ul-' + i + '"></ul> ');
                // var a = i
                for (var x in data.data.chapters[i].units) {
                    // console.log(i)
                    $('.subNavBoxTwo').find('.ul-' + i).append('<li><a href="single.html?id=' + data.data.chapters[i].units[x].id + '">' + data.data.chapters[i].units[x].number + ':' + data.data.chapters[i].units[x].name + '</a></li>');
                }
            }
            for(var i in data.data.teacherDetail){

                $('.r-list').append('<div class="tea-img img-' + i + '"></div>');
                $('.r-list').append('<div class="teachers tea-' + i + '"></div>');
            }
            for(var i in data.data.teacherDetail){
                var url;
                var picture=data.data.teacherDetail[i].picture;
                if(picture== null){
                    url=''
                }else{
                    url = picture.url
                }
                $('.r-list').find('.img-' + i).append('<img width="100%" height="100%" src="' + url + '"/>');
                $('.r-list').find('.tea-' + i).html(data.data.teacherDetail[i].teacher.name + ':' + data.data.teacherDetail[i].teacher.position + ',' + data.data.teacherDetail[i].teacher.personIntroduction);
                // console.log(data.data.teacherDetail[i].teacher.name)
            }
            // $('.r-list .tea-img').append(`<img width="100%" height="100%" src="${data.data.teacherDetail.picture.url}"/>`)
            // $('.r-list .teachers').html(data.data.teacherDetail.teacher.name+':'+data.data.teacherDetail.teacher.position+','+data.data.teacherDetail.teacher.personIntroduction)
            // 获取课程框的长度并对教师介绍框进行赋值
            var he = $('.group').height()
            $('.r-list').height(he);
        }else{
            alert(data.message)
        }
    }

    // 获取知识点详情
    $('#c-points li').on('click',function () {
        var point = $(this).attr('index')
        // alert(1)
        // alert(point)
        $.ajax({
          url:'/getUnitsByKnowledgePoint',
          timeout:5000,
          type:'POST',
          dataType:'json',
          async:false,
          data:JSON.stringify(
              {
                  id:point
              }
          ),
          contentType: "application/json",
          error: function () {
            $('#myModal iframe').css('display','none')
            $('#myModal .modal-body div').css('display','block')
            $('#myModal .modal-body div').html('<center>获取失败</center>')
          },
          success: successFun
        })
        function successFun (data){
          if(data.success){
            $('#myModal iframe').css('display','none')
            $('#myModal .modal-body div').css('display','block')
              $('#myModal .modal-body div').html(' ')
            for(var i in data.data){
                $('#myModal .modal-body div').append('<li style="list-style:none;margin-left:20px;margin-top:20px;font-size:16px;"><a href="single.html?id=' + data.data[i].unit.id + '">' + data.data[i].course.name + '&nbsp;&nbsp;' + i.chapter.number + ' &nbsp;&nbsp; ' + i.unit.number + ' &nbsp;&nbsp; ' + i.unit.name + ' </a></li>');
            }
          }else{
            $('#myModal iframe').css('display','none')
            $('#myModal .modal-body div').css('display','block')
            $('#myModal .modal-body div').html('<center>'+data.message+'</center>')
          }
        }
      })






    // 侧栏下拉控制
    $('.subNavBox div:first').addClass('active')
    $('.subNavBox ul:first').css('display','block')
    $('.subNavBox').append('<div class="copyright"><p>Copyright © 2018.合肥工业大学管理学院 版权所有</p></div>')

    $(".subNav").click(function(){
        // 修改数字控制速度， slideUp(500)控制卷起速度
        $(this).next(".navContent").slideToggle(500).siblings(".navContent").slideUp(500);
    })
    // console.log('aaa')

    // // 点击课程组信息变色
    // $('.subNavBox').find('.subNav').on('click',function () {
    //     $('.subNavBox .subNav').removeClass('active')
    //     $(this).addClass('active')
    // })

    // 课程下拉控制
    $('.subNavBoxTwo div:first').addClass('active')
    $('.subNavBoxTwo ul:first').css('display','block')
    // console.log('ssss')

    // // 点击课程组信息变色
    // $('.subNavBoxTwo').find('.subNav').on('click',function () {
    //     $('.subNavBoxTwo .subNav').removeClass('active')
    //     $(this).addClass('active')
    // })


})