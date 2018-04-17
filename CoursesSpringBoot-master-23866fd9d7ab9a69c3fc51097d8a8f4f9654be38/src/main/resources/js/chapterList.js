var modalEditor;
var localaddr=""
var course_id = "";
var cooks = document.cookie.split(";");
for (var i = 0; i < cooks.length; i++) {
    var index = cooks[i].indexOf("course_id");
    if (index > -1) {
        course_id = cooks[i].split("=")[1];
    }
}

$(document).ready(function () {

    showChapterList();

});

//显示章列表
function showChapterList() {

    //判断unitList是否已被初始化，防止重复架子啊
    if ($("#chapterList").hasClass('dataTable')){
        $('#chapterList').dataTable().fnClearTable();    //清空数据
        $('#chapterList').dataTable().fnDestroy();         //销毁datatable
    }

    $("#chapterList").dataTable({


        "sPaginationType": "full_numbers",
        "bPaginite": true,
        "bInfo": true,
        "bSort": true,
        "processing": false,
        "serverSide": true,
        "sAjaxSource": "/getChaptersByPage",//这个是请求的地址
        "fnServerData": retrieveChapters,
        "searching": false,
        /*"lengthChange": false,
        "pageLength": 5,*/

        "columns": [
            {"data": "number"},
            {"data": "name"},

            {"data": null},
            {"data": null}


        ],
        language: {
            "sProcessing": "处理中...",
            "sLengthMenu": "显示 _MENU_ 项结果",
            "sZeroRecords": "没有匹配结果",
            "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
            "sInfoPostFix": "",
            "sSearch": "搜索:",
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
            targets: 2,
            render: function (data, type, row, meta) {

                return "<a type='button' class='btn btn-primary"
                    +
                    "' data-toggle='modal' data-target='#chapterModal' onclick=getChapterDetail(\'"
                    + data.id +
                    "\') href='#'>详情</a>"
            }

        }, {
            targets: 3,
            render: function (data, type, row, meta) {
                /*console.log("2." + data);*/
                return "<a type='button' class='btn btn-danger"

                    +
                    "' onclick='deleteChapter(\"" +
                    row.id +

                    "\")' href='#'>删除</a>"


            }

        }]
    });
}

//利用ajax获取章列表的数据
function retrieveChapters(url, aoData, fnCallback) {

    $.ajax({
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        url:localaddr+ url,//这个就是请求地址对应sAjaxSource
        data: JSON.stringify({
            "course_id": course_id,
            "iDisplayStart": aoData[3].value,
            "iDisplayLength": aoData[4].value
        }),
        type: 'POST',
        dataType: 'json',
        async: false,
        success: function (data) {

            fnCallback(data.data);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("您的请求已经gg");

        }
    });
}

//获取本章详情
function getChapterDetail(id) {

    window.location.href="chapterDetail?id="+id;

}

//添加章节
function addChapterTo() {
    if ($("#selectTitle").val() == "") {
        alert("请输入本章标题!");
    }
    /**
     * 发送数据numbr,name
     */
    else {
        $.ajax({
            url: localaddr + '/addChapter',
            type: 'post',
            dataType: 'json',
            timeout: 5000,
            crossDomain: true,
            xhrFields: {
                withCredentials: true
            },//跨域解决
            contentType: 'application/json; charset=UTF-8',
            cache: false,
            data: JSON.stringify({
                "number": $("#selectChapterNumber").val(),
                "name": $("#selectTitle").val(),
                "course_id": course_id
            })
        })
        /**
         * 点击按钮隐藏添加章节,显示章节详情
         */
            .done(function (data) {

                // todo 加上弹出的东西
                // alert("选择的章节是" + $("option selected").val() + "\n" + "标题是:  " + $("#selectTitle").val());
                // $("#showchapter").show('slow', function () {
                //
                // });
                alert("添加成功");
                // alert(data.data.id)
                window.location.href = "chapterDetail.html?id=" + data.data.id;
                // $("#submitchapter").hide('slow', function () {
                //
                // });
                // console.error($("option selected").val());
                // console.log("postsuccess");
                // console.log(data)
                // console.log(data.data.name);
                $("#selectShownChapterNumber").val(data.data.number);
                $("#totalId").val(data.data.id);
                $("#selectShownChapterTitle").val(data.data.name);


            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                /*console.log("complete");*/
            });
    }

}

//删除章
function deleteChapter(chapter_id) {
    $.ajax({
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        url: localaddr + "/deleteChapter",
        data: JSON.stringify({
            "id": chapter_id,
        }),
        type: 'POST',
        dataType: 'json',
        async: false,
        success: function (data) {

            alert(data.message);
            showChapterList();

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("您的请求已经gg");

        }
    });
}