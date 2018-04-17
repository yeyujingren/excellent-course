$(document).ready(function () {
  $.ajax({
    url: '/getTeacherTeam',
    type: 'GET',
    dataType: 'json',
    timeout: 5000,
    async: false,
    error: function() {
        console.log('请求失败！')
    },
    success: successFunction
    })

  function successFunction (data) {
    // console.log(data)
    if(data.success){
      for( var i in data.data){
        $('.g-teachers').prepend('<div class="groups"><h3>' + data.data[i].courseGroup.name + '</h3><ul class="li-' + i + '"><div class="clear"></div></ul>');
        for(var x in data.data[i].teachers){
          $('.g-teachers').find('.li-' + i).prepend('<li><a href="/teacherinfo?id=' + data.data[i].teachers[x].teacher.id + '" title=""> ' + data.data[i].teachers[x].teacher.name + ' </a></li>');
        }
      }
    }else{
      alert(data.message)
    }
  }
  })