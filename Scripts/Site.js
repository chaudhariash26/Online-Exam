$(document).ready(function () {
    $('.Email').on('change', function () {
        var value = $(this).val();
        if (/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test(value)) {
            return true;
        } else {
            $(this).val('');
        }
    });

    $('.number').on('change', function () {
        var value = $(this).val();
        if (/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(value)) {
            return true;
        } else {
            $(this).val('');
        }
    });

    $('.number').on('keypress', function (evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode

        if (charCode == 8) {
            return true;
        }
        else if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            if (charCode != 46) {
                return false;
            }
        }
       
        return true;
    });


   
    $('.digit').on('change', function () {
        var value = $(this).val();
        if (/^\d+$/.test(value)) {
            return true;
        } else {
            $(this).val('');
        }
    });

    $('.digit').on('keypress', function (evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode

        if (charCode == 8) {
            return true;
        }
        else if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

        return true;
    });


});