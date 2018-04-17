/*window.onload = function () {

    $.ajax({
        url: "/getCourseGroups",
        type: 'GET',
        dataType: 'json',
        timeout: 1000,
        contentType: 'application/json; charset=UTF-8',
        // beforeSend: LoadFunction,
        error: geterrorFunction,
        success: gettsucceedFunction
    });

    function geterrorFunction() {
        alert("获取失败") // body...
    }

    function gettsucceedFunction(data) {
        for (var i = data.data.length - 1; i >= 0; i--) {
            $("#tgroup").append("<option value='" + data.data[i].id + "'>" + data.data[i].name + "</option>");
        }
    }

};*/

function teachersub() {
    // if (validatetheacher() == false) {
    // }
    // else {
    $.ajax({
        url: "/addTeacher",
        data: JSON.stringify({
            "number": $("#tid").val(),
            "name": $("#tname").val(),
            "sex": $("#tsex").val(),
            "position": $("#tposition").val(),
            "personIntroduction": $("#tintro").val(),
            "picture_id":$("#picture_id").val()
        }),
        type: 'POST',
        async: false,
        cache: false,
        dataType: 'json',
        timeout: 1000,
        contentType: 'application/json; charset=UTF-8',
        // beforeSend: LoadFunction,
        error: errorFunction,
        success: succeedFunction
    });


    function errorFunction() {
        alert("失败了");
    }

    function succeedFunction(data) {
        alert(data.message);
        window.location.reload();
    }

}

/*function validatetheacher(name, id, limitLength) {

    if (document.getElementById(id).value.length > limitLength) {
        alert(name + '长度必须小于' + limitLength + '!');
        document.getElementById(id).value = '';
        this.focus();
        return false;
    } else if (document.getElementById(id).value.length === 0) {
        alert(name + '不能为空' + '!');
        this.focus();
        return false;
    } else {
        return true;
    }

}*/

function uploadCoursePicture() {
    var f = document.getElementById("file");
    f.click();
}

function upload() {

    var formData = new FormData($( "#uploadForm" )[0]);

    $.ajax({
        url: '/file/pic',
        type: 'post',
        timeout: 5000,
        contentType: false,
        processData: false,
        async: false,
        cache: false,
        data:formData,
    })

        .done(function (data) {
            alert("正在上传");
            $("#showPicture").attr("src",data.data.url);
            $("#picture_id").val(data.data.id);
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

}
