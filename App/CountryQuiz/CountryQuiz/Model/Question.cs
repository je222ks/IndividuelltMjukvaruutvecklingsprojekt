using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace CountryQuiz.Model
{
    public class Question
    {
        public int QuestionID { get; set; }

        [Required(ErrorMessage = "A question has to be inserted.")]
        [StringLength(100, ErrorMessage = "The question length may not exceed 100 characters.")]
        public string QuestionTitle { get; set; }

        [Required(ErrorMessage = "An answer has to be inserted.")]
        [StringLength(50, ErrorMessage = "The answer may not exceed 50 characters.")]
        public string AnswerOption1 { get; set; }

        [Required(ErrorMessage = "An answer has to be inserted.")]
        [StringLength(50, ErrorMessage = "The answer may not exceed 50 characters.")]
        public string AnswerOption2 { get; set; }

        [Required(ErrorMessage = "An answer has to be inserted.")]
        [StringLength(50, ErrorMessage = "The answer may not exceed 50 characters.")]
        public string AnswerOption3 { get; set; }

        [Required(ErrorMessage = "An answer has to be inserted.")]
        [StringLength(50, ErrorMessage = "The answer may not exceed 50 characters.")]
        public string AnswerOption4 { get; set; }

        [Required(ErrorMessage = "The correct answer has to be inserted.")]
        [StringLength(50, ErrorMessage = "The correct answer may not exceed 50 characters.")]
        public string CorrectAnswer { get; set; }

        public int QuestionCategory { get; set; }
    }
}