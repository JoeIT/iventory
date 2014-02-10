
$(document).ready(function() {
	
	$('.refreshSelectElement').click(function(){
		
		var select = $(this).attr('type');
		var optionSelected = $('#' + select).val();
		var rootPath = $('#SYSTEM_ROOT_PATH').val();
		
		$('#' + select).hide();
		
		$.ajax({
            url: rootPath + "public/item/ajaxrefreshselectelement",
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
                var message = (request.status == 403) ? request.responseText : message;
                alert("Error retrieving select data - " + message);
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