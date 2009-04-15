var mt = {};
mt.forms = {};
/*
 * Sets errors on AJAX forms from response text
 * @param envelope response envelope
 */
mt.forms.displayRecordErrors = function(prefix, envelope) {
  errors = envelope.errors;
  if (errors.length > 0) {
    
    // clean up previous errors
    $(".error-field").removeClass('error-field');
    $("span.error-explanation").remove();

    for (var i = 0; i < errors.length; i++) {
      var field = $("#" + prefix + "_" + errors[i][0]);
      field.addClass('error-field');
      field.after("<br/><span class=\"error-explanation\">" + errors[i][0] + " - " + errors[i][1] + "</span>");
    }
  }
  return false;
}
