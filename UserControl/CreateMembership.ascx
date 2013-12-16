<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CreateMembership.ascx.cs" Inherits="Usercontrol_CreateMembership" %>

<asp:HiddenField ClientIDMode="Static" runat="server" ID="hiddenRoleType" />

<h1>Create Membership</h1>

<asp:CreateUserWizard ClientIDMode="Static" DisableCreatedUser="True" ID="createUserWizard" runat="server" RequireEmail="false" ContinueDestinationPageUrl="~/default.aspx">
	<WizardSteps>
		<asp:CreateUserWizardStep runat="server">
			<ContentTemplate>
				<table id="body_template">
					<tr>
						<td align="right">
							<label id="RoleTypeLabel" for="RoleTypeContainer" runat="server" associatedcontrolid="RoleTypeContainer">Role Type:</label>
						</td>
						<td>
							<div id="RoleTypeContainer">
								<input type="radio" name="roletype" value="<%= RoleType.Mentee %>" checked="checked" /><%= RoleType.Mentee %>
								<input type="radio" name="roletype" value="<%= RoleType.Mentor %>" /><%= RoleType.Mentor %>
							</div>
						</td>
					</tr>

					<tr>
						<td align="right">
							<asp:Label ID="FullNameLabel" runat="server" AssociatedControlID="FullName">Full Name:</asp:Label>
						</td>
						<td>
							<asp:TextBox ID="FullName" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator CssClass="error" ID="FullNameRequired" runat="server" ControlToValidate="FullName" ErrorMessage="Full Name is required." ToolTip="Full Name is required." ValidationGroup="createUserWizard">*</asp:RequiredFieldValidator>
						</td>
					</tr>

					<tr>
						<td align="right">
							<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Email:</asp:Label>
						</td>
						<td>
							<asp:TextBox ID="UserName" runat="server" AutoCompleteType="Email"></asp:TextBox>
							<asp:RequiredFieldValidator CssClass="error" ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Email is required." ToolTip="Email is required." ValidationGroup="createUserWizard">*</asp:RequiredFieldValidator>
							<asp:RegularExpressionValidator CssClass="error" ControlToValidate="UserName" ID="emailAddressValidator" runat="server" ValidationGroup="createUserWizard"
							 ValidationExpression="^[-!#$%&'*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&'*+/0-9=?A-Z^_a-z{|}~])*@[a-zA-Z](-?[a-zA-Z0-9])*(\.[a-zA-Z](-?[a-zA-Z0-9])*)+$">Invalid email address</asp:RegularExpressionValidator>
						</td>
					</tr>

	<%--
						<tr>
						<td align="right">
							<asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
						</td>
						<td>
							<asp:TextBox ID="Email" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator CssClass="error" ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="createUserWizard">*</asp:RequiredFieldValidator>
						</td>
					</tr>
	--%>

					<tr>
						<td align="right">
							<asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
						</td>
						<td>
							<asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
							<asp:RequiredFieldValidator CssClass="error" ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="createUserWizard">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td align="right">
							<asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
						</td>
						<td>
							<asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
							<asp:RequiredFieldValidator CssClass="error" ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="createUserWizard">*</asp:RequiredFieldValidator>
						</td>
					</tr>

<%--					<tr>
						<td align="right">
							<asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
						</td>
						<td>
							<asp:TextBox ID="Question" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator CssClass="error" ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="createUserWizard">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td align="right">
							<asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
						</td>
						<td>
							<asp:TextBox ID="Answer" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator CssClass="error" ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="createUserWizard">*</asp:RequiredFieldValidator>
						</td>
					</tr>--%>

					<tr>
						<td align="center" colspan="2">
							<asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="createUserWizard"></asp:CompareValidator>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2" style="color: Red;">
							<asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
						</td>
					</tr>
				</table>
			</ContentTemplate>

		</asp:CreateUserWizardStep>
		<asp:CompleteWizardStep runat="server">

			<ContentTemplate>
				<table>
					<tr>
						<td>Your account has been successfully created.</td>
					</tr>
					<tr>
						<td align="center">Complete</td>
					</tr>
					<tr>
						<td align="right">
							<asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" Text="Continue" ValidationGroup="createUserWizard" />
						</td>
					</tr>
				</table>
			</ContentTemplate>

		</asp:CompleteWizardStep>
	</WizardSteps>
</asp:CreateUserWizard>
