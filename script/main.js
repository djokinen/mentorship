$(function () {
	$("input:radio[name=roletype]").click(function () {
		// var value = $(this).val();
		$("#hiddenRoleType").val($(this).val());
	});
});