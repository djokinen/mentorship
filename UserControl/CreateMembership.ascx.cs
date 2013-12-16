using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Usercontrol_CreateMembership : BaseUserControl {
	protected override void OnInit(EventArgs e)
	{
		base.OnInit(e);
		createUserWizard.CreatedUser += createUserWizard_CreatedUser;
	}

	void createUserWizard_CreatedUser(object sender, EventArgs e)
	{
		// HtmlInputHidden hiddenField = (HtmlInputHidden)createUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("hiddenRoleType");
		// default member role
		string value = hiddenRoleType.Value;
		if (string.IsNullOrWhiteSpace(value)) { Roles.AddUserToRole(createUserWizard.UserName, RoleType.Mentee.ToString()); }
		else { Roles.AddUserToRole(createUserWizard.UserName, value); }

		TextBox textBox;
		ProfileCommon profileCommon = (ProfileCommon)ProfileCommon.Create(createUserWizard.UserName);
		textBox = (TextBox)createUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("FullName");
		if (textBox != null) { profileCommon.FullName = textBox.Text.Trim(); }

/*
		// Add extended user properties
		// Create an empty Profile for the newly created user
		TextBox textBox;
		ProfileCommon profileCommon = (ProfileCommon)ProfileCommon.Create(createUserWizard.UserName);
		textBox = (TextBox)createUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("textFirstName");
		if (textBox != null) { profileCommon.FirstName = textBox.Text.Trim(); }

		textBox = (TextBox)createUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("textLastName");
		if (textBox != null) { profileCommon.LastName = textBox.Text.Trim(); }

		profileCommon.Save();

		// set the user to NOT approved until an admin moderates the account
		MembershipUser membershipUser = Membership.GetUser(createUserWizard.UserName, false);
		if (membershipUser != null)
		{
			membershipUser.IsApproved = false;
			System.Web.Security.Membership.UpdateUser(membershipUser);
		}

		try { Global.SendCreateUserEmail(membershipUser.UserName, base.CurrentLanguageCulture); }
		catch (Exception ex) { literalStatus.Text = string.Format("<p class=\"error\">{0}</p>", ex.Message); }
*/
	}
}