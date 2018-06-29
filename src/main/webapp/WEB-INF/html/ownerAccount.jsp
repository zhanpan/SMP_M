<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
	+ request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html class=" js csstransforms3d">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>业主管理</title>
<link rel="stylesheet" type="text/css" href="static/css/base.css">
<link rel="stylesheet" type="text/css" href="static/css/page.css">
<link rel="stylesheet" type="text/css" href="static/js/bootstrap_3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="static/js/bs_pagination/css/jquery.bs_pagination.min.css">
<link rel="stylesheet" type="text/css" href="static/js/bootstrap-table/src/bootstrap-table.css">
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/json2.js"></script>
<script type="text/javascript" src="static/js/main.js"></script>
<script type="text/javascript" src="static/js/modernizr.js"></script>
<script type="text/javascript" src="static/js/bootstrap_3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/bs_datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="static/js/bs_datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="static/js/bs_pagination/js/jquery.bs_pagination.min.js"></script>
<script type="text/javascript" src="static/js/bs_pagination/js/localization/en.js"></script>
<script type="text/javascript" src="static/js/bootstrap-table/src/bootstrap-table.js"></script>
<script type="text/javascript" src="static/js/bootstrap-table/src/locale/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript" src="static/js/json2.js"></script>
<script type="text/javascript" src="static/js/main_min.js"></script>
<script type="text/javascript" src="static/js/Ewin.js"></script>
<script type="text/javascript" src="static/js/toastr.js"></script>
</head>

<body style="background: #f6f5fa;">
	<!--content S-->
	<div class="super-content">
		<div class="superCtab">
			<div class="ctab-title clearfix">
				<h3>业主管理</h3>
				<!--选择小区下拉框 -->
				<div class="select_dis"></div> 
			</div>
			<!-- 导航栏 ↓-->
			<div class="ctab-Main">
				<div class="ctab-Main-title">
					<ul class="clearfix">
						<li id="checkin" class="cur"><a>已入住</a></li>
						<li id="nocheck"><a>未入住</a></li>
					</ul>
				</div>
			</div>
			<!-- 导航栏 ↑-->
			<div class="ctab-Main">
				<div class="ctab-Mian-cont">
					<div class="Mian-cont-btn clearfix">
						<!-- 添加业主按钮 -->
						<div class="operateBtn"></div>
						<div class="searchBar">
							<input type="text" id="searchText" class="form-control srhTxt"
								placeholder="输入标题关键字搜索">
							<button id="searchBtn" type="button" class="srhBtn"></button>
						</div>
					</div>

					<!-- 添加业主管理模态框 -->
					<div class="modal fade" id="createOwnerAccountModal" role="dialog">
						<div class="modal-dialog" role="document" style="width: 65%;">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title">添加信息<span>必须输入姓名!</span><span>必须输入电话号码!</span><span>必须输入地址!</span></h4>
								</div>
								<div class="modal-body-title">
									<form class="form-horizontal" role="form">
										<div class="form-group">
											<label for="addOwnerAccountName" class="control-label">业主姓名</label>
											<div style="width: 70%;">
												<input style="margin-bottom: 15px;" type="text"
													class="form-control"
													onkeyup="value=value.replace(/[\d]/g,'')"
													id="addOwnerAccountName" maxlength="8">
											</div>
											<label for="addOwnerAccountTelphone" class="control-label">业主电话</label>
											<div style="width: 70%;">
												<input type="text" class="form-control"
													onkeyup="value=value.replace(/\D/,'')"
													id="addOwnerAccountTelphone" maxlength="11">
											</div>
										</div>
										<div class="form-group">
											<label for="addOwnerAccountUnits" class="control-label">住址</label>
											<div class="form-control-3"
												style="width: 50%; white-space: nowrap;">
												<input type="text" class="Address" id="ondong"
													onkeyup="value=value.replace(/[\W]/g,'')">栋 <input
													type="text" class="Address" id="onzuo"
													onkeyup="value=value.replace(/[\W]/g,'')">座 <input
													type="text" class="Address" id="onroom"
													onkeyup="value=value.replace(/[\W]/g,'')">房
											</div>
										</div>
									</form>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button id="saveCreateOwnerAccountBtn" type="button"
										class="btn btn-primary">保存</button>
								</div>
							</div>
						</div>
					</div>

					<!-- 编辑业主管理模态框 -->
					<div class="modal fade" id="editOwnerAccountModal" role="dialog">
						<div class="modal-dialog" role="document" style="width: 65%;">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title">修改信息<span>必须输入地址!</span></h4>
								</div>
								<div class="modal-body-title">
									<form class="form-horizontal" role="form">
										<input id="update" type="hidden">
										<div class="form-group">
											<label for="editOwnerAccountName" class="control-label">业主姓名</label>
											<div style="width: 70%;">
												<input style="margin-bottom: 15px;" type="text" readonly="readonly"
													maxlength="8" class="form-control"
													onkeyup="value=value.replace(/[\d]/g,'')"
													id="editOwnerAccountName">
											</div>
											<label for="editOwnerAccountTelphone" class="control-label">联系电话</label>
											<div style="width: 70%;">
												<input type="text" class="form-control" readonly="readonly"
													onkeyup="value=value.replace(/\D/,'')"
													id="editOwnerAccountTelphone" maxlength="11">
											</div>
										</div>

										<div class="form-group">
											<label for="editOwnerAccountUnits" class="control-label">住址</label>
											<div style="width: 70%;">
												<div class="form-control-3"
													style="width: 70%; white-space: nowrap;">
													<input type="text" class="Address" id="editdong"
														onkeyup="value=value.replace(/[\W]/g,'')">栋 <input
														type="text" class="Address" id="editzuo"
														onkeyup="value=value.replace(/[\W]/g,'')">座 <input
														type="text" class="Address" id="editroom"
														onkeyup="value=value.replace(/[\W]/g,'')">房
												</div>
											</div>
										</div>
									</form>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button id="saveEditOwnerAccountBtn" type="button"
										class="btn btn-primary">保存</button>
								</div>
							</div>
						</div>
					</div>
