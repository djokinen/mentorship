<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="membership_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>TEST</title>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="/script/industry.js"></script>

	<style type="text/css">
		.list_controls {
			margin: 90px 260px 0;
			text-align: center;
		}

		div.left {
			float: left;
		}

		div.right {
			float: right;
		}

		.member_list ul {
			background-color: #FFFFFF;
			border: 1px solid #999999;
			height: 200px;
			list-style: none outside none;
			margin: 2px 0 0;
			overflow: auto;
			padding: 0;
			width: 240px;
		}

		.member_list li {
			border-bottom: 1px solid #CCCCCC;
			margin: 0;
			/*padding: 0 0 0 4px;*/
			padding: 4px 0px;
		}

		.member_list input[type="checkbox"] {
			/* float: right; */
			/*margin: 7px 10px 0 0;*/
			margin: 6px;
		}

		.member_list ul label {
			/* display: block; */
			/*padding: 5px 10px;*/
			/*width: 160px;*/
		}
	</style>
</head>
<body>
	<form id="form1" runat="server">

		<fieldset>
			<legend>Add Industry</legend>
			<p>All available industries are listed in the left-hand column.</p>
			<div class="member_list left">
				<label>Available Industries:</label>
				<ul class="all_industries">
					<asp:Repeater ID="repeaterAvailable" runat="server">
						<ItemTemplate>
							<li>
								<input type="checkbox" value="<%# Eval("ID") %>" id="<%# Eval("ID") %>" name="<%# Eval("ID") %>">
								<label for="<%# Eval("ID") %>"><%# Eval("Name") %></label>
							</li>
						</ItemTemplate>
					</asp:Repeater>
				</ul>
			</div>
			<div class="member_list right">
				<label>My Industries:</label>
				<asp:HiddenField id="groupMembers" runat="server" />
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

		<asp:Button ID="buttonUpdate" runat="server" Text="Update" />

	</form>
</body>
</html>
