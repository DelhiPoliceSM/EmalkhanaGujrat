<%@ Page Title="" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Receipt.aspx.cs" Inherits="EMalkhana.Receipt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .chkChoice input {
            margin-left: -20px;
        }

        .chkChoice td {
            width: 23%;
            padding-left: 10px;
        }

        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 300px;
            height: 140px;
        }

        @media print {
            div {
                page-break-before: always;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <div class="app-content main-content mt-0">
        <div class="side-app">
            <!-- CONTAINER -->
            <div class="main-container container-fluid">
                <!-- PAGE-HEADER -->
                <div class="page-header">
                    <div>
                        <h1 class="page-title">મુદ્દામાલ પાવતી નં. </h1>
                    </div>
                    <div class="ms-auto pageheader-btn">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">હોમ</a></li>
                            <li class="breadcrumb-item active" aria-current="page">મુદ્દામાલ પાવતી નં. </li>
                        </ol>
                    </div>
                </div>

                <script type="text/javascript" src="../assets/js/jquery1.min.js"></script>
                <link rel="stylesheet" href="../assets/css/select2.min.css" />
                <script type="text/javascript" src="../assets/js/select2.min.js"></script>
                <asp:Panel ID="pnlAdmin" runat="server" class="form-horizontal" Visible="false">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header border-bottom">
                                <h3 class="card-title">નવી પાવતી દાખલ કરો </h3>
                            </div>
                            <div class="card-body">
                                <p class="text-muted"></p>
                                <asp:Label ID="numUniqueID" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="notEnabledRowCount" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="numUniqueID1" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                                <asp:FormView ID="frmVwAdmin" runat="server" Width="100%" DataKeyNames="receiptNo"
                                    DataSourceID="headDetail" OnDataBound="frmVwAdmin_DataBound"
                                    OnItemInserting="frmVwAdmin_ItemInserting"
                                    OnItemUpdating="frmVwAdmin_ItemUpdating" OnLoad="frmVwAdmin_PreRender">
                                    <EditItemTemplate>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="card card-body pd-20 pd-md-40 border shadow-none">
                                                    <h4 class="card-title">અહીં વિગતો દાખલ કરો</h4>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">FIR  નં.</label>
                                                                <asp:DropDownList Enabled="false" RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Table" SelectionMode="Single" ID="firNumber" DataTextField="firNoWithYear" DataValueField="firId" runat="server" DataSourceID="dsFirList" CssClass="chkChoice" Width="100%" Text='<%# Bind("firId") %>'></asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsFirList" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_fir_Search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                                                                    <SelectParameters>
                                                                        <asp:Parameter DefaultValue="0" Name="numId" Type="Int32" />
                                                                        <asp:SessionParameter DefaultValue="0" SessionField="numUserId" Name="numUserId" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">મુદ્દામાલ પાવતી નઁ.</label>
                                                                <asp:TextBox Enabled="false" ID="receiptNo" class="form-control" runat="server" Text='<%# Bind("receiptNo") %>' placeholder="મુદ્દામાલ પાવતી નઁ. દાખલ કરો"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="receiptNo" ErrorMessage="Please Enter મુદ્દામાલ પાવતી નઁ."></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">જપ્તી તારીખ</label>
                                                                <asp:TextBox ID="txtSeizureDate" class="form-control" ValidationGroup="a" TextMode="Date" Text='<%# !string.IsNullOrEmpty(Eval("sDate").ToString())?DateTime.ParseExact(Eval("sDate").ToString(), "dd-MM-yyyy HH:mm:ss",
                                       System.Globalization.CultureInfo.InvariantCulture).ToString("yyyy-MM-dd"):"" %>'
                                                                    runat="server" Enabled="false" placeholder="મુદ્દા માલ નંબર દાખલ કરો"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtSeizureDate" ErrorMessage="Please enter a Date"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        દેશી
                                                        <asp:GridView ID="Gridview1" runat="server" ShowFooter="true"
                                                            AutoGenerateColumns="false" Width="100%"
                                                            OnRowCreated="Gridview1_RowCreated">
                                                            <Columns>
                                                                <asp:BoundField DataField="RowNumber" HeaderText="S.No." />
                                                                <asp:TemplateField HeaderText="મુદ્દામાલ નંબર ">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TextBox1" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="મુદ્દામાલ વિગત">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TextBox2" MaxLength="1000" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="મુદ્દામાલનુ સ્થાન">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TextBox3" MaxLength="500" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="LinkButton1" runat="server"
                                                                            OnClick="LinkButton1_Click">Remove</asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <asp:Button ID="Button1" runat="server"
                                                                Text="નવો મુદ્દામાલ દાખલ કરો " CssClass="btn btn-primary"
                                                                OnClick="ButtonAdd_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="card card-body pd-20 pd-md-40 border shadow-none">
                                                    <h4 class="card-title">અહીં વિગતો દાખલ કરો</h4>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">FIR  નં.</label>
                                                                <asp:ListBox RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Table" SelectionMode="Single" ID="firNumber" DataTextField="firNoWithYear" DataValueField="firId" runat="server" DataSourceID="dsFirList" CssClass="chkChoice" Width="100%"></asp:ListBox>
                                                                <asp:SqlDataSource ID="dsFirList" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_fir_Search_unique" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                                                                    <SelectParameters>
                                                                        <asp:SessionParameter DefaultValue="0" SessionField="numUserId" Name="numUserId" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">મુદ્દામાલ પાવતી નઁ.</label>
                                                                <asp:TextBox ValidationGroup="a" ID="receiptNo" class="form-control" runat="server" Text='<%# Bind("receiptNo") %>' placeholder="મુદ્દામાલ પાવતી નઁ. દાખલ કરો"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="receiptNo" ErrorMessage="Please Enter મુદ્દામાલ પાવતી નઁ."></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">જપ્તી તારીખ</label>
                                                                <asp:TextBox ID="txtSeizureDate" class="form-control" ValidationGroup="a" TextMode="Date" runat="server" placeholder="મુદ્દા માલ નંબર દાખલ કરો"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtSeizureDate" ErrorMessage="Please enter a Date"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        દેશી                                                       
                                                        <asp:GridView ID="Gridview1" runat="server" ShowFooter="true"
                                                            AutoGenerateColumns="false" Width="100%"
                                                            OnRowCreated="Gridview1_RowCreated">
                                                            <Columns>
                                                                <asp:BoundField DataField="RowNumber" ControlStyle-Width="5%" HeaderText="S.No." />
                                                                <asp:TemplateField HeaderText="મુદ્દામાલ નંબર ">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TextBox1" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="મુદ્દામાલ વિગત">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TextBox2" MaxLength="1000" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="વજન (લિટર)">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TextBox3" MaxLength="500" TextMode="Number" CssClass="form-control" runat="server"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="કિમત">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TextBox4" MaxLength="500" TextMode="Number" CssClass="form-control" runat="server"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="LinkButton1" runat="server"
                                                                            OnClick="LinkButton1_Click">Remove</asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <asp:Button ID="ButtonAdd" runat="server"
                                                                Text="નવો મુદ્દામાલ દાખલ કરો " Width="100%" CssClass="btn btn-primary" ValidationGroup="a" OnClick="ButtonAdd_Click" />
                                                        </div>
                                                        <div class="col-md-2">
                                                            <asp:Button ID="uplodFiles" Visible="false" Width="100%" CssClass="btn btn-dark" runat="server" Text="Upload Files" OnClick="uplodFiles_Click" />
                                                            <asp:ConfirmButtonExtender TargetControlID="uplodFiles" runat="server" ConfirmText="Addition of Mudh is not allowed after this. Would you like to proceed?" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        વિદેશી
                                                        <asp:GridView ID="Gridview2" runat="server" ShowFooter="true"
                                                            AutoGenerateColumns="false" Width="100%"
                                                            OnRowCreated="Gridview2_RowCreated">
                                                            <Columns>
                                                                <asp:BoundField DataField="RowNumber" HeaderText="S.No." />
                                                                <asp:TemplateField HeaderText="મુદ્દામાલ નંબર ">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TextBox1" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="મુદ્દામાલ વિગત">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TextBox2" MaxLength="1000" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="મુદ્દામાલનુ સ્થાન">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TextBox3" MaxLength="500" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="LinkButton1" runat="server"
                                                                            OnClick="LinkButton1_Click">Remove</asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <asp:Button ID="Button2" runat="server"
                                                                Text="નવો મુદ્દામાલ દાખલ કરો " CssClass="btn btn-primary"
                                                                OnClick="ButtonAdd_Click" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        અન્ય
                                                        <asp:GridView ID="Gridview3" runat="server" ShowFooter="true"
                                                            AutoGenerateColumns="false" Width="100%"
                                                            OnRowCreated="Gridview3_RowCreated">
                                                            <Columns>
                                                                <asp:BoundField DataField="RowNumber" HeaderText="S.No." />
                                                                <asp:TemplateField HeaderText="મુદ્દામાલ નંબર ">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TextBox1" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="મુદ્દામાલ વિગત">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TextBox2" MaxLength="1000" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="મુદ્દામાલનુ કિમત">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TextBox3" MaxLength="500" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="LinkButton1" runat="server"
                                                                            OnClick="LinkButton1_Click">Remove</asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <asp:Button ID="Button3" runat="server"
                                                                Text="નવો મુદ્દામાલ દાખલ કરો " CssClass="btn btn-primary"
                                                                OnClick="ButtonAdd3_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                    </ItemTemplate>
                                </asp:FormView>
                                <div class="row">
                                    <div class="offset-4 col-md-2">
                                        <asp:Button ID="btnSubmit" runat="server" Width="100%" CssClass="btn btn-primary" Text="સબમિટ કરો" OnClick="btnSubmit_Click" ValidationGroup="a" />
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Button ID="btnCancel" Width="100%" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClick="btnCancel_Click" CausesValidation="False" />
                                    </div>
                                </div>


                                <asp:SqlDataSource ID="headDetail" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>"
                                    SelectCommand="sp_receipt_search" SelectCommandType="StoredProcedure" ProviderName="MySql.Data.MySqlClient">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="0" SessionField="numUserId" Name="numUserId" Type="Int32" />
                                        <asp:ControlParameter ControlID="numUniqueID" DefaultValue="0"
                                            Name="numId" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
                <div class="row">
                    <div class="col-12 col-sm-12">
                        <div class="card product-sales-main">
                            <div class="card-header border-bottom">
                                <div style="width: 70%">
                                    <h3 class="card-title mb-0">પાવતી નઁ. યાદી</h3>
                                </div>
                                <div>
                                    <asp:Button runat="server" CssClass="btn btn-primary" Text="નવી પાવતી નઁ. બનાવો" OnClick="btnAddNew_Click"></asp:Button>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtMudhNo" Width="100%" CssClass="form-fieldset" runat="server" placeholder="મહેરબાની કરીને અહીં પાવતી નઁ. દાખલ કરો"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Button CssClass="btn btn-primary" ID="textSubmit" runat="server" OnClick="textSubmit_Click" Text="હવે શોધો"></asp:Button>
                                    </div>
                                </div>
                                <asp:ListView ID="lstView" runat="server" DataKeyNames="receiptNo" DataSourceID="store_customer"
                                    EnableModelValidation="True" OnItemCommand="lstVwAdmin_ItemCommand">
                                    <EditItemTemplate>
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        <div>
                                            મંજૂરી માટે રાહ જોઈ રહ્યું છે.
                                        </div>
                                    </EmptyDataTemplate>
                                    <InsertItemTemplate>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label2" runat="server" Text='<%# Container.DataItemIndex + 1 %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("receiptNo") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("year") %>' /></td>
                                            <td>
                                                <div class="d-flex align-items-stretch">
                                                    <asp:ImageButton ID="btnEdit" ToolTip="Edit" Height="25px" Width="25px" runat="server" CommandArgument='<%# Eval("receiptNo") + " ;; " + Eval("year")%>'
                                                        CommandName="EDITRECORD" ImageUrl="assets/images/action-edit.png" />
                                                    <asp:ConfirmButtonExtender ID="btnEdit_ConfirmButtonExtender" runat="server" ConfirmText="શું તમે આ રેકોર્ડમાં ફેરફાર કરવા માંગો છો?"
                                                        Enabled="True" TargetControlID="btnEdit"></asp:ConfirmButtonExtender>
                                                    <asp:ImageButton ID="btnDelete" ToolTip="Delete" Height="25px" Width="25px" runat="server" CommandArgument='<%# Eval("receiptNo") + " ;; " + Eval("year")%>'
                                                        CommandName="DELETERECORD" ImageUrl="assets/images/action-remove.png" />
                                                    <asp:ConfirmButtonExtender ID="btnDelete_ConfirmButtonExtender" runat="server" ConfirmText="શું તમે આ રેકોર્ડ દૂર કરવા માંગો છો?"
                                                        Enabled="True" TargetControlID="btnDelete"></asp:ConfirmButtonExtender>
                                                </div>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <div class="table-responsive">
                                            <table class="table text-nowrap mb-0 table-bordered">
                                                <thead class="table-head">
                                                    <tr>
                                                        <th class="bg-transparent border-bottom-0">S. No.</th>
                                                        <th class="bg-transparent border-bottom-0">મુદ્દામાલ પાવતી નઁ.</th>
                                                        <th class="bg-transparent border-bottom-0">Year</th>
                                                        <th class="bg-transparent border-bottom-0 no-btn">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="table-body">
                                                    <div runat="server" id="itemPlaceholder">
                                                    </div>
                                                </tbody>
                                            </table>
                                        </div>
                                    </LayoutTemplate>
                                </asp:ListView>
                                <asp:DataPager ID="dtpager" runat="server" PagedControlID="lstView" PageSize="10">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true"
                                            ShowNextPageButton="false" ShowPreviousPageButton="false" FirstPageText="First" />
                                        <asp:NumericPagerField ButtonType="Link" ButtonCount="10" />
                                        <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="true"
                                            ShowNextPageButton="false" ShowPreviousPageButton="false" LastPageText="Last" />
                                    </Fields>
                                </asp:DataPager>
                                <asp:ObjectDataSource ID="store_customer" runat="server" TypeName="EMalkhana.MudhSearch" SelectMethod="GetReceiptDetails" EnablePaging="true"
                                    StartRowIndexParameterName="startrows" MaximumRowsParameterName="pagesize" SelectCountMethod="GetReceiptCount">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtMudhNo" DefaultValue="" Type="String" Name="txtMudhNo" />
                                        <asp:SessionParameter DefaultValue="0" SessionField="numUserId" Name="numUserId" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                        </div>
                    </div>
                    <!-- COL END -->

                    <asp:SqlDataSource ID="headView" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_receipt_Search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="numId" Type="Int32" />
                            <asp:SessionParameter DefaultValue="0" SessionField="numUserId" Name="numUserId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            selectlistBox();
        });
        function selectlistBox() {
            $('[id*=firNumber]').select2({
                placeholder: "Search a FIR",
                allowClear: true
            });
        }

        function matchCustom(params, data) {
            // If there are no search terms, return all of the data
            if ($.trim(params.term) === '') {
                return data;
            }

            // Do not display the item if there is no 'text' property
            if (typeof data.text === 'undefined') {
                return null;
            }

            // `params.term` should be the term that is used for searching
            // `data.text` is the text that is displayed for the data object
            console.log(params.term);
            const myArray = params.term.split(" ");
            var counter = 0;
            var modifiedData = $.extend({}, data, true);
            for (const word of myArray) {
                if (data.text.toLowerCase().indexOf(word.toLowerCase()) > -1) {

                }
                else {
                    counter = 1;
                }
            }
            if (counter == 0) {
                return modifiedData;
            }

            // Return `null` if the term should not be displayed
            return null;
        }
    </script>
</asp:Content>
