<%@ Page Title="" Language="C#" MasterPageFile="~/BusBookingMaster.Master" AutoEventWireup="true" CodeBehind="PassengerDetailsInfo.aspx.cs" Inherits="BusBookingProject.PassengerDetailsInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 8%">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ShowSummary="true" ValidationGroup="vgRegister" />
        <asp:GridView ID="gdPassengerDetails" runat="server" ShowFooter="true" AutoGenerateColumns="false" Width="100%">
            <Columns>
                <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />
              <asp:TemplateField HeaderText="First Name">
                <ItemTemplate>
                    <asp:TextBox ID="txtFName" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtFName" Display="None"
                                ID="revFName" ValidationGroup="vgRegister" CssClass="text-danger"
                                ErrorMessage="invalid Fisrst name" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFName" Display="None" ID="rfvFName" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="passengers First Name required." />
                </ItemTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name">
                    <ItemTemplate>
                        <asp:TextBox ID="txtLName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="txtLName" Display="None"
                                ID="revLName" ValidationGroup="vgRegister" CssClass="text-danger"
                                ErrorMessage="invalid last name" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLName" Display="None" ID="rfvLName" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="passengers Last name is required." />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail" Display="None"
                                ID="revEmail" ValidationGroup="vgRegister" CssClass="text-danger"
                                ErrorMessage="Please enter a valid mail address." ValidationExpression="^[a-zA-Z0-9_.+-]+@[a-z]+\.com$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" Display="None" ID="rfvEmail" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="passengers Email is required." />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact">
                    <ItemTemplate>
                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="txtContact" Display="None"
                                ID="revContact" ValidationGroup="vgRegister" CssClass="text-danger"
                                ErrorMessage="contact No must be a 10-digit number." ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtContact" Display="None" ID="rfvContact" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="passengers Contact is required." />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City">
                    <ItemTemplate>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCity" Display="None" ID="rfvCity" ValidationGroup="vgRegister"
                            CssClass="text-danger" ErrorMessage="passengers City is required." />
                            </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <FooterStyle HorizontalAlign="Right" />
                    <FooterTemplate>
                        <asp:Button ID="ButtonAdd" runat="server" Style="color: red" Text="Add New Passanger Details"
                            OnClick="ButtonAdd_Click" />
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:Button ID="btnConirmBooking" runat="server" CssClass="btn btn-success" Style="width: auto; margin-top: 2%" Text="Confirm Booking"
            OnClick="btnConirmBooking_Click" ClientIDMode="Static" />

        <div class="row" id="paymentMode" runat="server">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Card Details For Payment</h3>
                </div>
                <div class="panel-body">
                    <div id="divMessage" runat="server" />
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblCardType" runat="server" Text="Select Your Card" Font-Bold="true"></asp:Label>
                            <asp:DropDownList ID="ddlCardType" runat="server" class="form-control input-sm floatlabel">
                                <asp:ListItem Value="0" Text="--Select Card--"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Credit Card"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Debit Card"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCardType" Display="None" ID="rfvFirstName" ValidationGroup="vgRegister"
                                CssClass="text-danger" ErrorMessage="Card Type is required." /><br />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblBankName" runat="server" Text="Select Bank" Font-Bold="true"></asp:Label>
                            <asp:DropDownList ID="ddlBank" runat="server" class="form-control input-sm floatlabel">
                                <asp:ListItem Value="0" Text="--Select Bank--"></asp:ListItem>
                                <asp:ListItem Value="1" Text="State Bank Of India"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Bank Of India"></asp:ListItem>
                                <asp:ListItem Value="3" Text="ICICI Bank"></asp:ListItem>
                                <asp:ListItem Value="4" Text="HDFC Bank"></asp:ListItem>
                                <asp:ListItem Value="5" Text="Bank Of Baroda"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlBank" Display="None" ID="rfVMobileNo" ValidationGroup="vgRegister"
                                CssClass="text-danger" ErrorMessage="Bank Name is required." /><br />
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                       <div class="form-group">
                            <asp:Label ID="lblLastName" runat="server" Text="3 Digit CVV Code" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtCode" runat="server" class="form-control input-sm floatlabel" MaxLength="3" TextMode="Password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCode" Display="None" ID="rfVLastName" ValidationGroup="vgRegister"
                                CssClass="text-danger" ErrorMessage="CVV Code is required." />
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtCode" Display="None"
                                ID="revCVV" ValidationGroup="vgRegister" CssClass="text-danger"
                                ErrorMessage="CVV Code must be a 3-digit number." ValidationExpression="^\d{3}$"></asp:RegularExpressionValidator><br />
                        </div>

                       <div class="form-group">
                            <asp:Label ID="lblCardNo" runat="server" Text="Card No" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtCardNo" runat="server" class="form-control input-sm floatlabel" MaxLength="19" oninput="formatCardNumber()" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCardNo" Display="None" ID="rfvCardNo" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Card No is required." />
                            <br />
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtCardNo" Display="None"
                                    ID="revCardNo" ValidationGroup="vgRegister" CssClass="text-danger"
                                    ErrorMessage="Card No must be a valid 16-digit number." ValidationExpression="^\d{4}(\s?\d{4}){3}$"></asp:RegularExpressionValidator>
 
                                <script type="text/javascript">
                                    function formatCardNumber() {
                                        var cardNoTextBox = document.getElementById('<%= txtCardNo.ClientID %>');
                                        var cardNumber = cardNoTextBox.value.replace(/\D/g, ''); // Remove non-numeric characters
                                        var formattedCardNumber = '';
 
                                        for (var i = 0; i < cardNumber.length; i++) {
                                            if (i > 0 && i % 4 === 0) {
                                                formattedCardNumber += ' ';
                                            }
                                            formattedCardNumber += cardNumber[i];
                                        }
 
                                        cardNoTextBox.value = formattedCardNumber;
                                    }
                            </script>
                            </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Button ID="btnSave" runat="server" Text="Make Payment" OnClick="btnSave_Click" class="btn btn-info " ValidationGroup="vgRegister" CausesValidation="True" ViewStateMode="Inherit" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
