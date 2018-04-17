var unit_id;
var localaddr="";
$(document).ready(function() {

    unit_id=getQueryString("id");
    /*console.log(unit_id)*/
    queryUnitById(unit_id);

});

//通过url获取参数
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
}

//获取某一教学单元的详细信息
function queryUnitById(id) {
    $.ajax({
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        url:localaddr+ "/queryUnitById",
        data: JSON.stringify({
            "id": id
        }),
        type: 'POST',
        dataType: 'json',
        async: false,
        success: function (data) {

            //展示教学单元详情的操作
            $("#unitNumber").val(data.data.unit.number)//教学单元编号
            $("#unitName").val(data.data.unit.name);//教学单元名称
            $("#unitId").val(data.data.unit.id);//教学单元id
            $("#unitContent").val(data.data.unit.content);//教学单元详情

            //显示教学资料列表
            showOffices(id);

            //显示教学视频列表
            showVideos(id);

            //显示已有知识点
            showKPs(id);

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            /*alert("您的请求已经gg");*/
        }
    });
}

//显示教学资料列表s
function showOffices(unit_id) {

    //判断unitList是否已被初始化，防止重复架子啊
    if ($("#officeTable").hasClass('dataTable')){
        $('#officeTable').dataTable().fnClearTable();    //清空数据
        $('#officeTable').dataTable().fnDestroy();         //销毁datatable
    }

    $("#officeTable").dataTable({

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

                var description;
                if (data.description==null){
                    description="";
                }else{
                    description=data.description;
                }

                return "<input type='text' id='desId"+data.id+"' readonly='readonly' value='"+description
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
function showVideos() {

//判断videoTable是否已被初始化，防止重复架子啊
if ($("#videoTable").hasClass('dataTable')){
    $('#videoTable').dataTable().fnClearTable();    //清空数据
    $('#videoTable').dataTable().fnDestroy();         //销毁datatable
}

$("#videoTable").dataTable({

    "bLengthChange": false,
    "bFilter": false, //搜索栏
    "bInfo": false,
    "sPaginationType": "full_numbers",
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

    console.log("videoId:"+id);
    console.log("unitId:"+unit_id);

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
function showKPs(unit_id) {

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

            $("#KPList").empty();

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

//更新教学单元基本信息
function updateUnit() {
    $.ajax({
        url: localaddr + '/updateUnit',
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
            "id": unit_id,
            "number":$("#unitNumber").val(),
            "name":$("#unitName").val(),
            "content":$("#unitContent").val()
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

//弹出资料选择框
function uploadOfficeSelect() {
    var f = document.getElementById("file");
    f.click();
}

//上传教学单元资料
function uploadOffice() {

    var formData = new FormData($( "#uploadOfficeForm")[0]);

    $.ajax({
        url: '/file/office',
        type: 'post',
        timeout: 5000,
        contentType: false,
        processData: false,
        async: false,
        cache: false,
        data:formData,
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

    var office_ids=new Array();
    office_ids[0]=office_id.toString();

    $.ajax({
        url: '/bindUnit_offices',
        type: 'post',
        dataType: 'json',
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        data:JSON.stringify({
            "unit_id":unit_id,
            "office_ids":office_ids
        }),
    })

        .done(function (data) {

            alert(data.message);
            showOffices(unit_id);

        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });
}

//弹出视频选择框
function uploadVideoSelect() {
    var f = document.getElementById("videoFile");
    f.click();
}

//上传视频
function uploadVideo() {

    var formData = new FormData($( "#uploadVideoForm" )[0]);
    $.ajax({
        url: '/file/video',
        type: 'post',
        timeout: 5000,
        contentType: false,
        processData: false,
        async: false,
        cache: false,
        data:formData,
    })

        .done(function (data) {

            console.log(data);
            bindingVideo(data.data.id);

        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });
}

//绑定教学单元与资料
function bindingVideo(video_id) {

    $.ajax({
        url: '/bindUnit_video',
        type: 'post',
        dataType: 'json',
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        data:JSON.stringify({
            "unit_id":unit_id,
            "video_id":video_id.toString()
        }),
    })

        .done(function (data) {

            alert(data.message);
            showVideos(unit_id);

        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });
}