using CountryQuiz.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CountryQuiz.Pages.QuestionPages
{
    public partial class QuestionList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IEnumerable<Question> QuestionListView_GetData()
        {
            try
            {
                Service service = new Service();
                return service.GetQuestions();
            }
            catch
            {
                ModelState.AddModelError(String.Empty, "An error occured as the questions were to be retrieved.");
                return null;
            }
        }
    }
}