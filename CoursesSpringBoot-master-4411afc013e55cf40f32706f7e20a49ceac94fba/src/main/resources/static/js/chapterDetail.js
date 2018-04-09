var localaddr = "";
var chapter_id;
var unit_id;

$(document).ready(function () {

    chapter_id = getQueryString("id");
    queryChapterById(chapter_id);
    showUnitListTable();

});

//获取某章详情
function queryChapterById(id) {

    $.ajax({
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        url:localaddr+ "/queryChapterById",
        data: JSON.stringify({
            "id": id
        }),
        type: 'POST',
        dataType: 'json',
        async: false,
        success: function (data) {

            $("#chapterId").val(data.data.id);
            $("#chapterNumber").val(data.data.number);
            $("#chapterName").val(data.data.name);

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            /*alert("您的请求已经gg");*/

        }
    });

}

//通过url获取参数
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
}

//显示教学单元列表
function showUnitListTable() {

    //判断videoTable是否已被初始化，防止重复架子啊
    if ($("#unitListTable").hasClass('dataTable')){
        $('#unitListTable').dataTable().fnClearTable();    //清空数据
        $('#unitListTable').dataTable().fnDestroy();         //销毁datatable
    }

    $("#unitListTable").dataTable({

        "sPaginationType": "full_numbers",
        "bPaginite": true,
        "bInfo": true,
        "bSort": true,
        "processing": false,
        "serverSide": true,
        "sAjaxSource": "/getUnitsByChapter",//这个是请求的地址
        "fnServerData": retrieveUnits,
        "searching": false,
        /*"lengthChange": false,
        "pageLength": 5,*/

        "columns": [
            {"data": "number"},
            {"data": "name"},
            {"data": null},
            {"data": null},
            {"data": null},
            {"data": null},
            {"data": null},
            {"data":null}
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

                var content;
                if (data.content==null){
                    content="";
                }else if (data.content.length<8){
                    content=data.content;
                }else{
                    content = data.content.substring(0, 14) + "...";
                }

                return "<span>"+content+"</span>"
            }

        },{
            targets: 3,
            render: function (data, type, row, meta) {

                return "<p onclick='showOffices(\"" + data.id + "\")'>资料</p>"
            }

        }, {
            targets: 4,
            render: function (data, type, row, meta) {

                return "<p onclick='showVideos(\"" + data.id + "\")'>视频</p>"


            }

        }, {
            targets: 5,
            render: function (data, type, row, meta) {

                return "<p onclick='showKPs(\"" + data.id + "\")'>知识点</p>"

            }

        }, {
            targets: 6,
            render: function (data, type, row, meta) {

                return "<a type='button' class='btn btn-danger" +
                    "' onclick='deleteUnit(\"" + data.id + "\")' href='#'>删除</a>"

            }

        },{
            targets: 7,
            render: function (data, type, row, meta) {

                return "<a type='button' class='btn btn-primary" +
                    "' onclick='updateInfor(\"" + data.id + "\")' href='#'>修改</a>"

            }

        }]
    });
}

//修改
function updateInfor(unitId) {
    unit_id=unitId;
    showUnitDetail();
}

/*//可读性改变
function toEditable(ob) {
    ob.readOnly = false;
}
//更新教学单元内容
function updateUnitName(unitName,unit_id) {
    /!*console.log($("#"+unitName).val());*!/
    $.ajax({
        url: "/updateCourse",
        data: JSON.stringify({
            "id":""

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

    }

}*/

//利用ajax获取教学单元列表的数据
function retrieveUnits(url, aoData, fnCallback) {

    $.ajax({
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        url: localaddr + url,//这个就是请求地址对应sAjaxSource
        data: JSON.stringify({
            "chapter_id": chapter_id,
            "iDisplayStart": aoData[3].value,
            "iDisplayLength": aoData[4].value
        }),
        type: 'POST',
        dataType: 'json',
        async: false,
        success: function (data) {
            // alert(data.data);
            fnCallback(data.data);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            /*alert("您的请求已经gg");*/

        }
    });
}


