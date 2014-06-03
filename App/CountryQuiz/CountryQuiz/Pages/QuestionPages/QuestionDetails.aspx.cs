using CountryQuiz.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CountryQuiz.Pages.QuestionPages
{
    public partial class QuestionDetails : System.Web.UI.Page
    {
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public Question QuestionFormView_GetItem([RouteData] int id)
        {
            try
            {
                return Service.GetQuestion(id);
            }
            catch
            {
                ModelState.AddModelError(String.Empty, "An error occured as the question was to be retrieved.");
                return null;
            }
        }

        public void QuestionFormView_DeleteItem([RouteData] int id)
        {
            try
            {
                Service.DeleteQuestion(id);

                Page.SetTempData("SuccessMessage", "The question has been removed.");
                Response.RedirectToRoute("Questions");
                Context.ApplicationInstance.CompleteRequest();
            }
            catch
            {
                ModelState.AddModelError(String.Empty, String.Format("A question with the Id {0} could not be found.", id));
            }
        }

        public void QuestionFormView_UpdateItem([RouteData] int id)
        {
            try
            {
                var question = Service.GetQuestion(id);

                if (question == null)
                {
                    ModelState.AddModelError(String.Empty, String.Format("A question with the Id {0} could not be found.", id));
                    return;
                }

                if (TryUpdateModel(question))
                {
                    Service.SaveQuestion(question);

                    Page.SetTempData("SuccessMessage", "The question has beed updated.");
                    Response.RedirectToRoute("Questions");
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
            catch
            {
                ModelState.AddModelError(String.Empty, String.Format("A question with the Id {0} could not be found.", id));
            }
        }
    }
}