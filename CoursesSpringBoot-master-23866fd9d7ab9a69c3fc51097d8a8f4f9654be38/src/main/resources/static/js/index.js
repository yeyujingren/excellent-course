$(document).ready(function () {
  $.ajax({
    url:'/getHomepageInfo',
    timeout:5000,
    type:'GET',
    dataType:'json',
    async:false,
    contentType: "application/json",
    error: funErr,
    success: funSucc
  })

  function funSucc (data) {
    if(data.success){
      // 获取课程组信息和课程组课程
      // console.log(data)
      for (var i in data.data) {
              $('.subNavBox').prepend('<div class="subNav"><i class=" glyphicon glyphicon-chevron-down"></i>&nbsp;&nbsp;&nbsp;' + data.data[i].courseGroup.name + '</div><ul class="navContent ul-' + i + '"></ul> ');
              // var a = i
              for (var y in data.data[i].ordinaryCourse) {
                  // console.log(i)
                  $('.subNavBox').find('.ul-' + i).prepend('<li><a href="/course?id=' + data.data[i].ordinaryCourse[y].course.id + '">' + data.data[i].ordinaryCourse[y].course.name + '</a></li>');
              }
              for (var x in data.data[i].keyCourses) {
                  // console.log(i)
                  $('.subNavBox').find('.ul-' + i).prepend('<li><a href="/course?id=' + data.data[i].keyCourses[x].course.id + '">' + data.data[i].keyCourses[x].course.name + '</a></li>');
              }
            }
            $('.subNavBox').prepend('<div style="width:100%;height:50px;line-height: 50px;text-align: center;font-size: 13px;"><i class="glyphicon glyphicon-home"></i>&nbsp;&nbsp;&nbsp;核心课程</div>')

      for(var i in data.data){
          $('.r-main').prepend('<div class="group"><div class="g-top"><h3>' + data.data[i].courseGroup.name + '&nbsp;&nbsp;&nbsp;&nbsp;<a href="/morelessons?id=' + data.data[i].courseGroup.id + '" class="btn btn-default btn-sm" > 更多课程 </a></h3></div><div class="div-' + i + '"></div></div>');
        for (var x in data.data[i].keyCourses) {
                  // console.log(i)
            var url;
            var picture=data.data[i].keyCourses[x].picture;
            if(picture== null){
                url=''
            }else{
                url = picture.url
            }
            $('.r-main').find('.div-' + i).append('<div class="col-md-4 courses"><div class="course"><div class="img"><a href="/course?id=' + data.data[i].keyCourses[x].course.id + '" title=""><img width="100%" height="100%" src="' + url + '"></a></div><div class="course-info"><a href="/course?id=' + data.data[i].keyCourses[x].course.id + '" title="">' + data.data[i].keyCourses[x].course.name + '</a><div><a href="javascript:void(0);" title=""><i class="glyphicon glyphicon-user"></i>&nbsp;' + data.data[i].keyCourses[x].course.type + '</a></div></div></div></div>');
        }
        for (var x in data.data[i].ordinaryCourse) {
                  // console.log(i)
            var url;
            var picture=data.data[i].ordinaryCourse[x].picture;
            if(picture== null){
                url=''
            }else{
                url = picture.url
            }
            $('.r-main').find('.div-' + i).append('<div class="col-md-4 courses"><div class="course"><div class="img"><img width="100%" height="100%" src="' + url + '"></div><div class="course-info"><a href="course.html?id=' + data.data[i].ordinaryCourse[x].course.id + '" title="">' + data.data[i].ordinaryCourse[x].course.name + '</a><div><a href="javascript:void(0);" title=""><i class="glyphicon glyphicon-user"></i>&nbsp;' + data.data[i].ordinaryCourse[x].course.type + '</a></div></div></div></div>');
        }

      }
      // 
    }else{
      alert(data.message)
    }
  }
  function funErr () {
    console.log('error')
  }

  $('.subNavBox div:first').addClass('active')
  $('.subNavBox ul:first').css('display','block')
  $('.subNavBox').append('<div class="copyright"><p>Copyright © 2018.合肥工业大学管理学院 版权所有</p></div>')

  $(".subNav").click(function(){
    // 修改数字控制速度， slideUp(500)控制卷起速度
    $(this).next(".navContent").slideToggle(500).siblings(".navContent").slideUp(500);
  })


// // 点击课程组信息变色
//     $('.subNavBox').find('.subNav').on('click',function () {
//         $('.subNavBox .subNav').removeClass('active')
//         $(this).addClass('active')
//     })

})
