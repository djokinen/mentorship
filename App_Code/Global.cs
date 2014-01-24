using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Security;

/// <summary>
/// Summary description for Global
/// </summary>
public static class Global
{
	/// <summary>
	/// 
	/// </summary>
	/// <param name="membershipUser"></param>
	/// <param name="accountStatus"></param>
	/// <returns></returns>
	/// <see cref="https://basecamp.com/2043159/projects/1398005-lake-devo/todos/36498535-need-content-for-the"/>
	public static bool SendConnectEmail(MembershipUser membershipUser, string accountStatus)
	{
		bool value = false;
		if (membershipUser != null)
		{
			string baseUrl = Global.GetBaseUrl();
			// mail message
			MailMessage mailMessage = new MailMessage();
			// from
			mailMessage.From = new MailAddress(Resources.Key.NoReplyEmail);
			// bcc
			// mailMessage.Bcc.Add(GetMembershipUserEmailAddresses(RoleType.Admin));
			// to
			// mailMessage.To.Add(ldUser.EmailAddress);

			mailMessage.IsBodyHtml = true;
			mailMessage.Subject = "Youth Mentorship: Your instructor account status";

			StringBuilder body = new StringBuilder();
			// body.AppendFormat("<p>Your Lake Devo account has the status '{0}' for username '{1}'</p>", accountStatus, ldUser.UserName).AppendLine();
			body.AppendFormat("<p>To access Lake Devo, go to {0}</p>", baseUrl);
			// body.AppendFormat("<p>If you have any questions, please contact the Lake Devo Team at lakedevo@ryerson.ca.</p>", baseUrl, Resources.Key.ContactUsUrl);
			body.Append("<p>Enjoy your time in Lake Devo!<br />The Lake Devo Team</p>");
			// body.Append(GetEmailFooterAsHtml(languageCulture));

			mailMessage.Body = body.ToString();
			try
			{
				// new SmtpClient().Send(mailMessage);
				value = true;
			}
			catch (SmtpFailedRecipientException) { value = false; }
		}
		return value;
	}

	/// <returns>http://www.mydomainname.com</returns>
	public static string GetBaseUrl()
	{
		return string.Format("{0}://{1}{2}",
			HttpContext.Current.Request.Url.Scheme,
			HttpContext.Current.Request.Url.Authority,
			HttpContext.Current.Request.ApplicationPath).TrimEnd('/');
	}

}