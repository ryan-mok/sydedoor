$(document).ready(function() {
    $('#company').autocomplete({ minLength : 0 }).focus(function() {
        $(this).autocomplete("search");
    });
});
