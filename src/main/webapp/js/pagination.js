/**
 * 前端分页插件
 * 页面只能有一个table展示数据
 * 需添加如下div放分页插件
 * 
 * <div id="pagination" class="pagination pagination-centered">
 * </div>
 * 
 * 用户自己实现addTr函数
 * 使用请参考宕机判断 showDetect.ftl 页面
 * 
 * ruanzf
 * 2013-09-13
 */
var pagination = {
			div:"pagination",			//分页div
			index:1,					//当前页
			count:0,					//总条数
			total:0,					//总页数
			size:20,					//每页大小
			page:5,						//共5个button
			rows:null,					//数据
			init:function(rows) {		//页面初始化，rows 为页面Array数据
				this.rows = rows;
				this.count = rows.length;
				this.index = 1;
				if(this.count%this.size == 0) {
					this.total = parseInt(this.count/this.size);
				}else {
					this.total = parseInt(this.count/this.size) + 1;
				}
				
				this.paint();
				this.paging(1);
			},
			
			paint:function() {
			
				$("#pageul").remove();
				$("#search_size").remove();
				var index = this.index;
				var pageSize = this.page;
				if(this.total < this.page) {
					pageSize = this.total;
				}
				
				var edgeSize = (this.page - 1)/2;
				if(this.index <= edgeSize) {
					index = 1;
				}else if(this.index >= (this.total - edgeSize)){
					index = this.total - this.page;
					if(index < 1) {
						index = 1;
					}else {
						pageSize = index + this.page;
					}
				}else {
					index = this.index - edgeSize;
					pageSize = this.index + edgeSize;
				}

				var li = "<li><a href='#'>" + this.count + " 条记录，共 " + this.total +"页 </a><li>";
				li += "<li><a href='#' onclick='pagination.paging(1)'>«</a></li>";
				
				for(i=index;i<=pageSize;i++) {
					if(i == this.index) {
						li += "<li class='active'><a href='#' onclick='pagination.paging("+i+")' >" +i+ "</a></li>";
					}else {
						li += "<li><a href='#' onclick='pagination.paging("+i+")' >" +i+ "</a></li>";
					}
				}
				
				li += "<li><a href='#' onclick='pagination.paging("+this.total+")'>»</a></li>";
				var searchSize = "<div id='search_size' class='btn-group dropup'>"
					+ "<ul id='search_size' class='dropdown-menu' role='menu'>"
					+ "<li><a href='#' onclick='pagination.switchSize(20)'>20</a></li>"
					+ "<li><a href='#' onclick='pagination.switchSize(50)'>50</a></li>"
					+ "<li><a href='#' onclick='pagination.switchSize(1000)'>全部</a></li>"
					+ "</ul>"
					+ "<button type='button' class='btn btn-default dropdown-toggle' data-toggle='dropdown'>"
					+ this.size + "<span class='caret'></span>"
					+ "</button>"
					+ "</div>";
				var page = "<ul class='pagination' id='pageul'>" + li + "</ul>";
				$("#" + this.div).append(page);
				$("#" + this.div).append(searchSize);
			},
			
			paging:function(index){
				this.index = index;
				this.paint();
				
				index--;
				$("tbody tr").remove();
			
				var begin = index*this.size;
				var end = (1+index)*this.size;
				if(this.count < end){
					end = this.count;
				}
				for(i=begin;i<end;i++) {
					this.addTr(this.rows[i]);
				}
			},
			
			addTr:null,
			switchSize:function(size){
				this.size = size;
				this.init(this.rows);
			}
		}
