<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="right_col" role="main">
	<div class="">
		<div class="clearfix"></div>
		<div class="col-md-12 col-sm-12  ">
			<div class="x_panel">
				<div class="x_title">
					<h2>Product-Info List</h2>

					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
					</ul>
					<div class="clearfix"></div>
				</div>

				<div class="x_content">
					<div class="container">
						<div class="row" style="text-align: center;">
							<div class="col-md-2 col-sm-2">
								<a href="<c:url value="/product-info/add"/> " class="btn btn-app"><i
									class="fa fa-plus"></i>Add</a>
							</div>

							<form:form modelAttribute="searchForm"
								cssClass="form-horizontal form-label-left"
								servletRelativeAction="/product-info/list/1" method="POST">


								<div class="col-md-2 col-sm-2 item form-group">
								<div class="row">
									<label for="id"
										class="col-form-label col-md-3 col-sm-3 label-align">ID<span
										class="required">*</span></label>
									<div class="col-md-9 col-sm-9 ">
										<form:input path="id" cssClass="form-control " />

									</div>
									</div>
								</div>
								<div class="col-md-3 col-sm-3 item form-group">
								<div class="row">
									<label class="col-form-label col-md-3 col-sm-3 label-align"
										for="code">Code<span class="required">*</span>
									</label>
									<div class="col-md-9 col-sm-9 ">
										<form:input path="code" cssClass="form-control " />

									</div>
									</div>
								</div>
								<div class="col-md-4 col-sm-4 item form-group">
									<div class="row">
									<label class="col-form-label col-md-3 col-sm-3 label-align"
										for="name">Name <span class="required">*</span>
									</label>
									<div class="col-md-9 col-sm-9 ">
										<form:input path="name" cssClass="form-control " />

									</div>
									</div>
									
								</div>

								<div class="col-md-1 col-sm-1 item form-group">
										<div class="col-md-12 col-sm-12 offset-md-3">
										<button type="submit" class="btn btn-success">Search</button>
									</div>
								</div>
							</form:form>
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="table-responsive">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings">

									<th class="column-title">#</th>
									<th class="column-title">Id</th>
									<th class="column-title">Code</th>
									<th class="column-title">Name</th>
									<th class="column-title">Image</th>
									<th class="column-title no-link last text-center" colspan="3"><span
										class="nobr">Action</span></th>

								</tr>
							</thead>

							<tbody>
								<c:forEach items="${productInfos }" var="productInfos"
									varStatus="loop">
									<c:choose>
										<c:when test="${loop.index%2==0 }">
											<tr class="even pointer">
										</c:when>
										<c:otherwise>
											<tr class="odd pointer">
										</c:otherwise>
									</c:choose>
									<td class=" ">${pageInfo.getOffset()+loop.index+1}</td>
									<td class=" ">${productInfos.id }</td>
									<td class=" ">${productInfos.code }</td>
									<td class=" ">${productInfos.name }</td>
									<td class=" "><img width="100px" height="100px" src="<c:url value="${productInfos.imgUrl}" />"></td>									
									<td class="text-center"><a class="btn btn-round btn-info"
										href="<c:url value="/product-info/view/${productInfos.id }"/> ">View</a></td>
									<td class="text-center"><a
										class="btn btn-round btn-primary"
										href="<c:url value="/product-info/edit/${productInfos.id }"/> ">Edit</a></td>
									<td class="text-center"><a
										class="btn btn-round btn-danger" href="javascript:void(0);"
										onclick="confirmDelete(${productInfos.id })">Delete</a></td>
								</c:forEach>
							</tbody>
						</table>
						<jsp:include page="../layout/paging.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	processMessage();
});
function gotoPage(page){
	$("#searchForm").attr('action', '<c:url value="/product-info/list/"/>'+page);
	$("#searchForm").submit();
	
}
function confirmDelete(id){
	if(confirm('Do you want delete this record?')){
		window.location.href = '<c:url value="/product-info/delete/"/>'+id;
	}
};
function processMessage() {
	var msgSuccess = '${msgSuccess}';
	var msgError = '${msgError}';
	if(msgSuccess){
		new PNotify({
            title: 'Success',
            text: msgSuccess,
            type: 'success',
            styling: 'bootstrap3'
        });
	}
	if(msgError){
		new PNotify({
            title: 'Error',
            text: msgError,
            type: 'error',
            styling: 'bootstrap3'
        });
	}
}
</script>