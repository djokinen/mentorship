using Newtonsoft.Json;
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
	struct MentorSimple
	{
		public string Bio;
		public string Name;
		public Guid UserId;
		public string Company;
		public string Industries;
	}

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
			if (membershipUser != null)
			{
				List<cree_Industry> industryList = new DataAccess().GetIndustryListByMentor((Guid)membershipUser.ProviderUserKey);

				MentorSimple mentor = new MentorSimple();
				ProfileCommon profileCommon = Profile.GetProfile(userName);
				if (profileCommon != null)
				{
					mentor.Bio = profileCommon.Mentor.Bio;
					mentor.UserId = (Guid)membershipUser.ProviderUserKey;
					mentor.Company = profileCommon.Mentor.CompanyName;
					mentor.Industries = String.Join(", ", industryList.Select(n => n.Name));
					mentor.Name = profileCommon.FullName;
				}

				text.AppendFormat("<li class=\"mix {0}\">", String.Join(" ", industryList.Select(n => n.ID)));
				string delete = JsonConvert.SerializeObject(mentor, Formatting.None);
				text.AppendFormat("<a data-userid=\'{0}\' data-user=\'{1}\' src=\'#\'>{2}</a>", 
					membershipUser.ProviderUserKey, 
					Server.HtmlEncode( JsonConvert.SerializeObject(mentor, Formatting.None)), 
					membershipUser.UserName);
				text.Append("</li>");
			}
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
		// new DataAccess().SetMentorIndustryList(base.CurrentUserId, groupMembers.Value.Trim());
		// this.DataBind();
	}
}