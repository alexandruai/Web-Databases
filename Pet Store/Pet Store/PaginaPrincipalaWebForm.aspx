<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaginaPrincipalaWebForm.aspx.cs" Inherits="Pet_Store.PaginaPrincipalaWebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:GridView ID="GridViewProduse" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="IdProdus" DataSourceID="SqlDataSourceProduse" style="margin-right: 35px" Width="507px">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                    <asp:BoundField DataField="IdProdus" HeaderText="IdProdus" ReadOnly="True" SortExpression="IdProdus" />
                    <asp:BoundField DataField="Denumire" HeaderText="Denumire" SortExpression="Denumire" />
                    <asp:BoundField DataField="Categorie" HeaderText="Categorie" SortExpression="Categorie" />
                    <asp:BoundField DataField="Descriere" HeaderText="Descriere" SortExpression="Descriere" />
                    <asp:BoundField DataField="PretLista" HeaderText="Pret Lista" SortExpression="PretLista" />
                    <asp:BoundField DataField="PretMinim" HeaderText="Pret Minim" SortExpression="PretMinim" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                </Columns>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tbIdProdus" runat="server" Width="54px" style="margin-left: 0px"></asp:TextBox>
&nbsp;<asp:TextBox ID="tbDenumire" runat="server" Width="59px"></asp:TextBox>
&nbsp;<asp:TextBox ID="tbCategorie" runat="server" Width="65px"></asp:TextBox>
            <asp:TextBox ID="tbDescriere" runat="server" Width="63px"></asp:TextBox>
            <asp:TextBox ID="tbPretLista" runat="server" Width="37px"></asp:TextBox>
            <asp:TextBox ID="tbPretMinim" runat="server" Width="43px"></asp:TextBox>
            <asp:Button ID="btnInsert" runat="server" OnClick="btnInsert_Click" Text="Adaugare" />
            <br />
            <asp:SqlDataSource ID="SqlDataSourceProduse" runat="server" ConnectionString="<%$ ConnectionStrings:PetStoreDBConnectionString %>" DeleteCommand="DELETE FROM [Produse] WHERE [IdProdus] = @IdProdus" InsertCommand="INSERT INTO [Produse] ([IdProdus], [Denumire], [Categorie], [Descriere], [PretLista], [PretMinim]) VALUES (@IdProdus, @Denumire, @Categorie, @Descriere, @PretLista, @PretMinim)" SelectCommand="SELECT [IdProdus], [Denumire], [Categorie], [Descriere], [PretLista], [PretMinim] FROM [Produse]" UpdateCommand="UPDATE [Produse] SET [Denumire] = @Denumire, [Categorie] = @Categorie, [Descriere] = @Descriere, [PretLista] = @PretLista, [PretMinim] = @PretMinim WHERE [IdProdus] = @IdProdus" >
                <DeleteParameters>
                    <asp:Parameter Name="IdProdus" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="IdProdus" Type="Int32" />
                    <asp:Parameter Name="Denumire" Type="String" />
                    <asp:Parameter Name="Categorie" Type="String" />
                    <asp:Parameter Name="Descriere" Type="String" />
                    <asp:Parameter Name="PretLista" Type="Double" />
                    <asp:Parameter Name="PretMinim" Type="Double" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Denumire" Type="String" />
                    <asp:Parameter Name="Categorie" Type="String" />
                    <asp:Parameter Name="Descriere" Type="String" />
                    <asp:Parameter Name="PretLista" Type="Double" />
                    <asp:Parameter Name="PretMinim" Type="Double" />
                    <asp:Parameter Name="IdProdus" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="DropDownListGraph" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListGraph_SelectedIndexChanged" style="height: 22px">
                <asp:ListItem>Tip Grafic</asp:ListItem>
                <asp:ListItem>Bare</asp:ListItem>
                <asp:ListItem>Pie</asp:ListItem>
                <asp:ListItem>Linie</asp:ListItem>
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
        </div>
        <p>
            <asp:TextBox ID="tbMess" runat="server" BackColor="#CCCCFF" Height="109px" TextMode="MultiLine" Width="329px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Comenzi"></asp:Label>
        </p>
        <p>
            <asp:GridView ID="GridViewComanda" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IdComanda" DataSourceID="SqlDataSourceComanda" ForeColor="#333333" GridLines="None" Width="334px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                    <asp:BoundField DataField="IdComanda" HeaderText="IdComanda" ReadOnly="True" SortExpression="IdComanda" />
                    <asp:BoundField DataField="StareComanda" HeaderText="StareComanda" SortExpression="StareComanda" />
                    <asp:BoundField DataField="TrackingNumber" HeaderText="TrackingNumber" SortExpression="TrackingNumber" />
                    <asp:BoundField DataField="ModalitateLivrare" HeaderText="ModalitateLivrare" SortExpression="ModalitateLivrare" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceComanda" runat="server" ConnectionString="<%$ ConnectionStrings:PetStoreDBConnectionString %>" SelectCommand="SELECT [IdComanda], [StareComanda], [TrackingNumber], [ModalitateLivrare] FROM [Comanda]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:Button ID="btnProc" runat="server" OnClick="btnProc_Click" Text="Rapoarte" />
        </p>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Afisare Valoare  Comanda"></asp:Label>
        </p>
        <p>
            <asp:Button ID="btAfisareValoare" runat="server" OnClick="btnAfisareValoare_Click" Text="Afisare" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tbIdComanda" runat="server" BackColor="#CCFFFF" Width="144px">Id Comanda...</asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tbValoareComanda" runat="server" BackColor="#99CCFF" Width="162px">Valoare...</asp:TextBox>
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
