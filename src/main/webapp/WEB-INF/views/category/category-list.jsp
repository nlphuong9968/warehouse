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
                    <h2>Category List</h2>
                    
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>

                  <div class="x_content">
					<div class="container">
                    	<a href="<c:url value="/category/add"/> " class="btn btn-app"><i class="fa fa-plus"></i>Add</a>
                    </div>
                    <div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            
                            <th class="column-title">#</th>
                            <th class="column-title">Id</th>
                            <th class="column-title">Code</th>
                            <th class="column-title">Name</th>
                            <th class="column-title">Description</th>
                            <th class="column-title no-link last text-center" colspan="3"><span class="nobr">Action</span>
                            </th>
                            
                          </tr>
                        </thead>

                        <tbody>
                        	<c:forEach items="${categories }" var="category" varStatus="loop">
                        		<c:choose>
                        			<c:when test="${loop.index%2==0 }">
                        				<tr class="even pointer">
                        			</c:when>
                        			<c:otherwise>
                        				<tr class="odd pointer">
                        			</c:otherwise>
                        		</c:choose>
                        		<td class=" ">${loop.index+1}</td>
	                            <td class=" ">${category.id }</td>
	                            <td class=" ">${category.code }</td>
	                            <td class=" ">${category.name }</td>
	                            <td class=" ">${category.description }</td>
	                            <td class="text-center"><a class="btn btn-round btn-info" href="<c:url value="/category/view/${category.id }"/> ">View</a></td>
	                            <td class="text-center"><a class="btn btn-round btn-primary" href="<c:url value="/category/edit/${category.id }"/> ">Edit</a></td>
	                            <td class="text-center"><a class="btn btn-round btn-danger" href="javascript:void(0);" onclick="confirmDelete(${category.id })" >Delete</a></td>
                        	</c:forEach>
                        </tbody>
                      </table>
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
function confirmDelete(id){
	if(confirm('Do you want delete this record?')){
		window.location.href = '<c:url value="/category/delete/"/>'+id;
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