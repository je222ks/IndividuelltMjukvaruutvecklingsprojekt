using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace CountryQuiz.App_Start
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("Questions", "questions", "~/Pages/QuestionPages/QuestionList.aspx");
            routes.MapPageRoute("AddQuestion", "questions/new", "~/Pages/QuestionPages/CreateQuestion.aspx");
            routes.MapPageRoute("QuestionDetails", "questions/{id}", "~/Pages/QuestionPages/QuestionDetails.aspx");

            routes.MapPageRoute("Default", "", "~/Pages/Game.aspx");
        }
    }
}