//获取某教学单元资料列表的数据
function showOffices(unitId) {

    unit_id=unitId;

    $("#showOfficeModal").modal("show");

    //判断unitList是否已被初始化，防止重复架子啊
    if ($("#showOfficeModalTable").hasClass('dataTable')){
        $('#showOfficeModalTable').dataTable().fnClearTable();    //清空数据
        $('#showOfficeModalTable').dataTable().fnDestroy();         //销毁datatable
    }

    $("#showOfficeModalTable").dataTable({

        "sPaginationType": "full_numbers",
        "bPaginite": true,
        "bInfo": true,
        "bSort": true,
        "processing": false,
        "serverSide": true,
        "sAjaxSource": "/getOfficesByUnit",//这个是请求的地址
        "fnServerData": retrieveOffices,
        "searching": false,
        /*"lengthChange": false,
        "pageLength": 5,*/
        "fnDrawCallback": function(){
            var api = this.api();
            var startIndex= api.context[0]._iDisplayStart;//获取到本页开始的条数
            api.column(0).nodes().each(function(cell, i) {
                cell.innerHTML = startIndex + i + 1;
            });
        },

        "columns": [
            {"data": null},
            {"data": "name"},
            {"data": null},
            {"data": null},
            {"data": null},
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


                return "<input type='text' size='5' id='desId"+data.id+"' readonly='readonly' value='"+data.description
                    +"' onclick='changeEditable("+data.id+")' onchange='updateOfficeDescription("+data.id+")'>"

            }

        },{
            targets: 3,
            render: function (data, type, row, meta) {
                return "<a href='"+data.viewUrl+"'>演示</a>"

            }

        },{
            targets: 4,
            render: function (data, type, row, meta) {
                return "<a type='button' class='btn btn-danger"

                    + "' onclick='deleteOfficeById(\""
                    + data.id
                    + "\",\""+unit_id+"\")' href='#'>删除</a>"

            }

        }]
    });
}

//输入框可编辑
function changeEditable(id) {
    var desId="desId"+id;
    $("#"+desId+"").removeAttr("readonly");
}

//更新资料描述
function updateOfficeDescription(id) {

    var desId="desId"+id;

    $.ajax({
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        url: localaddr + "/updateOfficeDescription",
        data: JSON.stringify({
            "id":id,
            "description":$("#"+desId+"").val()
        }),
        type: 'POST',
        dataType: 'json',
        async: false,
        success: function (data) {

            if (data.success){
                $("#"+desId+"").attr("readonly","readonly");
            }

            alert(data.message);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            /* alert("您的请求已经gg");*/

        }
    });


}

