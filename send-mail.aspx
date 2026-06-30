<%@ Page Language="C#" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Net.Mail" %>

<script runat="server">

protected void Page_Load(object sender, EventArgs e)
{
    if (Request.HttpMethod == "POST")
    {
        try
        {
            string name = Request.Form["name"];
            string email = Request.Form["email"];
            string phone = Request.Form["phone"];
            string service = Request.Form["service"];
            string message = Request.Form["message"];

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("contact@nycharteredaccountants.com");
            mail.To.Add("contact@nycharteredaccountants.com");
            mail.Subject = "New Quote Request";

            mail.Body = "New Quote Request\n\n" +
                        "Name: " + name + "\n" +
                        "Email: " + email + "\n" +
                        "Phone: " + phone + "\n" +
                        "Service: " + service + "\n" +
                        "Message: " + message;

            SmtpClient smtp = new SmtpClient("mail.nycharteredaccountants.com", 587);
            smtp.Credentials = new NetworkCredential("contact@nycharteredaccountants.com", "KhubabShekari@13");
            smtp.EnableSsl = true;

            smtp.Send(mail);

            Response.Write("success");
        }
        catch (Exception ex)
        {
            Response.Write("error: " + ex.Message);
        }
    }
}

</script>