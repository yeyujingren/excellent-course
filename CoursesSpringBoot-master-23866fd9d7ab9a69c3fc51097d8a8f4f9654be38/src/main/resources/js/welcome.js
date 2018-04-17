var course_id = "";
var localaddr = "";
var cooks = document.cookie.split(";");
for (var i = 0; i < cooks.length; i++) {
    var index = cooks[i].indexOf("course_id");
    if (index > -1) {
        course_id = cooks[i].split("=")[1];
    }
}

$(document).ready(function () {

    'use strict';
    $.ajax({
        // url: 'https://www.easy-mock.com/mock/5a50c209aaeb8a0aa380acba/courseadmin/queryCourseById',
        url: '/queryCourseById',
        type: 'post',
        data: JSON.stringify({
            id: course_id
        }),
        dataType: 'json',
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false
    })
        .done(function (data) {
            var temp = "";
            for (var i = data.data.teachers.length - 1; i >= 0; i--) {
                temp += data.data.teachers[i].name;
            }

            $("#courseId").val(course_id);
            $("#CourseTeacher").val(temp);
            $("#inCourseGroup").val(data.data.courseGroup.name);
            $("#CourseNumber").val(data.data.course.number);
            $("#CourseName").val(data.data.course.name);
            $("#CourseType").val(data.data.course.type);
            $("#CourseScore").val(data.data.course.credit);
            $("#CourseTime").val(data.data.course.hours);
            $("#CourseDetails").val(data.data.course.introduction);
            $("#showPicture").attr("src", data.data.picture.url);

            showOffices(course_id);
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });


});

