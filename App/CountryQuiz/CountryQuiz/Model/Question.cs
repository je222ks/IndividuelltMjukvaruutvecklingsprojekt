using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryQuiz.Model
{
    public class Question
    {
        public int QuestionID { get; set; }

        public string Question { get; set; }

        public string AnswerOption1 { get; set; }

        public string AnswerOption2 { get; set; }

        public string AnswerOption3 { get; set; }

        public string AnswerOption4 { get; set; }

        public string CorrectAnswer { get; set; }

        public int QuestionCategory { get; set; }
    }
}