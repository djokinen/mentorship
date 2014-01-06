using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_MenteeMentor_List : BaseUserControl
{
	protected override void OnInit(EventArgs e) { base.OnInit(e); }

	protected override void OnLoad(EventArgs e)
	{
		base.OnLoad(e);
		if (!IsPostBack) { this.DataBind(); }
	}

	public override void DataBind()
	{
		base.DataBind();

		StringBuilder text = new StringBuilder();
		string[] userNames = Roles.GetUsersInRole(RoleType.Mentor.ToString());
		MembershipUserCollection membershipUserCollection = new MembershipUserCollection();
		foreach (string userName in userNames)
		{
			MembershipUser membershipUser = Membership.GetUser(userName);
			List<cree_Industry> industryList = new DataAccess().GetIndustryListByMentor((Guid)membershipUser.ProviderUserKey);
			string mentorIndustries = String.Join(" ", industryList.Select(n => n.ID));
			text.AppendFormat("<li class=\"mix {0}\">", mentorIndustries);
			// text.AppendFormat("<input type=\"checkbox\" value=\"[ID]\" id='[ID]' name=\"[ID]\">");
			text.AppendFormat("<label>{0}</label>", membershipUser.UserName);
			text.Append("</li>");
		}
		literalMentorList.Text = text.ToString();


		repeaterFilter.DataSource = new DataAccess().GetIndustryListAvailable(base.CurrentUserId);
		repeaterFilter.DataBind();

		// available industries
		// repeaterAvailable.DataSource = new DataAccess().GetIndustryListAvailable(base.CurrentUserId);
		// repeaterAvailable.DataBind();

		//// selected industries
		//List<cree_Industry> industryList = new DataAccess().GetIndustryListByMentor(base.CurrentUserId);
		//groupMembers.Value = string.Join(",", industryList.Select(n => n.ID));
		//repeaterSelected.DataSource = industryList;
		//repeaterSelected.DataBind();
	}

	public void Save()
	{
		new DataAccess().SetMentorIndustryList(base.CurrentUserId, groupMembers.Value.Trim());
		this.DataBind();
	}
}