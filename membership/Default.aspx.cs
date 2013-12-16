using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class membership_Default : BasePage
{
	protected override void OnInit(EventArgs e)
	{
		base.OnInit(e);
		buttonUpdate.Click += buttonUpdate_Click;
	}

	void buttonUpdate_Click(object sender, EventArgs e)
	{
		string industryIdsAsCsv = String.Format("{0}", Request.Form["groupMembers"]);
		new DataAccess().SetMentorIndustryList(base.CurrentUserId, industryIdsAsCsv);
		this.DataBind();
	}

	protected override void OnLoad(EventArgs e)
	{
		base.OnLoad(e);
		if (!IsPostBack) { this.DataBind(); }
	}

	public override void DataBind()
	{
		base.DataBind();

		// available industries
		repeaterAvailable.DataSource = new DataAccess().GetIndustryListAvailable(base.CurrentUserId);
		repeaterAvailable.DataBind();

		// selected industries
		List<cree_Industry> industryList = new DataAccess().GetIndustryListByMentor(base.CurrentUserId);
		groupMembers.Value = string.Join(",", industryList.Select(n => n.ID));
		repeaterSelected.DataSource = industryList;
		repeaterSelected.DataBind();
	}
}