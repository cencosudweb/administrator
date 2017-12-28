$(function(){
	var addUser = function() {
		location.href = "addLog";
		return false;
	};
	
	var exportLog = function() {
		//alert('Export');
		location.href = "downloadExcelLog";
		return false;
	};
	
	var exportCsvLog = function() {
		alert('Export CSV');
		location.href = "viewCSVLog";
		return false;
	};
	
	var exportPdfLog = function() {
		alert('Export PDF');
		location.href = "downloadPDFLog";
		return false;
	};
	
	$("#btn-export-log").button().live('click', exportLog);
	$("#btn-export-csv-log").button().live('click', exportCsvLog);
	$("#btn-export-pdf-log").button().live('click', exportPdfLog);
	
	
	
});
