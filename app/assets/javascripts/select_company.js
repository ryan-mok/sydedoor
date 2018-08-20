$(document).ready(function(){

$('#continue_button').hide();

$('#company').bind('railsAutocomplete.select', function(event, data){
    $.ajax({
        type: "GET",
        contentType: "application/json; charset=utf-8",
        url: "get_company/"+ data.item.id,
        corssDomain: true,
        dataType: "json",
        success: function (data) {
            $("#company_name").html(data['name']);
            $("#company_description").html(data['description']);
            $("#company_website").html(data['website']);
            $('#continue_button').show();
        },

        error : function(data) {
        }
    });
});
});