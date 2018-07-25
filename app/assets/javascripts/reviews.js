$(document).ready(function() {
    $('#review_company').autocomplete({ minLength : 0 }).focus(function() {
        $(this).autocomplete("search");
    });
});
