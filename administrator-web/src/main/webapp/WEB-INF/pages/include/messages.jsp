<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${codMsg == 1}">
	<div class="alert alert-success">
		<button type="button" class="close" data-dismiss="alert">X</button>
	    ${msg}
	</div>
</c:if>
<c:if test="${codMsg == 2}">
	<div class="alert alert-error">
		<button type="button" class="close" data-dismiss="alert">X</button>
	    ${msg}
	</div>
</c:if>
<c:if test="${codMsg == 3}">
	<div class="alert alert-info">
		<button type="button" class="close" data-dismiss="alert">X</button>
	    ${msg}
	</div>
</c:if>