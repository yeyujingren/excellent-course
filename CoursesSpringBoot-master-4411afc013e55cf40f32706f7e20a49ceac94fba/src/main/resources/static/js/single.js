$(document).ready(function () {
  // 获取链接中的参数
  function GetQueryString(name) {
      var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
      var r = window.location.search.substr(1).match(reg);
      if (r != null) return unescape(r[2]);
      return null;
  }
  var id = GetQueryString('id');

  // 视频点击播放与暂停
  $("#my-video").on("click",function () {
    if(this.paused){
      this.play();
    }else{
      this.pause();
  } })

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
        for (let i in data.data) {
            $('.subNavBox').prepend(`<div class="subNav"><i class="glyphicon glyphicon-chevron-down"></i>&nbsp;&nbsp;&nbsp;${data.data[i].courseGroup.name}</div><ul class="navContent ul-${i}"></ul> `)
            // let a = i
            for (let y of data.data[i].ordinaryCourse) {
                // console.log(i)
                $('.subNavBox').find(`.ul-${i}`).append(`<li><a href="/course?id=${y.course.id}">${y.course.name}</a></li>`)
            }
            for (let x of data.data[i].keyCourses) {
                // console.log(i)
                $('.subNavBox').find(`.ul-${i}`).append(`<li><a href="/course?id=${x.course.id}">${x.course.name}</a></li>`)
            }
        }
        $('.subNavBox').prepend('<div style="width:100%;height:50px;line-height: 50px;text-align: center;font-size: 13px;"><i class="glyphicon glyphicon-home"></i>&nbsp;&nbsp;&nbsp;核心课程</div>')
      }else{
        alert(data.message)
      }
    }


    $.ajax({
      url: '/getUnitDetail',
      type:'POST',
      dataType:'json',
      data:JSON.stringify(
          {
              id:id
          }
      ),
        contentType:"application/json",
      timeout: 5000,
      async: false,
      error: function () {console.log('请求失败！')},
      success: sucFun
    })

    function sucFun (data) {
      console.log(data)
      if(data.success){
        $('.c-name').append(`${data.data.chapter.number}&nbsp;&nbsp;${data.data.unit.number}:${data.data.unit.name}`)
        if(data.data.videos.length == 0){
          $('video').attr('src','')
        }else{
          $('video').attr('src',data.data.videos[0].video.url)
        }
        
        for(let i of data.data.offices){
          $('.information .stu').append(`
            <li>
              <a href="${i.fileUrl}" title=""><i class="glyphicon glyphicon-list-alt"></i>&nbsp;&nbsp;${i.name}</a>
            </li>
            `)
        }
        for(let x in data.data.knowledgePoints){
          $('.information .point').append(`
            <li>
              <a href="javastript:void(0);" index="data.data.knowledgePoints[x].id" title="">${data.data.knowledgePoints[x].content}</a>
            </li>
            `)
        }
        $('.classinfor').append(data.data.unit.content)

        // var url = ' ';
        // for(let y of data.data.videos_chapter){

        //   if(y.picture.url){
        //     url=y.picture.url
        //   }else{
        //     url=' '
        //   }
        //   $('.s-list ul').append(`
        //     <li>
        //         <div class="col-md-6">
        //           <a href="/single?id=${y.unit.id}" title="">
        //             <img src="${url}" />
        //           </a>
        //         </div>
        //         <div class="col-md-6 detail">
        //           <a href="/single?id=${y.unit.id}" title="">${y.unit.number}</a>
        //           <p class="author">${y.unit.name}</p>
        //           <p class="views">${y.unit.content}</p>
        //         </div>
        //       </li>
        //     `)
        // }
        $('.s-list ul').append(`<div class="clear"></div>`)
      }else{
        alert(data.message)
      }
    }
    $('.point li').on('click',function () {
      let point = $(this).attr('index')
      $.ajax({
        url:'/getUnitsByKnowledgePoint',
        timeout:5000,
        type:'POST',
        dataType:'json',
        async:false,
        data:{
          id:point
        },
        contentType: "application/json",
        error: function () {
          $('#myModal iframe').css('display','none')
          $('#myModal modal-body div').css('display','block')
          $('#myModal modal-body div').html('<center>获取失败</center>')
        },
        success: successFun
      })
      function successFun (data){
        if(data.success){
          $('#myModal iframe').css('display','none')
          $('#myModal modal-body div').css('display','block')
          for(let i of data.data){
            $('#myModal modal-body div').append(`<li style="list-style:none;margin-left:20px;margin-top:20px;font-size:16px;"><a href="single.html?id=${i.unit.id}">${i.course.name}&nbsp;&nbsp;${i.chapter.number}&nbsp;&nbsp;${i.unit.number}&nbsp;&nbsp;${i.unit.name}</a></li>`)
          }
        }else{
          $('#myModal iframe').css('display','none')
          $('#myModal modal-body div').css('display','block')
          $('#myModal modal-body div').html('<center>'+data.message+'</center>')
        }
      }
    })


    $('.subNavBox div:first').addClass('active')
    $('.subNavBox ul:first').css('display','block')
    $('.subNavBox').append(`<div class="copyright"><p>Copyright © 2018.合肥工业大学管理学院 版权所有</p></div>`)

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