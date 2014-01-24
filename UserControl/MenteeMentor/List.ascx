<%@ Control Language="C#" AutoEventWireup="true" CodeFile="List.ascx.cs" Inherits="UserControl_MenteeMentor_List" %>

<script src="/js/jquery.mixitup.min.js"></script>
<script>
	$(function () {
		// init filtering
		$('#mixitup-container').mixitup();

		// add click event to mentor list
		$(".mentor-list.left a").click(function () {
			$(".mentor-list ul li").removeClass("active");
			$(this).parent("li").addClass("active");

			var mentorAsJson = $(this).data("user"); //alert("Bio: " + mentorAsJson['Bio']);
			$("#mentor-detail").data("userid", mentorAsJson["UserId"]);
			$("#mentor-detail").data("connectionstatusid", mentorAsJson['ConnectionStatusId']);
			$("#mentor-detail .title").html(mentorAsJson['Name']);
			$("#mentor-detail .subtitle em").html(mentorAsJson['Company']);
			$("#mentor-detail div strong").html(mentorAsJson['Industries']);
			$("#mentor-detail p").html(mentorAsJson['Bio']);

			/* 
			None = 0, 
			Rejected = -1, 
			Pending = 1, 
			Accepted = 2 */
			switch (mentorAsJson['ConnectionStatusId']) {
				case 1: // pending
					$("#mentor-detail a.btn").hide();
					$("#mentor-detail .status").html("Awaiting approval from mentor");
					break;
				case 2: // accepted
					$("#mentor-detail a.btn").hide();
					$("#mentor-detail .status").html("You are connected to this mentor");
					break;
				case -1: // rejected
					$("#mentor-detail a.btn").hide();
					$("#mentor-detail .status").html("You can not connect to this mentor");
					break;
				default: // none
					$("#mentor-detail a.btn").show();
					$("#mentor-detail .status").html("Connection available");
			}
		});

		$("#mentor-detail a.connect").click(function () {
			$(this).hide();
			$("#cxn-request-form").show();
			// var userid = $("#mentor-detail").data("userid");
			// _connectWithMentor(userid);
		});

		$("#cxn-send-button").click(function () {
			var userid = $("#mentor-detail").data("userid");
		});

		$("#cxn-cancel-button").click(function () {
			$("#mentor-detail a.connect").show();
			$("#cxn-request-form").hide();
		});

	});

	function _connectWithMentorCallback(retval) {
		// int retval = connection status id
		// None = 0, Rejected = -1, Pending = 1, Accepted = 2
		switch (retval) {
			case -1:
				break;
			case 0:
				break;
			case 1:
				$("#cxn-request-form").hide();
				// update title
				break;
			default:

		}
		alert("return value: " + retval + "\nuse return value to set li and div data attr");
	}
</script>

<h2>Connect with a Mentor</h2>
<asp:Repeater ID="repeaterFilter" runat="server">
	<ItemTemplate>
		<a href="javascript://;" class="btn filter" data-filter="<%# Eval("ID") %>"><%# Eval("Name") %></a>
	</ItemTemplate>
</asp:Repeater>

<h3>Available Mentors</h3>

<fieldset id="mixitup-container">

	<div class="mentor-list left">
		<ul><asp:Literal ID="literalMentorList" runat="server"></asp:Literal></ul>
	</div>

	<div class="mentor-list right">
		<asp:Literal ID="literalMentorDetail" runat="server"></asp:Literal>
	</div>

</fieldset>