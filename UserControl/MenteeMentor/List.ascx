<%@ Control Language="C#" AutoEventWireup="true" CodeFile="List.ascx.cs" Inherits="UserControl_MenteeMentor_List" %>

<%--<script src="/js/dwj-menteementor.js"></script>--%>
<script src="/js/jquery.mixitup.min.js"></script>
<script>
	$(function () {
		// init filtering
		$('#mixitup-container').mixitup();

		$(".mentor-list a").click(function () {
			$(".mentor-list ul li").removeClass("active");
			$(this).parent("li").addClass("active");

			var mentorAsJson = $(this).data("user"); //alert("Bio: " + mentorAsJson['Bio']);

			$("#mentor-detail input").val(mentorAsJson['UserId']);
			$("#mentor-detail h3").html(mentorAsJson['Name']);
			$("#mentor-detail .subtitle em").html(mentorAsJson['Company']);
			$("#mentor-detail div strong").html(mentorAsJson['Industries']);
			$("#mentor-detail p").html(mentorAsJson['Bio']);
			$("#mentor-detail a.btn").html("Connect with " + mentorAsJson['Name']);
		});
	});
</script>

<h1>Connect with a Mentor</h1>
<asp:Repeater ID="repeaterFilter" runat="server">
	<ItemTemplate>
		<a href="javascript://;" class="btn filter" data-filter="<%# Eval("ID") %>"><%# Eval("Name") %></a>
	</ItemTemplate>
</asp:Repeater>

<h2>Available Mentors</h2>

<fieldset id="mixitup-container">
	<%--<legend>Mentors</legend>--%>
	<div class="mentor-list left">
		<%--<strong>Mentor List</strong>--%>
		<ul><asp:Literal ID="literalMentorList" runat="server"></asp:Literal></ul>
	</div>

	<div class="mentor-list right">
		<%--<strong>Mentor Details</strong>--%>
		<div id="mentor-detail">
			<input type="hidden" value="" />
			<h3>My Name</h3>
			<div class="subtitle"><em>Company Name</em></div>
			<div><strong>Here, are, some, industries</strong></div>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sed lacus vitae quam malesuada rhoncus id a diam. Sed nisi turpis, sodales euismod lobortis sed, rutrum et ligula. Mauris ut eros ipsum, tristique convallis libero. Nullam pharetra, nibh vel vestibulum pellentesque, velit lacus ultricies nibh, vitae porta turpis sapien ac orci. Pellentesque pellentesque elementum massa a euismod. Etiam elit dolor, accumsan non sagittis eget, viverra in est. Praesent interdum aliquet odio, nec adipiscing dui adipiscing sit amet. Nulla facilisi. Fusce nec sem nibh. In nec turpis mauris, vitae pulvinar enim. Curabitur accumsan purus sed dui malesuada faucibus. Quisque rhoncus facilisis ante quis ultrices.</p>
			<a class="btn">Connect with My Name</a>
		</div>
	</div>

</fieldset>