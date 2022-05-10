var $ = jQuery.noConflict();

$(document).ready((function(e) {
	let colors = ['black', 'blue', 'green', 'orange', 'darkred'];
	let lvl_colors = ['pink', 'aqua', 'darkred'];
  var uuid = "";
  var comp = "";
  var lvl  = "";

  uuid = $('#uuid').val();
  showOutcome(uuid);

  $("#comp_select").change(function() {
      comp = $("#comp_select").val();
      lvl  = $("#lvl_select").val();

      uuid = "" + comp + lvl;
      $("#comp_select").removeClass()
      let number = parseInt(comp) - 1
      $("#comp_select").addClass(colors[number])
      showOutcome(uuid);
  });

  $("#lvl_select").change(function() {
      comp = $("#comp_select").val();
      lvl  = $("#lvl_select").val();

      uuid = "" + comp + lvl;
      showOutcome(uuid);
  });

	function showOutcome(uuid){
		$(".outcomes > *").css('display','none');
		$(".outcomes").find(`[data-uuid='${uuid}']`).show();
	}

}));
