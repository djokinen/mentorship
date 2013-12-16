using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

public class DataAccess
{
	#region cree_industry

	public cree_Industry GetIndustry(int id)
	{
		using (DataClassesDataContext context = new DataClassesDataContext())
		{
			return context.cree_Industries.Where(n => n.Enabled).SingleOrDefault(n => n.ID == id);
		}
	}

	public List<cree_Industry> GetIndustryList()
	{
		using (DataClassesDataContext context = new DataClassesDataContext())
		{
			return context.cree_Industries.Where(n => n.Enabled).ToList();
		}
	}

	public List<cree_Industry> GetIndustryListByMentor(Guid userIdMentor)
	{
		using (DataClassesDataContext context = new DataClassesDataContext())
		{
			return (from t in context.cree_MentorIndustries
					  where t.UserIdMentor == userIdMentor
					  orderby t.cree_Industry.Name
					  select t.cree_Industry).ToList();
		}
	}

	public List<cree_Industry> GetIndustryListAvailable(Guid userIdMentor)
	{
		using (DataClassesDataContext context = new DataClassesDataContext())
		{
			IEnumerable<cree_Industry> mentorIndustries = from t in context.cree_MentorIndustries
																		 where t.UserIdMentor == userIdMentor
																		 select t.cree_Industry;

			return context.cree_Industries.Except(mentorIndustries).OrderBy(n => n.Name).ToList();
		}
	}

	#endregion

	#region cree_mentorindustry

	public void SetMentorIndustryList(Guid userIdMentor, string industryIdsAsCsv)
	{
		int[] industryIds;

		if (string.IsNullOrWhiteSpace(industryIdsAsCsv)) { industryIds = null; }
		else { industryIds = industryIdsAsCsv.Split(',').Select(n => Convert.ToInt32(n)).ToArray(); }

		this.SetMentorIndustryList(userIdMentor, industryIds);
	}

	public void SetMentorIndustryList(Guid userIdMentor, int[] industryIds)
	{
		using (DataClassesDataContext context = new DataClassesDataContext())
		{
			var mentorIndustries = context.cree_MentorIndustries.Where(n => n.UserIdMentor == userIdMentor);
			context.cree_MentorIndustries.DeleteAllOnSubmit(mentorIndustries);
			context.SubmitChanges();

			if (industryIds != null)
			{
				cree_MentorIndustry mentorIndustry;
				for (int i = 0; i < industryIds.Count(); i++)
				{
					mentorIndustry = new cree_MentorIndustry();
					mentorIndustry.IndustryId = industryIds[i];
					mentorIndustry.UserIdMentor = userIdMentor;
					mentorIndustry.CreatedDate = DateTime.Now;
					context.cree_MentorIndustries.InsertOnSubmit(mentorIndustry);
				}
				context.SubmitChanges();
			}
		}
	}

	#endregion
}