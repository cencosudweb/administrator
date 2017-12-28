function screenBlock() {
	$.blockUI.defaults.css = {
				margin:         0,
	        width:          '180px',
	        height:			'50px', 
	        top:            '35%', 
	        left:           '20%',   
	        textAlign:      'center', 
	        cursor:         'wait',							        
	        border: 'none', 
            padding: '15px', 
            backgroundColor: '#000', 
            '-webkit-border-radius': '10px', 
            '-moz-border-radius': '10px',
            '-o-border-radius': '10px',
            'border-radius': '10px',
            opacity: .5, 
            color: '#fff'
	};
	$.blockUI.defaults.applyPlatformOpacityRules = false;
	
	$.blockUI({ message:  $('#modal')});
	
    setTimeout(function() { 
        $.unblockUI({ 
            onUnblock: function(){ window.location.href='errorHandle.jsp'; } 
        }); 
    }, 360000);
    
    setTimeout(function(){document.forms[0].submit()},100);
}