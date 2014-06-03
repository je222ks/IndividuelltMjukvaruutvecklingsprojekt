using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;

namespace CountryQuiz.Model.DAL 
{
    public class QuestionDAL : CountryQuiz.Model.DAL.DALBase
    {
        public void DeleteQuestion(int QuestionID)
        {
            using (SqlConnection conn = CreateConnection())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("appSchema.usp_DeleteQuestion", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@QuestionID", SqlDbType.Int, 4).Value = QuestionID;

                    conn.Open();

                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    throw new ApplicationException("An error occured in the data access layer.");
                }
            }
        }

        public Question GetQuestion(int QuestionID)
        {
            using (SqlConnection conn = CreateConnection())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("appSchema.usp_GetSingleQuestion", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@QuestionID", SqlDbType.Int, 4).Value = QuestionID;

                    conn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            var questionIdIndex = reader.GetOrdinal("QuestionID");
                            var questionIndex = reader.GetOrdinal("Question");
                            var answerOption1Index = reader.GetOrdinal("AnswerOption1");
                            var answerOption2Index = reader.GetOrdinal("AnswerOption2");
                            var answerOption3Index = reader.GetOrdinal("AnswerOption3");
                            var answerOption4Index = reader.GetOrdinal("AnswerOption4");
                            var correctAnswerIndex = reader.GetOrdinal("CorrectAnswer");
                            var questionCategoryIndex = reader.GetOrdinal("QuestionCategory");

                            return new Question
                            {
                                QuestionID = reader.GetInt32(questionIdIndex),
                                QuestionTitle = reader.GetString(questionIndex),
                                AnswerOption1 = reader.GetString(answerOption1Index),
                                AnswerOption2 = reader.GetString(answerOption2Index),
                                AnswerOption3 = reader.GetString(answerOption3Index),
                                AnswerOption4 = reader.GetString(answerOption4Index),
                                CorrectAnswer = reader.GetString(correctAnswerIndex),
                                QuestionCategory = reader.GetInt32(questionCategoryIndex)
                            };
                        }

                        return null;
                    }
                }
                catch
                {
                    throw new ApplicationException("An error occured in the data access layer.");
                }
            }
        }

        public IEnumerable<Question> GetQuestions()
        {
            using (SqlConnection conn = CreateConnection())
            {
                try
                {
                    var questions = new List<Question>(50);

                    SqlCommand cmd = new SqlCommand("appSchema.usp_GetQuestions", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    conn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        var questionIdIndex = reader.GetOrdinal("QuestionID");
                        var questionIndex = reader.GetOrdinal("Question");
                        var answerOption1Index = reader.GetOrdinal("AnswerOption1");
                        var answerOption2Index = reader.GetOrdinal("AnswerOption2");
                        var answerOption3Index = reader.GetOrdinal("AnswerOption3");
                        var answerOption4Index = reader.GetOrdinal("AnswerOption4");
                        var correctAnswerIndex = reader.GetOrdinal("CorrectAnswer");
                        var questionCategoryIndex = reader.GetOrdinal("QuestionCategory");

                        while (reader.Read())
                        {
                            questions.Add(new Question
                            {
                                QuestionID = reader.GetInt32(questionIdIndex),
                                QuestionTitle = reader.GetString(questionIndex),
                                AnswerOption1 = reader.GetString(answerOption1Index),
                                AnswerOption2 = reader.GetString(answerOption2Index),
                                AnswerOption3 = reader.GetString(answerOption3Index),
                                AnswerOption4 = reader.GetString(answerOption4Index),
                                CorrectAnswer = reader.GetString(correctAnswerIndex),
                                QuestionCategory = reader.GetInt32(questionCategoryIndex)
                            });
                        }
                    }

                    questions.TrimExcess();
                    return questions;
                }
                catch
                {
                    throw new ApplicationException("An error occured in the data access layer.");
                }
            }
        }

        public void AddQuestion(Question question)
        {
            using (SqlConnection conn = CreateConnection())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("appSchema.usp_CreateQuestion", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    Random random = new Random();

                    cmd.Parameters.Add("@Question", SqlDbType.VarChar, 100).Value = question.QuestionTitle;
                    cmd.Parameters.Add("@AnswerOption1", SqlDbType.VarChar, 50).Value = question.AnswerOption1;
                    cmd.Parameters.Add("@AnswerOption2", SqlDbType.VarChar, 50).Value = question.AnswerOption2;
                    cmd.Parameters.Add("@AnswerOption3", SqlDbType.VarChar, 50).Value = question.AnswerOption3;
                    cmd.Parameters.Add("@AnswerOption4", SqlDbType.VarChar, 50).Value = question.AnswerOption4;
                    cmd.Parameters.Add("@CorrectAnswer", SqlDbType.VarChar, 50).Value = question.CorrectAnswer;
                    cmd.Parameters.Add("@QuestionCategory", SqlDbType.Int, 4).Value = random.Next(1, 6);

                    conn.Open();

                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    throw new ApplicationException("An error occured in the data access layer.");
                }
            }
        }

        public void EditQuestion(Question question)
        {
            using (SqlConnection conn = CreateConnection())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("appSchema.usp_EditQuestion", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@QuestionID", SqlDbType.Int, 4).Value = question.QuestionID;
                    cmd.Parameters.Add("@Question", SqlDbType.VarChar, 100).Value = question.QuestionTitle;
                    cmd.Parameters.Add("@AnswerOption1", SqlDbType.VarChar, 50).Value = question.AnswerOption1;
                    cmd.Parameters.Add("@AnswerOption2", SqlDbType.VarChar, 50).Value = question.AnswerOption2;
                    cmd.Parameters.Add("@AnswerOption3", SqlDbType.VarChar, 50).Value = question.AnswerOption3;
                    cmd.Parameters.Add("@AnswerOption4", SqlDbType.VarChar, 50).Value = question.AnswerOption4;
                    cmd.Parameters.Add("@CorrectAnswer", SqlDbType.VarChar, 50).Value = question.CorrectAnswer;

                    conn.Open();

                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    throw new ApplicationException("An error occured in the data access layer.");
                }
            }
        }
    }
}