<!--************************ 已入住****************************** -->
					<div class="Mian-cont-wrap-owner1">
						<div class="defaultTab-T">
							<table border="0" cellspacing="0" cellpadding="0"
								class="defaultTable">
								<tbody>
									<tr>
										<th class="t_0_q_5">编号ID</th>
										<th class="t_1_q">业主姓名</th>
										<th class="t_1_q_5">联系电话</th>
										<th class="t_2_q">住址</th>
										<th class="t_1_q">住房状态</th>
										<th class="t_2_q">入住时间</th>
										<th class="t_2_q_cz">操作</th>
									</tr>
								</tbody>
							</table>

						</div>
						<div class="default" style="height: 540px; overflow: scroll;">
							<table border="0" cellspacing="0" cellpadding="0"
								class="defaultTable defaultTable2" id="ownerAccountBody">
							</table>
						</div>
						<!--pages S-->
						<div id="pageNoDiv" class="pageSelect"></div>
						<!--pages E-->
					</div>
				</div>
			</div>
		</div>
		<!--main-->
	</div>
<script type="text/javascript">
    
	/* 页面权限设置 */
    var type = '${type}';
	if(type==2){
		var htmlStr='';
		 htmlStr +='<select id="select_head" class="select_head" onchange="propertyManagementSysNotice(this.value)"><option>全部</option><c:forEach var="item" items="${pmd }" varStatus="status"><option value="${item.id }">${item.management_department_name }</option></c:forEach></select>';
		 $(".select_dis").html(htmlStr);
	}
	if (type == 3) {
		var htmlStr='';
        $(".t_2_q_cz").css("display", "block");
         htmlStr +='<button id="createOwnerAccountBtn" type="button"class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span>添加业主</button>';
        $(".operateBtn").html(htmlStr);
    }
    $('.ctab-Main-title li').click(function() {
        $(this).addClass('cur').siblings().removeClass('cur');
    });
    
    var token = '${token}';
    var isliving = 1; //默认为在居住状态
    var temp1 = 0;
    var pagenum1 = 1;
    /* 获取下拉框value */
    function propertyManagementSysNotice(val){
		var val;
		if(isliving==1){
			isliving = 1;
			display(1, 10);
			}
		else if(isliving==0){
			isliving = 0;
			displaycheckin(1,10);
		}
 		temp = 0;
 		pagenum = 1; 
    }
    /* 显示未入住业主数据 */
    function displaycheckin(pageIndex, pageSize) {
        var searchValue = $("#searchText").val();
        var userName = "";
        var telphone = "";
        var pmid=$("#select_head").val();
        isliving = 0;
		if(pmid=="全部")
			{
				pmid="";
			} 
        
        if (/^[1][3,4,5,7,8][0-9]{9}$/.test(searchValue)) {
            telphone = searchValue;
        } else if (/^([\u4E00-\uFA29]|[\uE7C7-\uE7F3]|[a-zA-Z0-9])*$/.test(searchValue)) {
            userName = searchValue;
        }

        var jsonString = {
            "pageIndex": pageIndex,
            "pageSize": pageSize,
            "isliving": isliving,
            "userName": userName,
            "telphone": telphone,
            "token": token,
            "pmid":pmid
        };

		var status = isliving==1?"已入住":"未入住";
		
        var json = JSON.stringify(jsonString);
        $.ajax({
            url: "queryOwnerAccount",
            data: json,
            contentType: "application/json",
            dataType: "json",
            type: "post",
            success: function(data) {
                var htmlStr = '';
                $.each(data.data.obj,
                function(index, obj) {
                    temp1 += 1;
                    htmlStr += '<tr>';
                    htmlStr += '<td class="t_0_q_5" value=' + obj.id + '>' + temp1 + '</td>';
                    htmlStr += '<td class="t_1_q">' + obj.ownername + '</a></td>';
                    htmlStr += '<td class="t_1_q_5">' + obj.telphone + '</td>';
                    htmlStr += '<td class="t_1_q">' + obj.units + obj.rooms + '房' + '</td>';
                    htmlStr += '<td class="t_1_q">' + status + '</td>';
                    htmlStr += '<td class="t_1_q_5">' + obj.leave_time + '</td>';
                    htmlStr += '<td class="t_1_q_5">' + obj.create_time + '</td>';
                   /*  if (type == 3) {
                        htmlStr += '<td class="t_2_q"><div class="btn_gonggao">' + '<button onclick="editOwnerAccount(' + obj.id + ')" type="button" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> 修改</button>' + '<button onclick="deleteOwnerAccount(' + obj.id + ')" type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button></div></td>';
                    } */
                    htmlStr += '</tr>';
                });
                $("#ownerAccountBody").html(htmlStr);

                //隔行换颜色
                $("#ownerAccountBody tr:odd").addClass("active");

                /* 显示翻页信息 */
                /* 总页数  */
                var totalPages = data.totalPageCount;

                $("#pageNoDiv").bs_pagination({
                    currentPage: pageIndex,
                    //当前页号
                    rowsPerPage: pageSize,
                    //每页显示条数
                    totalRows: data.record,
                    //总条数
                    totalPages: totalPages,
                    //总页数
                    visiblePageLinks: 5,
                    //最多显示的卡片数
                    showGoToPage: true,
                    //是否显示跳转到第几页
                    showRowsPerPage: true,
                    //是否显示每页显示条数
                    showRowsInfo: true,
                    //是否显示记录信息 */
                    //用来监听页号切换的事件，event就是代表这个事件，pageObj代表页信息
                    onChangePage: function(event, pageObj) { // returns page_num and rows_per_page after a link has clicked
                    temp1 = (pageObj.currentPage - 1) * (pageObj.rowsPerPage);
                        displaycheckin(pageObj.currentPage, pageObj.rowsPerPage);
                        pagenum1 = pageObj.currentPage;
                    }
                });
            }
        });
    };

    /* 编辑用户 */
    function editOwnerAccount(id) {
        $("#update").val(id);
        $.ajax({
            url: "editOwnerAccountInfo",
            data: {
                "id": id
            },
            dataType: "json",
            type: "post",
            success: function(data) {
                $("#editOwnerAccountName").val(data.data.ownername);
                $("#editOwnerAccountTelphone").val(data.data.telphone);
                $("#editdong").val(data.data.dong);
                $("#editzuo").val(data.data.zuo);
                $("#editroom").val(data.data.rooms);
                $("#editOwnerAccountModal").modal("show");
            }
        });
    };

    /* 删除用户 */
    function deleteOwnerAccount(id) {

        Ewin.confirm({
            message: "确认要删除业主信息吗？"
        }).on(function(e) {
            if (!e) {
                return;
            }
            $.ajax({
                url: "deleteOwnerAccountInfo",
                data: {
                    "id": id
                },
                dataType: "json",
                type: "post",
                success: function(data) {
                    if (data.code == "200") {
                        var rowsPerPage = $("#pageNoDiv").bs_pagination('getOption', 'rowsPerPage');
                        temp = (pagenum - 1) * rowsPerPage;
                        if(isliving==1){
                        		display(1, $("#pageNoDiv").bs_pagination('getOption', 'rowsPerPage'));
                        	}
                        else{
                        	displaycheckin(1, $("#pageNoDiv").bs_pagination('getOption', 'rowsPerPage'));
                        }
                        
                    } else {
                        toastr.error('Error');
                    }
                }
            });
        });
    }

    display(1, 10);
    var temp = 0;
    var pagenum = 1;
    /* 显示已入住业主数据 */
    function display(pageIndex, pageSize) {
        var searchValue = $("#searchText").val();
        var userName = "";
        var telphone = "";
        var pmid=$("#select_head").val();
        isliving = 1; 
		if(pmid=="全部")
		{
			pmid="";
		} 
        if (/^[1][3,4,5,7,8][0-9]{9}$/.test(searchValue)) {
            telphone = searchValue;
        } else if (/^([\u4E00-\uFA29]|[\uE7C7-\uE7F3]|[a-zA-Z0-9])*$/.test(searchValue)) {
            userName = searchValue;
        }

        var jsonString = {
            "pageIndex": pageIndex,
            "pageSize": pageSize,
            "isliving": isliving,
            "userName": userName,
            "telphone": telphone,
            "token": token,
            "pmid":pmid
        };
		var status = isliving==1?"已入住":"未入住";
        var json = JSON.stringify(jsonString);
        $.ajax({
            url: "queryOwnerAccount",
            data: json,
            contentType: "application/json",
            dataType: "json",
            type: "post",
            success: function(data) {
                var htmlStr = '';
                $.each(data.data.obj,
                function(index, obj) {
                    temp += 1;
                    htmlStr += '<tr>';
                    htmlStr += '<td class="t_0_q_5" value=' + obj.id + '>' + temp + '</td>';
                    htmlStr += '<td class="t_1_q">' + obj.ownername + '</a></td>';
                    htmlStr += '<td class="t_1_q_5">' + obj.telphone + '</td>';
                    htmlStr += '<td class="t_2_q">' + obj.units + obj.rooms + '房' + '</td>';
                    htmlStr += '<td class="t_1_q">' + status + '</td>';
                    htmlStr += '<td class="t_2_q">' + obj.create_time + '</td>';
                    if (type == 3) {
                        htmlStr += '<td class="t_2_q"><div class="btn_gonggao">' + '<button onclick="editOwnerAccount(' + obj.id + ')" type="button" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> 修改</button>' + '<button onclick="deleteOwnerAccount(' + obj.id + ')" type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button></div></td>';
                    }
                    htmlStr += '</tr>';
                });
                $("#ownerAccountBody").html(htmlStr);

                //隔行换颜色
                $("#ownerAccountBody tr:odd").addClass("active");

                /* 显示翻页信息 */
                /* 总页数  */
                var totalPages = data.totalPageCount;

                $("#pageNoDiv").bs_pagination({
                    currentPage: pageIndex,
                    //当前页号
                    rowsPerPage: pageSize,
                    //每页显示条数
                    totalRows: data.record,
                    //总条数
                    totalPages: totalPages,
                    //总页数
                    visiblePageLinks: 5,
                    //最多显示的卡片数
                    showGoToPage: true,
                    //是否显示跳转到第几页
                    showRowsPerPage: true,
                    //是否显示每页显示条数
                    showRowsInfo: true,
                    //是否显示记录信息 */
                    //用来监听页号切换的事件，event就是代表这个事件，pageObj代表页信息
                    onChangePage: function(event, pageObj) { // returns page_num and rows_per_page after a link has clicked
                        temp = (pageObj.currentPage - 1) * (pageObj.rowsPerPage);
                        display(pageObj.currentPage, pageObj.rowsPerPage);
                        pagenum = pageObj.currentPage;
                    }
                });
            }
        });
    };

    $(function() {
        /* 保存编辑 */
        $("#saveEditOwnerAccountBtn").click(function() {
            var id = $("#update").val();
            var dong = $("#editdong").val();
            var zuo = $("#editzuo").val();
            var room = $("#editroom").val();

            if (dong == '' || zuo == '' || room == '') {
                $(".modal-title").find("span:eq(0)").css("display", "block");
                return false
            } else {
                $(".modal-title").find("span:eq(0)").css("display", "none");
            }
            var JsonString = {
                "id": id,
                "dong": dong,
                "zuo": zuo,
                "room": room
            };

            var json = JSON.stringify(JsonString);
            $.ajax({
                url: "saveEditOwnerInfo",
                data: json,
                contentType: "application/json",
                dataType: "json",
                type: "post",
                success: function(data) {
                    if (data.code == "200") {
                        var rowsPerPage = $("#pageNoDiv").bs_pagination('getOption', 'rowsPerPage');
                        temp = (pagenum - 1) * rowsPerPage;
                        if(isliving==1){
                    		display(1, $("#pageNoDiv").bs_pagination('getOption', 'rowsPerPage'));
                    	}
                   		else{
                        	displaycheckin(1, $("#pageNoDiv").bs_pagination('getOption', 'rowsPerPage'));
                  		}
                        $("#editOwnerAccountModal").modal("hide");
                    } else {
                        alert("更新失败");
                        $("#editOwnerAccountModal").modal("show");
                    }
                }
            });
        });

        /* 添加业主 */
        $("#createOwnerAccountBtn").click(function() {
            $("#createOwnerAccountModal").modal("show");
        });

        /* 保存添加业主信息 */
        $("#saveCreateOwnerAccountBtn").click(function() {
            var userName = $("#addOwnerAccountName").val();
            var telphone = $("#addOwnerAccountTelphone").val();
            var dong = $("#ondong").val();
            var zuo = $("#onzuo").val();
            var room = $("#onroom").val();
            if (userName == '') {
                $(".modal-title").find("span:eq(0)").css("display", "block");
                $(".modal-title").find("span:eq(1),span:eq(2)").css("display", "none");
                return false;
            } else if (telphone == '') {
                $(".modal-title").find("span:eq(1)").css("display", "block");
                $(".modal-title").find("span:eq(0),span:eq(2)").css("display", "none");
                return false;
            } else if (dong == '' || zuo == '' || room == '') {
                $(".modal-title").find("span:eq(2)").css("display", "block");
                $(".modal-title").find("span:eq(0),span:eq(1)").css("display", "none");
                return false;
            } else {
                $(".modal-title").find("span:eq(0),span:eq(1),span:eq(2)").css("display", "none");
            }
            var JsonString = {
                "userName": userName,
                "telphone": telphone,
                "dong": dong,
                "zuo": zuo,
                "room": room,
                "token": token
            };
            var json = JSON.stringify(JsonString);
            $.ajax({
                url: 'addOwnerAccount',
                data: json,
                contentType: 'application/json',
                dataType: 'json',
                type: 'post',
                success: function(data) {
                    if (data.code == "200") {
                        $("#addOwnerAccountName").val("");
                        $("#addOwnerAccountTelphone").val("");
                        $("#ondong").val("");
                        $("#onzuo").val("");
                        $("#onroom").val("");
                        /* 保存成功 */
                        var rowsPerPage = $("#pageNoDiv").bs_pagination('getOption', 'rowsPerPage');
                        temp = (pagenum - 1) * rowsPerPage;
                        if(isliving==1){
                    		display(1, $("#pageNoDiv").bs_pagination('getOption', 'rowsPerPage'));
                    	}
                   		else{
                        	displaycheckin(1, $("#pageNoDiv").bs_pagination('getOption', 'rowsPerPage'));
                  		}
                        $("#createOwnerAccountModal").modal("hide");
                    } else {
                        alert("保存失败");
                        $("#createOwnerAccountModal").modal("show");
                    }
                }
            });
        });
    });
    /* 搜索业主信息  */
    $("#searchBtn").click(function() {
    	if(isliving == 1){
    		temp = 0;
            pagenum = 1;
    		display(1, 10);
    	}else if(isliving == 0){
            temp1 = 0;
            pagenum1 = 1;
    		displaycheckin(1, 10);
    	}
    });
    $('#checkin').click(function() {
        var tbody = '<tbody>' + +'<tr>' + '	<th class="t_0_q_5">编号ID</th>' + '	<th class="t_1_q">业主姓名</th>' + '	<th class="t_1_q_5">联系电话</th>' + '	<th class="t_2_q">住址</th>' + '	<th class="t_1_q">住房状态</th>' + '<th class="t_2_q">入住时间</th>' +'<th class="t_2_q_cz">操作</th> '+'</tr>' + '</tbody>';
        
        $(".defaultTable").html(tbody);
        $("#ownerAccountBody").html('');
        if (type == 3) {
            $(".t_2_q_cz").css("display", "block")
        }
        temp = 0;
        pagenum = 1;
        isliving = 1;
        display(1, 10);
    });
    $('#nocheck').click(function() {

        var tbody = '<tbody>' + +'<tr>' + '	<th class="t_0_q_5">编号ID</th>' + '	<th class="t_1_q">业主姓名</th>' + '	<th class="t_1_q_5">联系电话</th>' + '	<th class="t_1_q">住址</th>' + '	<th class="t_1_q">住房状态</th>' + '	<th class="t_1_q_5">入住时间</th>' + '	<th class="t_1_q_5">退房时间</th>' + '	<th class="t_2_q_cz">操作</th>' + '</tr>' + '</tbody>';
        $(".defaultTable").html(tbody);
        $("#ownerAccountBody").html('');
        if (type == 0) {
            $(".t_2_q_cz").css("display", "block")
         }
        temp1 = 0;
        pagenum1 = 1;
        isliving = 0;
        displaycheckin(1, 10);
    })
</script>
</body>
</html>