<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .table1
        {
            border: 3px solid #333333;
            border-collapse: collapse;
        }
        .style1
        {
            height: 47px;
        }
        .style2
        {
            width: 332px;
        }
    </style>
</head>
<body bgcolor="#333333">
    <form id="form1" runat="server">
    <div>
        <table align="center" cellpadding="14" class="table1" style="width: 27%; height: 460px;">
            <tr>
                <td align="center" bgcolor="#333333" colspan="2">
                    <asp:Label ID="Label1" runat="server" BorderColor="#4A3C8C" BorderStyle="Groove"
                        EnableTheming="True" Font-Bold="True" Font-Size="XX-Large" Font-Underline="False"
                        ForeColor="#4A3C8C" Height="40px" Text="Hip Hop Artist Details" Width="367px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#4A3C8C" class="style2">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="White" Text="Artist Name:"></asp:Label>
                </td>
                <td align="left" bgcolor="#4A3C8C">
                    <asp:TextBox ID="TextBox1" runat="server" ValidationGroup="insertDetails" Width="131px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        Display="Dynamic" ErrorMessage="Artist Name Required!" Font-Bold="True" ForeColor="#FF3300"
                        ValidationGroup="insertDetails" Font-Size="Large">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#4A3C8C" class="style2">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="White" Text="Artist Gender:"></asp:Label>
                </td>
                <td align="left" bgcolor="#4A3C8C">
                    <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" Font-Bold="True"
                        ForeColor="White" GroupName="gender" Text="Male" ValidationGroup="insertDetails" />
                    <asp:RadioButton ID="RadioButton2" runat="server" Font-Bold="True" ForeColor="White"
                        GroupName="gender" Text="Female" ValidationGroup="insertDetails" />
                </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#4A3C8C" class="style2">
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="White" Text="Artist Image:"></asp:Label>
                </td>
                <td align="left" bgcolor="#4A3C8C">
                    <asp:FileUpload ID="FileUpload1" runat="server" Text="Upload Picture" 
                        accept=".png,.jpg,.jpeg,.gif" ForeColor="White" Font-Bold="True" />
                    <br />
                    <asp:Image ID="Image2" runat="server" Height="100px" Visible="False" />
                </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#4A3C8C" class="style2">
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="White"
                        Text="Artist Genres:"></asp:Label>
                </td>
                <td align="left" bgcolor="#4A3C8C">
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" Font-Bold="True" ForeColor="White"
                        RepeatColumns="1" Width="166px">
                        <asp:ListItem>Deejaying (DJ)</asp:ListItem>
                        <asp:ListItem>MCing (Rapping)</asp:ListItem>
                        <asp:ListItem>B-Boying (Dancing)</asp:ListItem>
                        <asp:ListItem>Graffiti Painting</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#4A3C8C" class="style1" colspan="2">
                    <asp:Button ID="Button1" runat="server" BackColor="#00CC00" Font-Bold="True" Font-Italic="False"
                        Font-Names="Georgia" Font-Overline="False" Font-Size="Large" Font-Strikeout="False"
                        Font-Underline="False" ForeColor="White" Height="33px" OnClick="Button1_Click"
                        OnMouseOver="this.style.cursor='pointer'" Text="Add Artist" ValidationGroup="insertDetails"
                        Width="322px" />
                    <asp:Button ID="Button4" runat="server" BackColor="#CC0000" Font-Bold="True" Font-Names="Georgia"
                        Font-Size="Large" ForeColor="White" Height="33px" OnClick="Button4_Click" OnMouseOver="this.style.cursor='pointer'"
                        Text="Reset Form" Width="322px" />
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#333333" class="style1" colspan="2">
                    <font color="white"><b>
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    </b></font>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="#CC0000"
                        DisplayMode="List" Font-Bold="True" ForeColor="White" ValidationGroup="insertDetails" />
                </td>
            </tr>
        </table>
    </div>
    <table align="center" style="padding: 5px; width: 50%; height: 149px;">
        <tr>
            <td align="center" bgcolor="#4A3C8C" style="padding: inherit; margin: auto">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True"
                    ForeColor="White" Text="Hip Hop Artist List"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" style="padding: inherit; margin: auto">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" GridLines="Horizontal">
                    <AlternatingRowStyle BackColor="#F7F7F7" HorizontalAlign="Center" 
                        VerticalAlign="Middle" />
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Literal ID="Literal2" runat="server" Text='<%# Eval("id") %>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Literal ID="Literal3" runat="server" Text='<%# Eval("name") %>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gender">
                            <ItemTemplate>
                                <asp:Literal ID="Literal4" runat="server" Text='<%# Eval("gender") %>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Genres">
                            <ItemTemplate>
                                <asp:Literal ID="Literal5" runat="server" Text='<%# Eval("genre") %>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Photo">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" 
                                    ImageUrl='<%# Eval("image", "~/uploads/{0}") %>' Height="100px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("id") %>' 
                                    onclick="Button2_Click" Text="Delete" BackColor="#CC0000" Font-Bold="True" 
                                    Font-Names="Georgia" Font-Size="Large" ForeColor="White" Height="33px" OnMouseOver="this.style.cursor='pointer'" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Update">
                            <ItemTemplate>
                                <asp:Button ID="Button5" runat="server" BackColor="#00CC00" 
                                    CommandArgument='<%# Eval("id") %>' Font-Bold="True" Font-Names="Georgia" 
                                    Font-Overline="False" Font-Size="Large" ForeColor="White" Height="33px" 
                                    Text="Update" OnMouseOver="this.style.cursor='pointer'" 
                                    onclick="Button5_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" 
                        VerticalAlign="Middle" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
