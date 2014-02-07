
$(document).ready(function() {
	
	$('.refreshSelectElement').click(function(){
		
		var select = $(this).attr('type');
		var optionSelected = $('#' + select).val();
		
		$('#' + select).hide();
		
		$.ajax({
            url: "http://localhost/zf/public/item/ajaxrefreshselectelement",
            type: 'POST',
			data: { selectElement: select,
					optionSelected: optionSelected
					},
            success: function(response)
			{
            	$('#' + select).html(response);	
            	$('#' + select).show();
            },
            error: function(request, textStatus, errorThrown)
			{
                message = (request.status == 403) ? request.responseText : message;
                alert(message);
            }
        });		
	} );
	
	$('select').each(function(){
		
		var selectType = $(this).attr('name');
		var id = 'refresh_' + selectType;
		
		// Avoid create more than one link per select element
		if(! $('#' + id).length )
			$(this).after(" <a href='javascript:void(0)' id='"+ id +"' class='refreshSelectElement' type='"+ selectType +"'>Resfrescar</a> ");
	});

});