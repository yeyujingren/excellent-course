$(document).ready(function () {
  // 获取链接中的参数
    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;
    }
    var id = GetQueryString('id');
    console.log(id)

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
    // console.log('1')
    // get morelessons data
    $.ajax({
        url:'/getCoursesByCourseGroup ',
      type:'POST',
      dataType:'json',
        contentType:"application/json",
      data:JSON.stringify(
          {
              id:id
          }
      ),
        contentType:"application/json",
      timeout: 5000,
      async: false,
      error: function () {console.log('请求失败！')},
      success: successFunction
    })
    // console.log('2')

    function successFunction (data) {
      if(data.success){
        // for(var i in data.data){
          $('.r-main').prepend('<div class="group"><div class="g-top"><h3>' + data.data.courseGroup.name + '&nbsp;&nbsp;&nbsp;&nbsp;</h3></div><div class="div-cour"></div></div>');
          for (var x in data.data.courses) {
              var url;
              var picture=data.data.courses[x].picture;
              if(picture== null){
                  url=''
              }else{
                  url = picture.url
              }
                    // console.log(i)
                    $('.r-main').find('.div-cour').append('<div class="col-md-3 courses"><div class="course"><div class="img"><a href="/course?id=' + data.data.courses[x].course.id + '" title=""><img width="100%" height="100%" src="' + url + '"></a></div><div class="course-info"><a href="/course?id=' + data.data.courses[x].course.id + '" title="">' + data.data.courses[x].course.name + '</a><div><a href="javascript:void(0);" title=""><i class="glyphicon glyphicon-user"></i>&nbsp;' + data.data.courses[x].course.type + '</a></div></div></div></div>');
                }
          // for (var x of data.data.ordinaryCourse) {
          //         // console.log(i)
          //         $('.r-main').find(`.div-${i}`).append(`
          //             <div class="col-md-3 courses">
          //             <div class="course">
          //               <div class="img">
          //                 <img src="${x.course.picture}">
          //               </div>
          //               <div class="course-info">
          //                 <a href="/single?id=${x.course.id}" title="">${x.course.name}</a>
          //                 <div>
          //                   <a href="/teacherinfo?id=${x.course.id}" title="">
          //                     <i class="glyphicon glyphicon-user"></i>&nbsp;${x.course.type}
          //                   </a>
          //                 </div>
          //               </div>
          //             </div>
          //           </div>
          //           `)
          //     }
        // }
      }else{
        alert(data.messsage)
      }
    }

    $('.subNavBox div:first').addClass('active')
    $('.subNavBox ul:first').css('display','block')
    $('.subNavBox').append('<div class="copyright"><p>Copyright © 2018.合肥工业大学管理学院 版权所有</p></div>')

    $(".subNav").click(function(){
        // 修改数字控制速度， slideUp(500)控制卷起速度
        $(this).next(".navContent").slideToggle(500).siblings(".navContent").slideUp(500);
    })
    // // 点击课程组信息变色
    // $('.subNavBox').find('.subNav').on('click',function () {
    //     $('.subNavBox .subNav').removeClass('active')
    //     $(this).addClass('active')
    // })
})