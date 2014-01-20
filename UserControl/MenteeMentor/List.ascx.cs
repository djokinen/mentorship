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
		public int ConnectionStatusId;
	}

	public override void DataBind()
	{
		base.DataBind();

		StringBuilder text = new StringBuilder();
		string[] userNames = Roles.GetUsersInRole(RoleType.Mentor.ToString());
		MembershipUserCollection membershipUserCollection = new MembershipUserCollection();
		// foreach (string userName in userNames)
		int count = 0;

		for (int i = 0; i < userNames.Count(); i++)
		{
			MembershipUser membershipUser = Membership.GetUser(userNames[i]);
			if (membershipUser != null)
			{
				cree_MenteeMentor menteeMentor = new DataAccess().GetMenteeMentor((Guid)membershipUser.ProviderUserKey);
				// default value
				int connectionStatusId = ConnectionStatus.None.GetHashCode();
				if (menteeMentor != null) { connectionStatusId = menteeMentor.ConnectionStatus; }

				ProfileCommon profileCommon = Profile.GetProfile(userNames[i]);
				if (profileCommon != null)
				{
					List<cree_Industry> industryList = new DataAccess().GetIndustryListByMentor((Guid)membershipUser.ProviderUserKey);

					MentorSimple mentor = new MentorSimple();
					mentor.Name = profileCommon.FullName;
					mentor.Bio = profileCommon.Mentor.Bio;
					mentor.Company = profileCommon.Mentor.CompanyName;
					mentor.UserId = (Guid)membershipUser.ProviderUserKey;
					mentor.ConnectionStatusId = connectionStatusId;
					mentor.Industries = String.Join(", ", industryList.Select(n => n.Name));


					// output 1st record as selected
					if (count == 0)
					{
						StringBuilder mentorDetail = new StringBuilder();
						mentorDetail.AppendFormat("<div id=\"mentor-detail\" data-userid=\"{0}\" data-connectionstatusid=\"{1}\">", membershipUser.ProviderUserKey, connectionStatusId);
						mentorDetail.AppendFormat("<h3>{0}</h3>", profileCommon.FullName);
						mentorDetail.AppendFormat("<div class=\"subtitle\"><em>{0}</em></div>", profileCommon.Mentor.CompanyName);
						mentorDetail.AppendFormat("<div><strong>{0}</strong></div>", String.Join(", ", industryList.Select(n => n.Name)));
						mentorDetail.AppendFormat("<p>{0}</p>", profileCommon.Mentor.Bio);

						if (connectionStatusId == ConnectionStatus.Rejected.GetHashCode())
						{
							mentorDetail.AppendFormat("<a class=\"btn rejected\">Connection Failed...</a>", profileCommon.FullName);
						}
						else if (connectionStatusId == ConnectionStatus.Pending.GetHashCode())
						{
							mentorDetail.AppendFormat("<a class=\"btn pending\">Connection Pending...</a>", profileCommon.FullName);
						}
						else if (connectionStatusId == ConnectionStatus.Accepted.GetHashCode())
						{
							mentorDetail.AppendFormat("<a class=\"btn accepted\">Connected to {0}</a>", profileCommon.FullName);
						}
						else
						{
							mentorDetail.AppendFormat("<a class=\"btn connect\">Connect with {0}</a>", profileCommon.FullName);
						}

						mentorDetail.Append("<Fieldset style='display:none;'>");
						mentorDetail.AppendFormat("<legend>{0}</legend>", "Message to Mentor");
						mentorDetail.AppendFormat("<textarea rows='3'>{0}</textarea>", profileCommon.Mentor.Bio);
						mentorDetail.Append("<button>Connect</button>");
						mentorDetail.Append("</fieldset>");
						mentorDetail.Append("</div>");
						count++;
						literalMentorDetail.Text = mentorDetail.ToString();
					}

					/*
					 * 0 = cst
					 * 1 = connection status type id
					 * 2 = industry list by id
					 * 3 = active item or not
					 * sample: class="cst1 mix 2 3 8 active
					 */
					text.AppendFormat("<li class=\"{0}{1} mix {2}{3}\">",
						Resources.Key.ConnectionStatusId,
						connectionStatusId,
						String.Join(" ", industryList.Select(n => n.ID)),
						i == 0 ? " active" : string.Empty);

					text.AppendFormat("<a data-userid=\'{0}\' data-user=\'{1}\' src=\'#\'>{2}</a>",
						membershipUser.ProviderUserKey,
						Server.HtmlEncode(JsonConvert.SerializeObject(mentor, Formatting.None)),
						profileCommon.FullName);
					text.Append("</li>");
				}
			}
		}
		literalMentorList.Text = text.ToString();

		repeaterFilter.DataSource = new DataAccess().GetIndustryListAvailable(base.CurrentUserId);
		repeaterFilter.DataBind();
	}
}