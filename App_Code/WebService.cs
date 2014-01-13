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
	public string ConnectWithMentor(Guid userIdMentor, int connectionStatus)
	{
		string value = "fail";
		MembershipUser userMentee = Membership.GetUser();
		if (userMentee != null)
		{
			MembershipUser userMentor = Membership.GetUser(userIdMentor);
			if (userMentor != null)
			{
				cree_MenteeMentor menteeMentor = new DataAccess().SetMenteeMentor((Guid)userMentee.ProviderUserKey, (Guid)userMentor.ProviderUserKey, connectionStatus);
				if (menteeMentor != null)
				{
					value = "success";
				}
			}
		}
		return value;
	}
}