//利用ajax获取教学单元列表的数据
function retrieveOffices(url, aoData, fnCallback) {

    $.ajax({
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        url: localaddr + url,//这个就是请求地址对应sAjaxSource
        data: JSON.stringify({
            "unit_id": unit_id,
            "iDisplayStart": aoData[3].value,
            "iDisplayLength": aoData[4].value
        }),
        type: 'POST',
        dataType: 'json',
        async: false,
        success: function (data) {
            // alert(data.data);
            fnCallback(data.data);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {

           /* alert("您的请求已经gg");*/

        }
    });

}

//根据id删除资料
function deleteOfficeById(id,unit_id) {
    $.ajax({
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        url: localaddr + "/deleteOfficeById",
        data: JSON.stringify({
            "unit_id": unit_id,
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

//显示视频列表
function showVideos(unitId) {

    unit_id=unitId;

    $("#showVideoModal").modal("show");

    //判断unitList是否已被初始化，防止重复架子啊
    if ($("#showVideoModalTable").hasClass('dataTable')){
        $('#showVideoModalTable').dataTable().fnClearTable();    //清空数据
        $('#showVideoModalTable').dataTable().fnDestroy();         //销毁datatable
    }

    $("#showVideoModalTable").dataTable({

        "dom": '<"top"i>rt<"bottom"flp><"clear">',
        "sPaginationType": "full_numbers",
        "bPaginite": true,
        "bInfo": true,
        "bSort": true,
        "processing": false,
        "serverSide": true,
        "sAjaxSource": "/getVideosByUnit",//这个是请求的地址
        "fnServerData": retrieveVideos,
        "searching": false,
        /*"lengthChange": false,
        "pageLength": 5,*/
        "fnDrawCallback": function(){
            var api = this.api();
            var startIndex= api.context[0]._iDisplayStart;//获取到本页开始的条数
            api.column(0).nodes().each(function(cell, i) {
                cell.innerHTML = startIndex + i + 1;
            });
        },

        "columns": [
            {"data": null},
            {"data": "chineseDescription"},
            {"data": "url"},
            {"data": null},
        ],
        language: {
            "sProcessing": "处理中...",
            "sLengthMenu": "显示 _MENU_ 项结果",
            "sZeroRecords": "没有匹配结果",
            "sInfo": "",
            "sInfoEmpty": "",
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
            targets: 3,
            render: function (data, type, row, meta) {
                return "<a type='button' class='btn btn-danger"

                    + "' onclick='deleteVideoById(\""
                    + data.id
                    + "\",\""+unit_id+"\")' href='#'>删除</a>"

            }

        }]
    });
}

//利用ajax获取教学单元列表的数据
function retrieveVideos(url, aoData, fnCallback) {

    $.ajax({
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        url: localaddr + url,//这个就是请求地址对应sAjaxSource
        data: JSON.stringify({
            "unit_id": unit_id,
            "iDisplayStart": aoData[3].value,
            "iDisplayLength": aoData[4].value
        }),
        type: 'POST',
        dataType: 'json',
        async: false,
        success: function (data) {
            // alert(data.data);
            fnCallback(data.data);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            /*alert("您的请求已经gg");*/

        }
    });

}

//根据id删除资料
function deleteVideoById(id,unit_id) {

    /*console.log("videoId:"+id);
    console.log("unitId:"+unit_id);*/

    $.ajax({
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        url: localaddr + "/deleteVideoById",
        data: JSON.stringify({
            "unit_id": unit_id,
            "video_id":id
        }),
        type: 'POST',
        dataType: 'json',
        async: false,
        success: function (data) {

            alert(data.message);
            showVideos();

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            /*alert("您的请求已经gg");*/

        }
    });
}

//展示教学单元知识点
function showKPs(unitId) {

    unit_id=unitId;

    $("#showKPModal").modal("show");

    $.ajax({
        url: localaddr + '/getKnowledgePointsByUnit',
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
            "unit_id": unit_id
        }),
    })
    /**
     * 点击按钮隐藏添加章节,显示章节详情
     */
        .done(function (data) {

            $("#KPList").val("");

            if (data.data.length!=0) {
                var kps="";
                for (var i = 0; i < data.data.length - 1; i++) {
                    kps += (data.data[i].content + ";");
                }
                kps += data.data[data.data.length - 1].content;

                $("#KPList").val(kps);
            }

        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

}

//更新知识点
function addKPs() {
    $.ajax({
        url: localaddr + '/addKnowledgePoints',
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
            "unit_id": unit_id,
            "knowledgePoints":$("#KPList").val()
        }),
    })
    /**
     * 点击按钮隐藏添加章节,显示章节详情
     */
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


//添加教学单元
function addUnitTo() {
    if ($("#unitName").val() == "") {
        alert("请输入课时名称!");
    }
    /**
     * 发送数据numbr,name
     */
    else {
        $.ajax({
            url: localaddr + '/addUnit',
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
                "number": $("#unitNumber").val(),
                "name": $("#unitName").val(),
                "chapter_id": $("#chapterId").val()
            })
        })
        /**
         * 点击按钮隐藏添加章节,显示章节详情
         */
            .done(function (data) {

                // todo 加上弹出的东西

                alert(data.message);
                // alert(data.data.id)
                window.location.href = "unitDetail?id="+data.data.id;


            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                console.log("complete");
            });
    }

}

//更新本章基本信息
function updateChapter() {
    $.ajax({
        url: localaddr + '/updateChapter',
        type: 'post',
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        data: JSON.stringify({
            "number": $("#chapterNumber").val(),
            "name": $("#chapterName").val(),
            "id": $("#chapterId").val() //
        })
    })
        .done(function (data) {
            //todo 炫酷更新成功效果
            alert(data.message)
            /*console.log("success");*/
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

}

function clearforms() {
    /**
     * 清空列表
     */
    $("input").val("");

}

//显示单元详情
function showUnitDetail() {
    window.location.href="unitDetail?id="+unit_id;
}

//删除教学单元
function deleteUnit(unit_id) {
    $.ajax({
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        url: localaddr + "/deleteUnit",
        data: JSON.stringify({
            "id": unit_id,
            "chapter_id": $("#chapterId").val()
        }),
        type: 'POST',
        dataType: 'json',
        async: false,
        success: function (data) {

            alert(data.message);
            showUnitListTable();

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("您的请求已经gg");

        }
    });
}