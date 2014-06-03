using CountryQuiz.Model.DAL;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using CountryQuiz.App_Infrastructure;

namespace CountryQuiz.Model
{
    public class Service
    {
        private QuestionDAL _questionDAL;

        private QuestionDAL QuestionDAL
        {
            get { return _questionDAL ?? (_questionDAL = new QuestionDAL()); }
        }

        public void DeleteQuestion(Question question)
        {
            DeleteQuestion(question.QuestionID);
        }

        public void DeleteQuestion(int QuestionID)
        {
            QuestionDAL.DeleteQuestion(QuestionID);
        }

        public Question GetQuestion(int QuestionID)
        {
            return QuestionDAL.GetQuestion(QuestionID);
        }

        public IEnumerable<Question> GetQuestions()
        {
            return QuestionDAL.GetQuestions();
        }

        public void SaveQuestion(Question question)
        {
             // Validering
            ICollection<ValidationResult> validationResults;
            if (!question.Validate(out validationResults))
            {
                var ex = new ValidationException("Objektet klarade inte valideringen.");
                ex.Data.Add("ValidationResults", validationResults);
                throw ex;
            }

            if (question.QuestionID == 0)
            {
                QuestionDAL.AddQuestion(question);
            }
            else
            {
                QuestionDAL.EditQuestion(question);
            }
        }
    }
}