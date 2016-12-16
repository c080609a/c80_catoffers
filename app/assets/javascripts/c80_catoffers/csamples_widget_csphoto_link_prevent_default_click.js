$(document).ready(function() {
    var $cs_widget = $('.csamples_widget');
    //console.log('<breakpoint>');
    if ($cs_widget.length > 0) {
        var $links = $cs_widget.find('a.lazy-image-wrapper');
        $links.on('click', function (e) {
            e.preventDefault();
        })
    }
});