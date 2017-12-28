<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<c:url value="/js/jquery.multiple.select.js"/>" type="text/javascript"></script>
<%
String id = request.getParameter("id");
%>

<script>
    $(function() {
        $('#ms').change(function() {
            console.log($(this).val());
        }).multipleSelect({
        });

        
        
    });
</script>

		            							<option value="1">January<%=id %></option>
									            <option value="2">February</option>
									            <option value="3">March</option>
									            <option value="4">April</option>
									            <option value="5">May</option>
									            <option value="6">June</option>
									            <option value="7">July</option>
									            <option value="8">August</option>
									            <option value="9">September</option>
									            <option value="10">October</option>
									            <option value="11">November</option>
									            <option value="12">December</option>	
									        