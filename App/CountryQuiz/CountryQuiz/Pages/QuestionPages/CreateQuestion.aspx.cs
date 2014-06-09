using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryQuiz.Model;

namespace CountryQuiz.Pages.QuestionPages
{
    public partial class CreateQuestion : System.Web.UI.Page
    {
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void AddQuestionFormView_InsertItem(Question question)
        {
            // checks if any option match the correct answer

            if (String.Compare(question.CorrectAnswer.ToUpper(), question.AnswerOption1.ToUpper()) == 0 || String.Compare(question.CorrectAnswer.ToUpper(), question.AnswerOption2.ToUpper()) == 0 || String.Compare(question.CorrectAnswer.ToUpper(), question.AnswerOption3.ToUpper()) == 0 || String.Compare(question.CorrectAnswer.ToUpper(), question.AnswerOption4.ToUpper()) == 0)
            {
                if (ModelState.IsValid)
                {
                    try
                    {
                        Service.SaveQuestion(question);

                        Page.SetTempData("SuccessMessage", "The question has been added");
                        Response.RedirectToRoute("Questions");
                        Context.ApplicationInstance.CompleteRequest();
                    }
                    catch
                    {
                        ModelState.AddModelError(String.Empty, "An error occured when the question was to be saved.");
                    }
                }
            }
            else 
            {
                ModelState.AddModelError(String.Empty, "None of the entered answer options match the correct answer!.");
            }


        }
    }
}