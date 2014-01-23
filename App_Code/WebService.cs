using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{
	[WebMethod]
	public int ConnectWithMentor(Guid userIdMentor)
	{
		int value = ConnectionStatus.None.GetHashCode();
		MembershipUser userMentee = Membership.GetUser();
		if (userMentee != null)
		{
			MembershipUser userMentor = Membership.GetUser(userIdMentor);
			if (userMentor != null)
			{
				cree_MenteeMentor menteeMentor = new DataAccess().SetMenteeMentor((Guid)userMentee.ProviderUserKey, (Guid)userMentor.ProviderUserKey, ConnectionStatus.Pending.GetHashCode());
				if (menteeMentor != null)
				{
					value = menteeMentor.ConnectionStatus.GetHashCode();
				}
			}
		}
		return value;
	}

	[WebMethod]
	public int ConnectWithMentee(Guid userIdMentee, int connectionStatusId)
	{
		MembershipUser userMentor = Membership.GetUser();
		if (userMentor != null)
		{
			MembershipUser userMentee = Membership.GetUser(userIdMentee);
			if (userMentee != null)
			{
				cree_MenteeMentor menteeMentor = new DataAccess().SetMenteeMentor((Guid)userMentee.ProviderUserKey, (Guid)userMentor.ProviderUserKey, connectionStatusId);
				if (menteeMentor != null)
				{
					return menteeMentor.ConnectionStatus.GetHashCode();
				}
			}
		}
		return ConnectionStatus.None.GetHashCode();
	}

	[WebMethod]
	[Obsolete("Not in use", true)]
	public string SetMenteeConnectionStatus(Guid userIdMentee, int connectionStatusId)
	{
		string value = "fail";
		MembershipUser userMentor = Membership.GetUser();
		if (userMentor != null)
		{
			MembershipUser userMentee = Membership.GetUser(userIdMentee);
			if (userMentee != null)
			{
				cree_MenteeMentor menteeMentor = new DataAccess().SetMenteeMentor((Guid)userMentee.ProviderUserKey, (Guid)userMentor.ProviderUserKey, connectionStatusId);
				if (menteeMentor != null) { value = "success"; }
			}
		}
		return value;
	}
}