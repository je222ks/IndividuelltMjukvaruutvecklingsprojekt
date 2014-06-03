using CountryQuiz.Model.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
            //ICollection<ValidationResult> validationResults;
            //if (!question.Validate(out validationResults))
            //{
            //    var ex = new ValidationException("The object did not pass the validation.");
            //    ex.Data.Add("ValidationResults", validationResults);
            //    throw ex;
            //}

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