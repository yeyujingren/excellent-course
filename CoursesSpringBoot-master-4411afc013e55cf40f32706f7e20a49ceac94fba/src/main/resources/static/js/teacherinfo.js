$(document).ready(function () {
  // 获取链接中的参数
    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;
    }
    var id = GetQueryString('id');

    $.ajax({
      url:'/getTeacher_Courses',
      type:'POST',
      dataType:'json',
      data:JSON.stringify(
          {
              id: id
          }
      ),
        contentType:"application/json",
      timeout: 5000,
      async:false,
      error: function () {
        console.log('请求失败！')
      },
      success:successFunction
    })

    function successFunction (data) {
        console.log(data)
      if(data.success){
        $('.p-left').append(`
          <img src="${data.data.picture.url}" />
          <p>${data.data.teacher.name}</p>
        `)
        $('.p-right ul').append(`
          <li>
            性别：${data.data.teacher.sex}
          </li>
          <li>
            职位：${data.data.teacher.position}
          </li>
        `)
        $('.intro').append(data.data.teacher.personIntroduction)
        for(let i of data.data.courses){
          $('.classes').append(`
            <li>
              <a href="course.html/?id=${i.id}" title="">${i.name}</a>
            </li>
          `)
        }
      }else{
        alert(data.message)
      }
    }
})