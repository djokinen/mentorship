<%@ Control Language="C#" AutoEventWireup="true" CodeFile="List.ascx.cs" Inherits="UserControl_MenteeMentor_List" %>

<script src="/js/jquery.mixitup.min.js"></script>
<script>
	$(function () {
		// init filtering
		$('#mixitup-container').mixitup();

		$(".mentor-list.left a").click(function () {
			$(".mentor-list ul li").removeClass("active");
			$(this).parent("li").addClass("active");

			var mentorAsJson = $(this).data("user"); //alert("Bio: " + mentorAsJson['Bio']);

			//alert("li pre csid: " + mentorAsJson['ConnectionStatusId']);
			//alert("frm pre csid: " + $("#mentor-detail").data("connectionstatusid"));

			//alert("li pre userid: " + mentorAsJson["UserId"]);
			//alert("frm pre userid: " + $("#mentor-detail").data("userid"));

			$("#mentor-detail").data("userid", mentorAsJson["UserId"]);
			$("#mentor-detail").data("connectionstatusid", mentorAsJson['ConnectionStatusId']);

			//alert("li post csid: " + mentorAsJson['ConnectionStatusId']);
			//alert("frm post csid: " + $("#mentor-detail").data("connectionstatusid"));

			//alert("li post userid: " + mentorAsJson["UserId"]);
			//alert("frm post userid: " + $("#mentor-detail").data("userid"));

			$("#mentor-detail h3").html(mentorAsJson['Name']);
			$("#mentor-detail .subtitle em").html(mentorAsJson['Company']);
			$("#mentor-detail div strong").html(mentorAsJson['Industries']);
			$("#mentor-detail p").html(mentorAsJson['Bio']);
			$("#mentor-detail a.btn").html("Connect with " + mentorAsJson['Name']);
		});

		$("#mentor-detail a.connect").click(function () {
			var userid = $("#mentor-detail").data("userid");
			// var connectionstatusid = $("#mentor-detail").data("connectionstatusid");
			_connectWithMentor(userid);
		});
	});

	function _connectWithMentor(userIdMentor) {
		WebService.ConnectWithMentor(userIdMentor, _connectWithMentorCallback);
	};

	function _connectWithMentorCallback(retval) {
		alert("return value: " + retval + "\nuse return value to set li and div data attr");
	}
</script>

<style type="text/css">
	.btn rejected {
		background-color: #f00;
	}
	.btn accepted {
		background-color: #0f0;
	}
</style>

<h1>Connect with a Mentor</h1>
<asp:Repeater ID="repeaterFilter" runat="server">
	<ItemTemplate>
		<a href="javascript://;" class="btn filter" data-filter="<%# Eval("ID") %>"><%# Eval("Name") %></a>
	</ItemTemplate>
</asp:Repeater>

<h2>Available Mentors</h2>

<fieldset id="mixitup-container">

	<div class="mentor-list left">
		<ul><asp:Literal ID="literalMentorList" runat="server"></asp:Literal></ul>
	</div>

	<div class="mentor-list right">
		<asp:Literal ID="literalMentorDetail" runat="server"></asp:Literal>
	</div>

</fieldset>