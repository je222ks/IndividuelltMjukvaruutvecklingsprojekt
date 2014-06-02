function CallServerMethod() {
    PageMethods.GetMessage(OnSucces);
}

function OnSucces(result) {
    alert(result);
}

function CallQuestion() {
    PageMethods.GetQuestion(OnJsonSuccess, OnJsonFail);
}

function OnJsonSuccess(result, userCtx, method) {
    if (result != null) {
        var Question = eval('(' + result + ')');

        var resultMsg = "Question called [" + method + "] is: (" + Question.QuestionTitle + "," + Question.Option1 + "," + Question.Option2 + "," + Question.Option3 + "," + Question.Option4 + ")";
        alert(resultMsg);
    }
}

function OnJsonFail(error, userCtx, method) {
    if (error != null) {
        var resultMsg = "Error from Method [" + method + "] is: '" + error.get_message() + "'";
        alert(resultMsg);
    }
}