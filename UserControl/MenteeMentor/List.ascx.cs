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
		/* if (!IsPostBack) { this.DataBind(); } */
	}

	public override void DataBind()
	{
		base.DataBind();

		StringBuilder text = new StringBuilder();
		string[] userNames = Roles.GetUsersInRole(RoleType.Mentor.ToString());
		MembershipUserCollection membershipUserCollection = new MembershipUserCollection();
		// foreach (string userName in userNames)
		for (int i = 0; i < userNames.Count(); i++)
		{
			MembershipUser membershipUser = Membership.GetUser(userNames[i]);
			if (membershipUser != null)
			{
				ProfileCommon profileCommon = Profile.GetProfile(userNames[i]);
				if (profileCommon != null)
				{
					List<cree_Industry> industryList = new DataAccess().GetIndustryListByMentor((Guid)membershipUser.ProviderUserKey);

					MentorSimple mentor = new MentorSimple();
					mentor.Bio = profileCommon.Mentor.Bio;
					mentor.UserId = (Guid)membershipUser.ProviderUserKey;
					mentor.Company = profileCommon.Mentor.CompanyName;
					mentor.Industries = String.Join(", ", industryList.Select(n => n.Name));
					mentor.Name = profileCommon.FullName;

					// output 1st record as selected
					if (i == 0)
					{
						StringBuilder mentorDetail = new StringBuilder();
						mentorDetail.AppendFormat("<input type=\"hidden\" value=\"{0}\" />", membershipUser.ProviderUserKey);
						mentorDetail.AppendFormat("<h3>{0}</h3>", profileCommon.FullName);
						mentorDetail.AppendFormat("<div class=\"subtitle\"><em>{0}</em></div>", profileCommon.Mentor.CompanyName);
						mentorDetail.AppendFormat("<div><strong>{0}</strong></div>", String.Join(", ", industryList.Select(n => n.Name)));
						mentorDetail.AppendFormat("<p>{0}</p>", profileCommon.Mentor.Bio);
						mentorDetail.AppendFormat("<a class=\"btn\">Connect with {0}</a>", profileCommon.FullName);
						literalMentorDetail.Text = mentorDetail.ToString();
					}

					text.AppendFormat("<li class=\"mix {0}{1}\">", String.Join(" ", industryList.Select(n => n.ID)), i == 0 ? " active" : string.Empty);
					text.AppendFormat("<a data-userid=\'{0}\' data-user=\'{1}\' src=\'#\'>{2}</a>",
						membershipUser.ProviderUserKey,
						Server.HtmlEncode(JsonConvert.SerializeObject(mentor, Formatting.None)),
						// membershipUser.UserName);
						profileCommon.FullName);
					text.Append("</li>");
				}
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