//显示资料列表
function showOffices(course_id) {
    $.ajax({
        url: '/getOfficesByCourse',
        type: 'post',
        data: JSON.stringify({
            "id": course_id
        }),
        dataType: 'json',
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false
    })

        .done(function (data) {

            //判断unitList是否已被初始化，防止重复架子啊
            if ($("#officeTable").hasClass('dataTable')) {
                $('#officeTable').dataTable().fnClearTable();    //清空数据
                $('#officeTable').dataTable().fnDestroy();         //销毁datatable
            }

            $("#officeTable").dataTable({

                "bLengthChange": false,
                "bFilter": false, //搜索栏
                "bInfo": false, //显示表格信息
                "data": data.data,
                "columns": [
                    {"data": null},
                    {"data": null},
                    {"data": null},
                    {"data": null},
                    {"data": null},
                ],
                "fnDrawCallback": function () {
                    var api = this.api();
                    var startIndex = api.context[0]._iDisplayStart;//获取到本页开始的条数
                    api.column(0).nodes().each(function (cell, i) {
                        cell.innerHTML = startIndex + i + 1;
                    });
                },
                language: {
                    "sProcessing": "处理中...",
                    "sLengthMenu": "显示 _MENU_ 项结果",
                    "sZeroRecords": "没有匹配结果",
                    "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                    "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                    "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                    "sInfoPostFix": "",
                    "sSearch": "搜索",
                    "sUrl": "",
                    "sEmptyTable": "表中数据为空",
                    "sLoadingRecords": "载入中...",
                    "sInfoThousands": ",",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "上页",
                        "sNext": "下页",
                        "sLast": "末页"
                    },
                    "oAria": {
                        "sSortAscending": ": 以升序排列此列",
                        "sSortDescending": ": 以降序排列此列"
                    }
                },
                columnDefs: [{
                    targets: 1,
                    render: function (data, type, row, meta) {
                        return "<p>" + data.name + "</p>"
                    }

                }, {
                    targets: 2,
                    render: function (data, type, row, meta) {

                        var allDesSelect = "";
                        allDesSelect += "<select onchange='updateOfficeDescription(\""
                            + data.id + "\")' class=\"form-control\" id='desSelect" + data.id + "'>";

                        if (data.description == "课程大纲") {
                            allDesSelect += "<option select value='课程大纲'>课程大纲</option>";
                            allDesSelect += "<option value='教学日历'>教学日历</option>";
                            allDesSelect += "<option value='考核方式与标准'>考核方式与标准</option>";
                            allDesSelect += "<option value='学习指南'>学习指南</option>";
                        } else if (data.description == "教学日历") {
                            allDesSelect += "<option value='课程大纲'>课程大纲</option>";
                            allDesSelect += "<option selected value='教学日历'>教学日历</option>";
                            allDesSelect += "<option value='考核方式与标准'>考核方式与标准</option>";
                            allDesSelect += "<option value='学习指南'>学习指南</option>";
                        } else if (data.description == "考核方式与标准") {
                            allDesSelect += "<option value='课程大纲'>课程大纲</option>";
                            allDesSelect += "<option value='教学日历'>教学日历</option>";
                            allDesSelect += "<option selected value='考核方式与标准'>考核方式与标准</option>";
                            allDesSelect += "<option value='学习指南'>学习指南</option>";
                        } else if (data.description == "学习指南") {
                            allDesSelect += "<option value='课程大纲'>课程大纲</option>";
                            allDesSelect += "<option value='教学日历'>教学日历</option>";
                            allDesSelect += "<option value='考核方式与标准'>考核方式与标准</option>";
                            allDesSelect += "<option selected value='学习指南'>学习指南</option>";
                        } else {
                            allDesSelect += "<option selected value=''>请选择资料类型</option>";
                            allDesSelect += "<option value='课程大纲'>课程大纲</option>";
                            allDesSelect += "<option value='教学日历'>教学日历</option>";
                            allDesSelect += "<option value='考核方式与标准'>考核方式与标准</option>";
                            allDesSelect += "<option value='学习指南'>学习指南</option>";

                        }

                        return allDesSelect;
                    }

                }, {
                    targets: 3,
                    render: function (data, type, row, meta) {
                        return "<a href='" + data.viewUrl + "'>演示</a>"
                    }

                }, {
                    targets: 4,
                    render: function (data, type, row, meta) {
                        return "<a type='button' class='btn btn-danger"

                            + "' onclick='deleteOfficeById(\""
                            + data.id
                            + "\",\"" + course_id + "\")' href='#'>删除</a>"

                    }

                }]
            });

        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

}

//上传图片
function upload() {

    var formData = new FormData($("#uploadForm")[0]);
    console.log(formData);

    $.ajax({
        url: '/file/pic',
        type: 'post',
        timeout: 5000,
        contentType: false,
        processData: false,
        async: false,
        cache: false,
        data: formData,
    })

        .done(function (data) {
            /*alert("正在上传，请点击确定稍等下");*/
            /*console.log(data);*/
            //$("#showPicture").css("background-image","url("+data.data.url+")")
            $("#showPicture").attr("src", data.data.url);
            bindingFunction(data.data.id);
            //35da96aaa8244304a87d8dc92dfae4be

        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

}

//将图片与教学单元绑定
function bindingFunction(picture_id) {
    $.ajax({
        url: '/uploadCoursePicture',
        type: 'post',
        dataType: 'json',
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        data: JSON.stringify({
            "course_id": course_id,
            "picture_id": picture_id.toString()
        }),
    })

        .done(function (data) {

            alert(data.message);

        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });
}

//弹出文件选择框
function uploadCoursePicture() {
    var f = document.getElementById("file");
    f.click();
}

//弹出文件选择框
function selectOffice() {
    $("#officeFile").click();
    /*uploadCoursePicture();*/
}

//上传课程资料
function uploadOffice() {

    var formData = new FormData($("#uploadOfficeForm")[0]);
    console.log(formData);

    $.ajax({
        url: '/file/office',
        type: 'post',
        timeout: 5000,
        contentType: false,
        processData: false,
        async: false,
        cache: false,
        data: formData,
    })

        .done(function (data) {

            bindingOffice(data.data.id);

        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });
}

//绑定教学单元与资料
function bindingOffice(office_id) {

    $.ajax({
        url: '/bindCourse_office',
        type: 'post',
        dataType: 'json',
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        data: JSON.stringify({
            "course_id": course_id,
            "office_id": office_id.toString()
        }),
    })

        .done(function (data) {

            alert(data.message);
            showOffices(course_id);

        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });
}

//删除资料
function deleteOfficeById(id, course_id) {
    $.ajax({
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        url: localaddr + "/deleteCourseOfficeById",
        data: JSON.stringify({
            "course_id": course_id,
            "office_id": id
        }),
        type: 'POST',
        dataType: 'json',
        async: false,
        success: function (data) {

            alert(data.message);
            showOffices();

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            /* alert("您的请求已经gg");*/

        }
    });
}

//更新资料描述
function updateOfficeDescription(id) {

    var desId = "desSelect" + id;

    $.ajax({
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        url: localaddr + "/updateOfficeDescription",
        data: JSON.stringify({
            "id": id,
            "description": $("#" + desId + "").val()
        }),
        type: 'POST',
        dataType: 'json',
        async: false,
        success: function (data) {

            alert(data.message);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            /* alert("您的请求已经gg");*/

        }
    });


}

/*function updateWelcomeCourse() {

    $.ajax({
        url: '/queryCourseById',
        type: 'post',
        data: JSON.stringify({
            id: "17bfbbcd244b4f5b9a15df2b43ce87b9",
            name: $("#CourseName").val(),
            number: $("#CourseNumber").val(),
            type: $("#CourseType").val(),
            credit: $("#CourseScore").val(),
            hours: $("#CourseTime").val(),
            introduction: $("#CourseDetails").val()
        }),
        dataType: 'json',
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false
    })
        .done(function (data) {
            /!*console.log($("#courid").val());*!/
           $(".onupdate").show().delay(1000).hide(300);
           setTimeout(function () { $(".update-success").show('slow', function () {

            }); }, 1300);


            $("#disappare").show().delay(3000).hide(500);

            // console.log("success");
            // console.log(data);
            // // console.log(data.data.CourseName);
            // $("#inCourseGroup").val(data.data.courseGroup.name);
            // $("#CourseNumber").val(data.data.course.number);
            // $("#CourseName").val(data.data.course.name);
            // $("#CourseType").val(data.data.course.type);
            // $("#CourseScore").val(data.data.course.credit);
            // $("#CourseTeacher").val(data.data.teacher);
            // $("#CourseTime").val(data.data.course.hours);
            // $("#CourseDetails").val(data.data.course.introduction)

        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });
    var $btn = $("#updateButton").button('loading');
    // business logic...
    $btn.button('reset')
    // $("#welcomeBody").append("<div class=\"alert alert-warning alert-dismissible\" role=\"alert\">\n" +
    //     "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n" +
    //     "  <strong>正在更新中</strong>\n" +
    //     "</div>");

}*/
