<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" Runat="Server">

	<h1>Membership</h1>

	<asp:LoginView ID="loginView" runat="server">
		<AnonymousTemplate>
			<h2>Anonymous User</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sed lacus vitae quam malesuada rhoncus id a diam. Sed nisi turpis, sodales euismod lobortis sed, rutrum et ligula.</p>
		</AnonymousTemplate>

		<LoggedInTemplate>
			<h2>Logged In User</h2>
			<p>Mauris ut eros ipsum, tristique convallis libero. Nullam pharetra, nibh vel vestibulum pellentesque, velit lacus ultricies nibh, vitae porta turpis sapien ac orci.</p>
		</LoggedInTemplate>
	</asp:LoginView>

	<asp:LoginView ID="loginView2" runat="server">
		<RoleGroups>
			<asp:RoleGroup Roles="admin">
				<ContentTemplate>
					<h2>Member of the admin role</h2>
					<p>Pellentesque pellentesque elementum massa a euismod. Etiam elit dolor, accumsan non sagittis eget, viverra in est. Praesent interdum aliquet odio, nec adipiscing dui adipiscing sit amet.</p>
				</ContentTemplate>				
			</asp:RoleGroup>

			<asp:RoleGroup Roles="mentor">
				<ContentTemplate>
					<h2>Member of the mentor role</h2>
					<p>Nulla facilisi. Fusce nec sem nibh. In nec turpis mauris, vitae pulvinar enim. Curabitur accumsan purus sed dui malesuada faucibus. Quisque rhoncus facilisis ante quis ultrices.</p>
				</ContentTemplate>				
			</asp:RoleGroup>

			<asp:RoleGroup Roles="mentee">
				<ContentTemplate>
					<h2>Member of the mentee role</h2>
					<p>Pellentesque pellentesque elementum massa a euismod. Etiam elit dolor, accumsan non sagittis eget, viverra in est. Praesent interdum aliquet odio, nec adipiscing dui adipiscing sit amet.</p>
				</ContentTemplate>				
			</asp:RoleGroup>
		</RoleGroups>

	</asp:LoginView>

</asp:Content>