﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_Membership_Detail : BaseUserControl
{
	protected override void OnInit(EventArgs e)
	{
		base.OnInit(e);
		buttonUpdate.Click += buttonUpdate_Click;
	}

	protected override void OnLoad(EventArgs e)
	{
		base.OnLoad(e);
		if (!IsPostBack)
		{
			panelMentee.Visible = base.IsMentee;
			panelMentor.Visible = !base.IsMentee;
			_load(base.CurrentUserName, base.IsMentee, true); // base.IsEditMode);
		}
	}

	void buttonUpdate_Click(object sender, EventArgs e)
	{
		if (_update(base.CurrentUserName, base.IsMentee))
		{
			labelStatus.Text = "Record updated";
		}
		else
		{
			labelStatus.Text = "This record was not updated";
		}
	}

	private void _load(string username, bool isMentee, bool isEditMode)
	{
		MembershipUser membershipUser = Membership.GetUser(base.CurrentUserName);
		// if member exists
		if (membershipUser != null)
		{
			username = membershipUser.UserName;
			ProfileCommon profileCommon = (ProfileCommon)Profile.GetProfile(username);
			// is profile exists
			if (profileCommon != null)
			{
				// set username
				literalUserName.Text = username;
				literalRoleType.Text = string.Join(", ", Roles.GetRolesForUser(username));

				// if in edit mode, populate input fields
				if (isEditMode)
				{
					FullName.Text = profileCommon.FullName;
					if (isMentee)
					{
						DateTime dob;
						if (DateTime.TryParse(profileCommon.Mentee.Dob, out dob))
						{
							MenteeDob.Text = dob.ToString(Resources.Key.DateFormat);
						}
						else
						{
							MenteeDob.Text = null;
						}
						MenteeCommunity.Text = profileCommon.Mentee.Community;
						MenteeOccupation.Text = profileCommon.Mentee.Occupation;
						MenteePhone.Text = profileCommon.Phone;
					}
					else
					{
						MentorBio.Text = profileCommon.Mentor.Bio;
						MentorCompanyName.Text = profileCommon.Mentor.CompanyName;
						MentorIndustry.Text = profileCommon.Mentor.Industry;
						MentorPhone.Text = profileCommon.Phone;
					}
				}
				else
				{
					literalRoleType.Text = "";
					literalFullName.Text = "";
					if (isMentee)
					{
						literalMenteeCommunity.Text = "";
						literalMenteeDob.Text = "";
						literalMenteeOccupation.Text = "";
						literalMenteePhone.Text = "";
					}
					else
					{
						literalMentorBio.Text = "";
						literalMentorCompanyName.Text = "";
						literalMentorIndustry.Text = "";
						literalMentorPhone.Text = "";
					}
				}
			}
		}
	}

	private bool _update(string username, bool isMentee)
	{
		bool value = false;
		MembershipUser membershipUser = Membership.GetUser(username);
		if (membershipUser != null)
		{
			ProfileCommon profileCommon = (ProfileCommon)Profile.GetProfile(username);
			if (profileCommon != null)
			{
				profileCommon.FullName = FullName.Text.Trim();
				if (isMentee)
				{
					DateTime dob;
					if (DateTime.TryParse(MenteeDob.Text.Trim(), out dob))
					{
						profileCommon.Mentee.Dob = dob.ToString(Resources.Key.DateFormat);
					}
					else
					{
						profileCommon.Mentee.Dob = null;
					}
					profileCommon.Phone = MenteePhone.Text.Trim();
					profileCommon.Mentee.Community = MenteeCommunity.Text.Trim();
					profileCommon.Mentee.Occupation = MenteeOccupation.Text.Trim();
				}
				else
				{
					profileCommon.Phone = MentorPhone.Text.Trim();
					profileCommon.Mentor.Bio = MentorBio.Text.Trim();
					profileCommon.Mentor.CompanyName = MentorCompanyName.Text.Trim();
					profileCommon.Mentor.Industry = MentorIndustry.Text.Trim();
				}
				profileCommon.Save();
				value = true;
			}
			mentorIndustryList.Save();
		}
		return value;
	}
}