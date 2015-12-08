<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ValidationExam.aspx.cs" Inherits="_201244094_Validate.ValidationExam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type ="text/javascript">
        function ValidateSocialNumber(source, args) {
            var sn = args.Value;
            var checkDigit = 0;
            var weight = 2;

            for (var i = 0; i < 13; i++) {
                if (i == 6) continue;
                checkDigit += parseInt(sn.charAt(i)) * weight;
                weight++;
                if (weight > 9) weight = 2;
            }
            checkDigit = (11 - (checkDigit % 11)) % 10;

            if (parseInt(sn.charAt(13)) == checkDigit)
                args.IsValid = true;
            else args.IsValid = false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        이름:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="vIdNameRequired" runat="server" 
            ErrorMessage="이름을 입력해주세요."
            ControlToValidate="txtName"
            SetFocusOnError="true"
            Display="Dynamic"
            ></asp:RequiredFieldValidator>
        <br />
        비밀번호:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="vIdPasswordRequired" runat="server" 
            ErrorMessage="비밀번호를 입력해주세요."
            ControlToValidate="txtPassword"
            SetFocusOnError="true"
            Display="Dynamic"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="vIdPAssword" runat="server" 
     ErrorMessage="비밀번호는 4자이상 10자 이하여야 합니다." 
     ControlToValidate="txtPassword"
     ValidationExpression="\w{4,10}"
     SetFocusOnError="true"
     Display="Dynamic"
    ></asp:RegularExpressionValidator>
        <br />
        비밀번호(확인):&nbsp; <asp:TextBox ID="txtRetype" TextMode="Password" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="vIdRetypeRequired" runat="server"
            ErrorMessage="비밀번호(확인)를 다시 입력해주세요."
            ControlToValidate="txtRetype"
            Display="Dynamic"></asp:RequiredFieldValidator>
&nbsp;<asp:CompareValidator ID="vIdRetype" runat="server" 
    ErrorMessage="비밀번호와 일치하지 않습니다."
    ControlToCompare="txtPassword"
    ControlToValidate="txtRetype"
    Display="Dynamic"></asp:CompareValidator>
        <br />
        이메일:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtEMail" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="vIdMailRequired" runat="server" 
            ErrorMessage="이메일을 입력해주세요."
            ControlToValidate="txtEMail"
            Display="Dynamic" ></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="vIdEMail" runat="server" 
    ErrorMessage="이메일 형식이 아닙니다."
    ControlToValidate="txtEMail"
    ValidationExpression="\S+@\S+\.\S+"
    Display="Dynamic"></asp:RegularExpressionValidator>
        <br />
        주민등록번호:&nbsp;&nbsp; <asp:TextBox ID="txtSocialNumber" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="vIdNReauired" runat="server" 
            ErrorMessage="주민등록번호를 입력해주세요."
            ControlToValidate="txtSocialNumber"
            Display="Dynamic"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="vIdSNRegularExpression" runat="server" 
    ErrorMessage="주민등록번호를 형식에 맞게 넣어주세요."
    SetFocusOnError="true"
    ValidationExpression="\d{6}-[1-4]\d{6}"
    ControlToValidate="txtSocialNumber"
    Display="Dynamic"></asp:RegularExpressionValidator>
&nbsp;<asp:CustomValidator ID="vIdSocialNumber" runat="server" 
    ErrorMessage="주민등록번호가 맞지 않습니다."
    OnServerValidate="vIdSocialNumber_ServerValidate"
    ControlToValidate="txtSocialNumber"
    Display="Dynamic"
    SetFocusOnError="true"
    ClientValidationFunction="ValidateSocialNumber"></asp:CustomValidator>
        <br />
        나이:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
        <asp:RangeValidator ID="vIdAge" runat="server" 
            ErrorMessage=" 0 - 150 사이로 입력합니다."
            ControlToValidate="txtAge"
            Display="Dynamic"
            MaximumValue="150"
            MinimumValue="0"
            Type="Integer"></asp:RangeValidator>
        <br />
        성별:<asp:RadioButtonList ID="btnGender" RepeatDirection="Horizontal" runat="server" AutoPostBack="False">
            <asp:ListItem Value="1">남</asp:ListItem>
            <asp:ListItem Value="2">여</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="vIdGender" runat="server" ErrorMessage="성별을 입력해주세요."
            ControlToValidate="btnGender"></asp:RequiredFieldValidator>
&nbsp;<br />
        주소:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtAddress" runat="server" Width="500px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="vIdAddress" runat="server" 
            ErrorMessage="주소를 입력해주세요."
            ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
        <br />
        휴대폰번호:&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="vIdPhoneRequired" runat="server" 
            ErrorMessage="휴대폰번호를 입력해주세요."
            ControlToValidate="txtPhone"
            Display="Dynamic"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="vIdPhoneRE" runat="server" 
    ErrorMessage="휴대폰번호를 형식에 맞게 넣어주세요."
    SetFocusOnError="true"
    ValidationExpression="01\d{1}-\d{3,4}-\d{4}"
    ControlToValidate="txtPhone"
    Display="Dynamic"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="제출하기" OnClick="btnSubmit_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCancel" runat="server" Text="취소" OnClick="btnCancel_Click" />
        </div>
        <asp:ValidationSummary ID="vIdSummary" runat="server" 
            ShowMessageBox="true"
            ShowSummary="false"/>
    </form>
</body>
</html>
