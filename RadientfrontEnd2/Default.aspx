<%@ Page Title="Radiant Beauty" Language="C#" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs"
    Inherits="RadientFrontEnd._Default" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>Radiant Beauty</title>

    <style>

        body {
            margin: 0;
            background: #f4f7fb;
            font-family: Arial, sans-serif;
        }

        .auth-wrapper {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
            box-sizing: border-box;
        }

        .auth-card {
            width: 100%;
            max-width: 500px;
            background: white;
            border-radius: 25px;
            padding: 40px 50px;
            box-shadow: 0 10px 35px rgba(0,0,0,0.10);
            border-top: 6px solid #1456a0;
            box-sizing: border-box;
        }

        .brand {
            text-align: center;
            margin-bottom: 25px;
        }

        .brand-icon {
            width: 65px;
            height: 65px;
            margin: auto;
            margin-bottom: 12px;
            border-radius: 50%;
            background: #ffd43b;
            color: #1456a0;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 22px;
        }

        .brand h1 {
            color: #1456a0;
            font-size: 30px;
            margin: 0;
        }

        .brand p {
            color: #777;
            margin-top: 7px;
        }


        .auth-switch {
            display: flex;
            margin-bottom: 30px;
            background: #f1f4f8;
            border-radius: 10px;
            padding: 4px;
        }

        .switch-button {
            width: 50%;
            border: none;
            padding: 12px;
            border-radius: 8px;
            background: transparent;
            color: #555;
            font-weight: 600;
            cursor: pointer;
        }

        .switch-button.active {
            background: #1456a0;
            color: white;
        }

        /* FORM */

        .form-group {
            margin-bottom: 18px;
        }

        .form-label {
            display: block;
            margin-bottom: 7px;
            font-weight: 600;
            color: #333;
        }

        .form-control-custom {
            width: 100%;
            height: 45px;
            border: 1px solid #d5dce5;
            border-radius: 9px;
            padding: 0 13px;
            box-sizing: border-box;
        }

        .form-control-custom:focus {
            outline: none;
            border-color: #1456a0;
            box-shadow: 0 0 0 3px rgba(20,86,160,.12);
        }


        .submit-button {
            width: 100%;
            height: 48px;
            border: none;
            border-radius: 9px;
            background: #1456a0;
            color: white;
            font-weight: 600;
            font-size: 16px;
            cursor: pointer;
        }

        .submit-button:hover {
            background: #0d427d;
        }



        .message {
            display: block;
            text-align: center;
            margin-top: 15px;
            font-weight: 600;
        }

        .yellow-text {
            color: #d49d00;
        }


        .register-fields {
            display: none;
        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="auth-wrapper">

            <div class="auth-card">


                <div class="brand">

                    <div class="brand-icon">
                        RB
                    </div>

                    <h1>Radiant Beauty</h1>

                    <p>Your beauty, your confidence.</p>

                </div>


           

                <div class="auth-switch">

                    <button type="button"
                        id="loginTab"
                        class="switch-button active"
                        onclick="showLogin()">

                        Login

                    </button>


                    <button type="button"
                        id="registerTab"
                        class="switch-button"
                        onclick="showRegister()">

                        Register

                    </button>

                </div>


                <div id="loginForm">

                    <div class="form-group">

                        <asp:Label
                            ID="EmailLabel"
                            runat="server"
                            Text="Email"
                            CssClass="form-label">
                        </asp:Label>

                        <asp:TextBox
                            ID="EmailTextBox"
                            runat="server"
                            TextMode="Email"
                            CssClass="form-control-custom"
                            placeholder="Enter your email">
                        </asp:TextBox>

                    </div>


                    <div class="form-group">

                        <asp:Label
                            ID="PasswordLabel"
                            runat="server"
                            Text="Password"
                            CssClass="form-label">
                        </asp:Label>

                        <asp:TextBox
                            ID="PasswordTextBox"
                            runat="server"
                            TextMode="Password"
                            CssClass="form-control-custom"
                            placeholder="Enter your password">
                        </asp:TextBox>

                    </div>


                    <asp:Button
                        ID="LoginButton"
                        runat="server"
                        Text="Sign In"
                        CssClass="submit-button"
                        OnClick="LoginButton_Click" />

                </div>


                <div id="registerForm" class="register-fields">


                    <div class="form-group">

                        <asp:Label
                            ID="UserNameLabel"
                            runat="server"
                            Text="Username"
                            CssClass="form-label">
                        </asp:Label>

                        <asp:TextBox
                            ID="UserNameTextBox"
                            runat="server"
                            CssClass="form-control-custom"
                            placeholder="Enter username">
                        </asp:TextBox>

                    </div>


             

                    <div class="form-group">

                        <asp:Label
                            ID="SurnameLabel"
                            runat="server"
                            Text="Surname"
                            CssClass="form-label">
                        </asp:Label>

                        <asp:TextBox
                            ID="SurnameTextBox"
                            runat="server"
                            CssClass="form-control-custom"
                            placeholder="Enter surname">
                        </asp:TextBox>

                    </div>



                    <div class="form-group">

                        <asp:Label
                            ID="RegisterEmailLabel"
                            runat="server"
                            Text="Email"
                            CssClass="form-label">
                        </asp:Label>

                        <asp:TextBox
                            ID="RegisterEmailTextBox"
                            runat="server"
                            TextMode="Email"
                            CssClass="form-control-custom"
                            placeholder="Enter email">
                        </asp:TextBox>

                    </div>



                    <div class="form-group">

                        <asp:Label
                            ID="PhoneNumberLabel"
                            runat="server"
                            Text="Phone Number"
                            CssClass="form-label">
                        </asp:Label>

                        <asp:TextBox
                            ID="PhoneNumberTextBox"
                            runat="server"
                            TextMode="Phone"
                            CssClass="form-control-custom"
                            placeholder="Enter phone number">
                        </asp:TextBox>

                    </div>


                 

                    <div class="form-group">

                        <asp:Label
                            ID="RegisterPasswordLabel"
                            runat="server"
                            Text="Password"
                            CssClass="form-label">
                        </asp:Label>

                        <asp:TextBox
                            ID="RegisterPasswordTextBox"
                            runat="server"
                            TextMode="Password"
                            CssClass="form-control-custom"
                            placeholder="Create password">
                        </asp:TextBox>

                    </div>


                    <div class="form-group">

                        <asp:Label
                            ID="GenderLabel"
                            runat="server"
                            Text="Gender"
                            CssClass="form-label">
                        </asp:Label>

                        <asp:DropDownList
                            ID="GenderDropDown"
                            runat="server"
                            CssClass="form-control-custom">

                            <asp:ListItem
                                Text="Select gender"
                                Value="" />

                            <asp:ListItem
                                Text="MALE"
                                Value="MALE" />

                            <asp:ListItem
                                Text="FEMALE"
                                Value="FEMALE" />

                            <asp:ListItem
                                Text="OTHER"
                                Value="OTHER" />

                        </asp:DropDownList>

                    </div>



                    <div class="form-group">

                        <asp:Label
                            ID="RaceLabel"
                            runat="server"
                            Text="Race"
                            CssClass="form-label">
                        </asp:Label>

                        <asp:TextBox
                            ID="RaceTextBox"
                            runat="server"
                            CssClass="form-control-custom"
                            placeholder="Enter race">
                        </asp:TextBox>

                    </div>



                    <div class="form-group">

                        <asp:Label
                            ID="DOBLabel"
                            runat="server"
                            Text="Date of Birth"
                            CssClass="form-label">
                        </asp:Label>

                        <asp:TextBox
                            ID="DOBTextBox"
                            runat="server"
                            TextMode="Date"
                            CssClass="form-control-custom">
                        </asp:TextBox>

                    </div>



                    <asp:Button
                        ID="RegisterButton"
                        runat="server"
                        Text="Create Account"
                        CssClass="submit-button"
                        OnClick="RegisterButton_Click" />

                </div>



                <asp:Label
                    ID="MessageLabel"
                    runat="server"
                    CssClass="message">
                </asp:Label>

            </div>

        </div>



        <script>

            function showLogin() {

                document.getElementById("loginForm").style.display = "block";
                document.getElementById("registerForm").style.display = "none";

                document.getElementById("loginTab").classList.add("active");
                document.getElementById("registerTab").classList.remove("active");

            }


            function showRegister() {

                document.getElementById("loginForm").style.display = "none";
                document.getElementById("registerForm").style.display = "block";

                document.getElementById("loginTab").classList.remove("active");
                document.getElementById("registerTab").classList.add("active");

            }

        </script>

    </form>

</body>
</html>