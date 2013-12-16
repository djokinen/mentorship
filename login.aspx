﻿<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">

	<asp:Login ID="logincontrol" runat="server">
		<LayoutTemplate>
			<table cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
				<tr>
					<td>
						<table cellpadding="0">
							<tr>
								<td align="center" colspan="2">Log In</td>
							</tr>
							<tr>
								<td align="right">
									<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Email Address:</asp:Label>
								</td>
								<td>
									<asp:TextBox ID="UserName" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator CssClass="error" ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="logincontrol">*</asp:RequiredFieldValidator>
								</td>
							</tr>
							<tr>
								<td align="right">
									<asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
								</td>
								<td>
									<asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
									<asp:RequiredFieldValidator CssClass="error" ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="logincontrol">*</asp:RequiredFieldValidator>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2">
									<span class="error">
										<asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
									</span>
								</td>
							</tr>
							<tr>
								<td align="right" colspan="2">
									<asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="logincontrol" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</LayoutTemplate>
	</asp:Login>

</asp:Content>
