<%@ Control Language="C#" AutoEventWireup="true" CodeFile="List.ascx.cs" Inherits="UserControl_MenteeMentor_List" %>

<script src="/js/dwj-industry.js"></script>
<script src="/js/jquery.mixitup.min.js"></script>
<script>
	$(function () {
		$('#mixitup-container').mixitup();
	});
</script>

<style>
	#mixitup-container .mix {
		opacity: 0;
		display: none;
	}
</style>

<h1>Connect with a Mentor</h1>
<h2>Filter by Industry</h2>
<asp:Repeater ID="repeaterFilter" runat="server">
	<ItemTemplate>
		<a href="javascript://;" class="btn filter" data-filter="<%# Eval("ID") %>"><%# Eval("Name") %></a>
	</ItemTemplate>
</asp:Repeater>

<h3>Mentors</h3>

<fieldset id="mixitup-container">
	<div class="member_list left">
		<label>Available Industries:</label>
		
		<ul class="all_industries">
			<asp:Literal ID="literalMentorList" runat="server"></asp:Literal>
			<asp:Repeater ID="repeaterAvailable" runat="server">
				<ItemTemplate>
					<li class="mix <%# Eval("ID") %>">
						<input type="checkbox" value="<%# Eval("ID") %>" id='<%# Eval("ID") %>' name="<%# Eval("ID") %>">
						<label for="<%# Eval("ID") %>"><%# Eval("Name") %></label>
					</li>
				</ItemTemplate>
			</asp:Repeater>
		</ul>
	</div>
	<div class="member_list right">
		<label>My Industries:</label>
		<asp:HiddenField ID="groupMembers" runat="server" />
		<ul class="group_industries">
			<asp:Repeater ID="repeaterSelected" runat="server">
				<ItemTemplate>
					<li>
						<input type="checkbox" value="<%# Eval("ID") %>" id='<%# Eval("ID") %>' name="<%# Eval("ID") %>">
						<label for="<%# Eval("ID") %>"><%# Eval("Name") %></label>
					</li>
				</ItemTemplate>
			</asp:Repeater>
		</ul>
	</div>
	<div class="list_controls">
		<p><input type="button" id="buttonRight" value="→"></p>
		<p><input type="button" id="buttonLeft" value="←"></p>
	</div>

</fieldset>