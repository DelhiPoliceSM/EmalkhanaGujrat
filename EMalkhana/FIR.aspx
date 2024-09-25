<%@ Page Title="" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="FIR.aspx.cs" Inherits="EMalkhana.FIR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .chkChoice input {
            margin-left: -20px;
        }

        .chkChoice td {
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
    <asp:Panel ID="Panel1" runat="server" align="center" Style="display: none">
        <div class="modal" id="modaldemo42" role="dialog" tabindex="99" aria-labelledby="ab">
            <div class="modal-dialog modal-dialog-centered text-center" role="document">
                <div class="modal-content tx-size-sm">
                    <div class="modal-body text-center p-4">
                        <asp:Button runat="server" ID="btnCLose" aria-label="Close" class="btn-close" Text="Hello"></asp:Button>
                        <i class="fe fe-check-circle fs-65 text-success lh-1 mb-5 d-inline-block"></i>
                        <h4 id="ab" class="text-success tx-semibold">Congratulations!</h4>
                        <p class="text-muted">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration.</p>
                        <button aria-label="Close" class="btn btn-success pd-x-25" data-bs-dismiss="modal">Continue</button>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <div class="app-content main-content mt-0">
        <div class="side-app">
            <!-- CONTAINER -->
            <div class="main-container container-fluid">
                <!-- PAGE-HEADER -->
                <div class="page-header">
                    <div>
                        <h1 class="page-title">કેસ</h1>
                    </div>
                    <div class="ms-auto pageheader-btn">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">હોમ</a></li>
                            <li class="breadcrumb-item active" aria-current="page">કેસ</li>
                        </ol>
                    </div>
                </div>
                <!-- PAGE-HEADER END -->
                <script type="text/javascript" src="../assets/js/jquery1.min.js"></script>
                <link rel="stylesheet" href="../assets/css/select2.min.css" />
                <script type="text/javascript" src="../assets/js/select2.min.js"></script>
                <asp:Panel ID="pnlAdmin" runat="server" class="form-horizontal" Visible="false">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header border-bottom">
                                <h3 class="card-title">નવો કેસ દાખલ કરો</h3>
                            </div>
                            <div class="card-body">
                                <p class="text-muted"></p>
                                <asp:Label ID="numUniqueID" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                                <asp:FormView ID="frmVwAdmin" runat="server" Width="100%" DataKeyNames="id"
                                    DataSourceID="headDetail" OnDataBound="frmVwAdmin_DataBound"
                                    OnItemInserting="frmVwAdmin_ItemInserting"
                                    OnItemUpdating="frmVwAdmin_ItemUpdating" OnPreRender="frmVwAdmin_PreRender">
                                    <EditItemTemplate>
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="card card-body pd-20 pd-md-40 border shadow-none">
                                                    <h4 class="card-title">અહીં વિગતો દાખલ કરો</h4>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">પ્રકાર</label>
                                                                <asp:DropDownList ID="ddlFirTYpe" Enabled="false" Text='<%# Bind("firTypeid") %>' runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="dsFirType" DataTextField="name" DataValueField="id">
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsFirType" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_fir_type_search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>"></asp:SqlDataSource>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="a" ControlToValidate="ddlFirType" SetFocusOnError="true" ForeColor="Red" ErrorMessage="કૃપા કરીને FIR Type પસંદ કરો"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">FIR  નં.</label>
                                                                <asp:TextBox ID="txtFIRNo" Enabled="false" class="form-control" runat="server" Text='<%# Bind("firNo") %>' placeholder="FIR  નં."></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtFIRNo" ErrorMessage="FIR  નં."></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">વર્ષ</label>
                                                                <asp:TextBox ID="txtMudYear" class="form-control" Enabled="false" runat="server" placeholder="કેસનુ વર્ષ દાખલ કરો" Text='<%# Bind("year") %>'></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtMudYear" ErrorMessage="કેસનુ વર્ષ દાખલ કરો"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">પોલીસ સ્ટેશન</label>
                                                                <asp:DropDownList ID="ddlPoliceStation" Text='<%# Bind("departmentId") %>' runat="server" AppendDataBoundItems="True" CssClass="form-control" OnSelectedIndexChanged="ddlPoliceStation_SelectedIndexChanged" DataSourceID="dsPoliceStation" DataTextField="name" DataValueField="id">
                                                                    <asp:ListItem Value="0" Text="પોલીસ સ્ટેશન પસંદ કરો"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsPoliceStation" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_accdepartment_search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                                                                    <SelectParameters>
                                                                        <asp:SessionParameter DefaultValue="0" SessionField="numUserId" Name="numUserId" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                                <asp:RequiredFieldValidator ID="ddlPoliceStationExtender" runat="server" ValidationGroup="a" ControlToValidate="ddlPoliceStation" SetFocusOnError="true" ForeColor="Red" ErrorMessage="કૃપા કરીને પોલીસ સ્ટેશન પસંદ કરો"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">તપાસ કરનાર અધિકારી</label>
                                                                <asp:TextBox ID="txtIOName" class="form-control" runat="server" Text='<%# Bind("ioName") %>' placeholder="તપાસ કરનાર અધિકારી"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtIOName" ErrorMessage="તપાસ કરનાર અધિકારી"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">કોર્ટનું નામ</label>
                                                                <asp:DropDownList ID="ddlCourtName" runat="server" AppendDataBoundItems="True" CssClass="form-control" OnSelectedIndexChanged="ddlCourtName_SelectedIndexChanged" DataSourceID="dsCourtName" DataTextField="name" DataValueField="id" Text='<%# Bind("courtId") %>'>
                                                                    <asp:ListItem Value="0" Text="Select a Court"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsCourtName" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM courtname WHERE isActive = 1"></asp:SqlDataSource>
                                                                <asp:RequiredFieldValidator ID="ddlCourtNameExtender" runat="server" ValidationGroup="a" SetFocusOnError="true" ControlToValidate="ddlCourtName" ForeColor="Red" ErrorMessage="Please Select a Court"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">સ્થિતિ</label>
                                                                <asp:DropDownList ID="ddlStatus" runat="server" AppendDataBoundItems="True" CssClass="form-control" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" DataSourceID="dsStatus" DataTextField="name" DataValueField="id" Text='<%# Bind("statusId") %>'>
                                                                    <asp:ListItem Value="0" Text="Select a Status"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsStatus" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM status WHERE isActive = 1"></asp:SqlDataSource>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ValidationGroup="a" SetFocusOnError="true" ControlToValidate="ddlCourtName" ForeColor="Red" ErrorMessage="Please Select a Status"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">નિર્ણય તારીખ</label>
                                                                <asp:TextBox ID="decisionDate" class="form-control" ValidationGroup="a" TextMode="Date" runat="server" placeholder="મુદ્દા માલ નંબર દાખલ કરો" Text='<%# !string.IsNullOrEmpty(Eval("dateDecision").ToString())?DateTime.ParseExact(Eval("dateDecision").ToString(), "dd-MM-yyyy HH:mm:ss",
                                       System.Globalization.CultureInfo.InvariantCulture).ToString("yyyy-MM-dd"):"" %>'></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">કેસનો નિર્ણય કર્યો</label>
                                                                <asp:CheckBox ID="caseDecided" runat="server" CssClass="toggle toggle-success" Checked='<%# "1" == Eval("caseDecided").ToString()?true:false %>' />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">FIR તારીખ</label>
                                                                <asp:TextBox ID="firDate" class="form-control" ValidationGroup="a" TextMode="Date" runat="server" placeholder="FIR તારીખ" Text='<%# !string.IsNullOrEmpty(Eval("firDate").ToString())?DateTime.ParseExact(Eval("firDate").ToString(), "dd-MM-yyyy HH:mm:ss",
                                       System.Globalization.CultureInfo.InvariantCulture).ToString("yyyy-MM-dd"):"" %>'></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">કોની પાસેથી જપ્ત </label>
                                                                <asp:TextBox ID="fromWhom" class="form-control" ValidationGroup="a" runat="server" placeholder="કોની પાસેથી જપ્ત " Text='<%# Bind("fromWhom") %>'></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="a" SetFocusOnError="true" ControlToValidate="fromWhom" ForeColor="Red" ErrorMessage="કોની પાસેથી જપ્ત "></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">જપ્તિ નુ સ્થળ </label>
                                                                <asp:TextBox ID="fromWhere" class="form-control" ValidationGroup="a" runat="server" placeholder="જપ્તિ નુ સ્થળ " Text='<%# Bind("fromWhere") %>'></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="a" SetFocusOnError="true" ControlToValidate="fromWhere" ForeColor="Red" ErrorMessage="જપ્તિ નુ સ્થળ "></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">કેસ કરનાર એજન્સી</label>
                                                                <asp:DropDownList ID="ddlProsecutingAgency" runat="server" AppendDataBoundItems="True" CssClass="form-control" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" Text='<%# Bind("proesucutingAgencyId") %>' DataSourceID="dsddlProsecutingAgency" DataTextField="name" DataValueField="id">
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsddlProsecutingAgency" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM prosecutingagency WHERE isActive = 1"></asp:SqlDataSource>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="a" SetFocusOnError="true" ControlToValidate="ddlProsecutingAgency" ForeColor="Red" ErrorMessage="Please Select a Prosecution Agency"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Report To Court Date</label>
                                                                <asp:TextBox ID="TextBox1" class="form-control" ValidationGroup="a" Enabled="false" TextMode="Date" runat="server" placeholder="Report To Court Date" Text='<%# !string.IsNullOrEmpty(Eval("reportToCourtDate").ToString())?DateTime.ParseExact(Eval("firDate").ToString(), "dd-MM-yyyy HH:mm:ss",
                                       System.Globalization.CultureInfo.InvariantCulture).ToString("yyyy-MM-dd"):"" %>'></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Report To Court ID</label>
                                                                <asp:TextBox ID="TextBox2" class="form-control" Enabled="false" ValidationGroup="a" runat="server" placeholder="Report To Court ID" Text='<%# Bind("reportToCourtId") %>'></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <asp:GridView ID="Gridview1" runat="server" ShowFooter="true"
                                                                AutoGenerateColumns="false" Width="100%"
                                                                OnRowCreated="Gridview1_RowCreated">
                                                                <Columns>
                                                                    <asp:BoundField DataField="RowNumber" HeaderText="S.No." ItemStyle-Width="10%" />
                                                                    <asp:TemplateField HeaderText="કાયદા" ItemStyle-Width="25%">
                                                                        <ItemTemplate>
                                                                            <asp:DropDownList ID="act" runat="server" AppendDataBoundItems="True" CssClass="form-control" OnSelectedIndexChanged="act_SelectedIndexChanged" DataSourceID="actDs" AutoPostBack="true" DataTextField="name" DataValueField="id">
                                                                            </asp:DropDownList>
                                                                            <asp:SqlDataSource ID="actDs" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM act WHERE isActive = 1"></asp:SqlDataSource>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="કલમ" ItemStyle-Width="40%">
                                                                        <ItemTemplate>
                                                                            <asp:ListBox Width="40%" SelectionMode="Single" ID="sectionList" DataTextField="name" DataValueField="id" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Table" CssClass="chkChoice" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-Width="25%">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="LinkButton1" runat="server"
                                                                                OnClick="LinkButton1_Click">Remove</asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <asp:Button ID="ButtonAdd" runat="server"
                                                                Text="નવો કાયદા અને કલમ દાખલ કરો " CssClass="btn btn-primary"
                                                                OnClick="ButtonAdd_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="card card-body pd-20 pd-md-40 border shadow-none">
                                                    <h4 class="card-title">અહીં વિગતો દાખલ કરો</h4>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">પ્રકાર</label>
                                                                <asp:DropDownList ID="ddlFirTYpe" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="dsFirType" DataTextField="name" DataValueField="id">
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsFirType" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_fir_type_search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>"></asp:SqlDataSource>
                                                                <asp:RequiredFieldValidator ID="ddlPoliceStationExtender" runat="server" ValidationGroup="a" ControlToValidate="ddlFirType" SetFocusOnError="true" ForeColor="Red" ErrorMessage="કૃપા કરીને FIR Type પસંદ કરો"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">FIR  નં.</label>
                                                                <asp:TextBox ID="txtFIRNo" class="form-control" runat="server" placeholder="FIR  નં."></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtFIRNo" ErrorMessage="FIR  નં."></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">વર્ષ</label>
                                                                <asp:TextBox ID="txtMudYear" class="form-control" runat="server" placeholder="કેસનુ વર્ષ દાખલ કરો"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtMudYear" ErrorMessage="કેસનુ વર્ષ દાખલ કરો"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">પોલીસ સ્ટેશન</label>
                                                                <asp:DropDownList ID="ddlPoliceStation" runat="server" AppendDataBoundItems="True" CssClass="form-control" OnSelectedIndexChanged="ddlPoliceStation_SelectedIndexChanged" DataSourceID="dsPoliceStation" DataTextField="name" DataValueField="id">
                                                                    <asp:ListItem Value="0" Text="પોલીસ સ્ટેશન પસંદ કરો"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsPoliceStation" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_accdepartment_search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                                                                    <SelectParameters>
                                                                        <asp:SessionParameter DefaultValue="0" SessionField="numUserId" Name="numUserId" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="a" ControlToValidate="ddlPoliceStation" SetFocusOnError="true" ForeColor="Red" ErrorMessage="કૃપા કરીને પોલીસ સ્ટેશન પસંદ કરો"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">તપાસ કરનાર અધિકારી</label>
                                                                <asp:TextBox ID="txtIOName" class="form-control" runat="server" placeholder="તપાસ કરનાર અધિકારી"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtIOName" ErrorMessage="તપાસ કરનાર અધિકારી"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">કોર્ટનું નામ</label>
                                                                <asp:DropDownList ID="ddlCourtName" runat="server" AppendDataBoundItems="True" CssClass="form-control" OnSelectedIndexChanged="ddlCourtName_SelectedIndexChanged" DataSourceID="dsCourtName" DataTextField="name" DataValueField="id">
                                                                    <asp:ListItem Value="0" Text="Select a Court"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsCourtName" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM courtname WHERE isActive = 1"></asp:SqlDataSource>
                                                                <asp:RequiredFieldValidator ID="ddlCourtNameExtender" runat="server" ValidationGroup="a" SetFocusOnError="true" ControlToValidate="ddlCourtName" ForeColor="Red" ErrorMessage="Please Select a Court"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">સ્થિતિ</label>
                                                                <asp:DropDownList ID="ddlStatus" runat="server" AppendDataBoundItems="True" CssClass="form-control" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" DataSourceID="dsStatus" DataTextField="name" DataValueField="id">
                                                                    <asp:ListItem Value="0" Text="Select a Status"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsStatus" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM status WHERE isActive = 1"></asp:SqlDataSource>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ValidationGroup="a" SetFocusOnError="true" ControlToValidate="ddlCourtName" ForeColor="Red" ErrorMessage="Please Select a Status"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">કેસનો નિર્ણય કર્યો</label>
                                                                <asp:CheckBox ID="caseDecided" runat="server" CssClass="toggle toggle-success" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">નિર્ણય તારીખ</label>
                                                                <asp:TextBox ID="decisionDate" class="form-control" ValidationGroup="a" TextMode="Date" runat="server" placeholder="મુદ્દા માલ નંબર દાખલ કરો"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">FIR તારીખ</label>
                                                                <asp:TextBox ID="firDate" class="form-control" ValidationGroup="a" TextMode="Date" runat="server" placeholder="FIR તારીખ"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="a" SetFocusOnError="true" ControlToValidate="firDate" ForeColor="Red" ErrorMessage="Please Select FIR Date"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">કોની પાસેથી જપ્ત </label>
                                                                <asp:TextBox ID="fromWhom" class="form-control" ValidationGroup="a" runat="server" placeholder="કોની પાસેથી જપ્ત "></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="a" SetFocusOnError="true" ControlToValidate="fromWhom" ForeColor="Red" ErrorMessage="કોની પાસેથી જપ્ત "></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">જપ્તિ નુ સ્થળ </label>
                                                                <asp:TextBox ID="fromWhere" class="form-control" ValidationGroup="a" runat="server" placeholder="જપ્તિ નુ સ્થળ "></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="a" SetFocusOnError="true" ControlToValidate="fromWhere" ForeColor="Red" ErrorMessage="જપ્તિ નુ સ્થળ "></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">કેસ કરનાર એજન્સી</label>
                                                                <asp:DropDownList ID="ddlProsecutingAgency" runat="server" AppendDataBoundItems="True" CssClass="form-control" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" DataSourceID="dsddlProsecutingAgency" DataTextField="name" DataValueField="id">
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsddlProsecutingAgency" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM prosecutingagency WHERE isActive = 1"></asp:SqlDataSource>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="a" SetFocusOnError="true" ControlToValidate="ddlProsecutingAgency" ForeColor="Red" ErrorMessage="Please Select a Prosecution Agency"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <asp:GridView ID="Gridview1" runat="server" ShowFooter="true"
                                                                AutoGenerateColumns="false" Width="100%"
                                                                OnRowCreated="Gridview1_RowCreated">
                                                                <Columns>
                                                                    <asp:BoundField DataField="RowNumber" HeaderText="S.No." ItemStyle-Width="10%" />
                                                                    <asp:TemplateField HeaderText="કાયદા" ItemStyle-Width="25%">
                                                                        <ItemTemplate>
                                                                            <asp:DropDownList ID="act" runat="server" AppendDataBoundItems="True" CssClass="form-control" OnSelectedIndexChanged="act_SelectedIndexChanged" DataSourceID="actDs" AutoPostBack="true" DataTextField="name" DataValueField="id">
                                                                            </asp:DropDownList>
                                                                            <asp:SqlDataSource ID="actDs" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM act WHERE isActive = 1"></asp:SqlDataSource>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="કલમ" ItemStyle-Width="40%">
                                                                        <ItemTemplate>
                                                                            <asp:ListBox Width="40%" SelectionMode="Single" ID="sectionList" DataTextField="name" DataValueField="id" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Table" CssClass="chkChoice" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-Width="25%">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="LinkButton1" runat="server"
                                                                                OnClick="LinkButton1_Click">Remove</asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <asp:Button ID="ButtonAdd" runat="server"
                                                                Text="નવો Act/Section દાખલ કરો " CssClass="btn btn-primary"
                                                                OnClick="ButtonAdd_Click" />
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
                                    SelectCommand="sp_fir_search" SelectCommandType="StoredProcedure" ProviderName="MySql.Data.MySqlClient">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="0" SessionField="numUserId" Name="numUserId" Type="Int32" />
                                        <asp:ControlParameter ControlID="numUniqueID" DefaultValue="0"
                                            Name="numId" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                    <InsertParameters>
                                        <asp:SessionParameter DefaultValue="0" SessionField="numUserId" Name="numUserId" Type="Int32" />
                                        <asp:ControlParameter ControlID="numUniqueID" DefaultValue="0"
                                            Name="numId" PropertyName="Text" Type="String" />
                                    </InsertParameters>
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
                                    <h3 class="card-title mb-0">કેસ યાદી</h3>
                                </div>
                                <div>
                                    <asp:Button runat="server" CssClass="btn btn-primary" Text="નવો કેસ બનાવો" OnClick="btnAddNew_Click"></asp:Button>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="offset-3 col-md-3">
                                        <asp:TextBox ID="txtMudhNo" Width="100%" CssClass="form-fieldset" runat="server" placeholder="મહેરબાની કરીને અહીં કેસ નંબર દાખલ કરો"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Button CssClass="btn btn-primary" ID="textSubmit" runat="server" OnClick="textSubmit_Click" Text="હવે શોધો"></asp:Button>
                                    </div>
                                </div>
                                <asp:ListView ID="lstView" runat="server" DataKeyNames="id" DataSourceID="store_customer"
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
                                                <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex + 1 %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("year") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("departmentName") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("firNoWithType") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("ioName") %>' /></td>
                                            <td>
                                                <div class="d-flex align-items-stretch">
                                                    <asp:ImageButton ID="btnEdit" ToolTip="Edit" Height="25px" Width="25px" runat="server" CommandArgument='<%# Eval("id") %>'
                                                        CommandName="EDITRECORD" ImageUrl="assets/images/action-edit.png" />
                                                    <asp:ConfirmButtonExtender ID="btnEdit_ConfirmButtonExtender" runat="server" ConfirmText="શું તમે આ રેકોર્ડમાં ફેરફાર કરવા માંગો છો?"
                                                        Enabled="True" TargetControlID="btnEdit"></asp:ConfirmButtonExtender>
                                                    <asp:ImageButton ID="btnDelete" ToolTip="Delete" Height="25px" Width="25px" runat="server" CommandArgument='<%# Eval("id") %>'
                                                        CommandName="DELETERECORD" ImageUrl="assets/images/action-remove.png" />
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
                                                        <th class="bg-transparent border-bottom-0">વર્ષ</th>
                                                        <th class="bg-transparent border-bottom-0">પોલીસ સ્ટેશનનું નામ</th>
                                                        <th class="bg-transparent border-bottom-0">FIR  નં.</th>
                                                        <th class="bg-transparent border-bottom-0">તપાસ કરનાર અધિકારી</th>
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
                                <asp:ObjectDataSource ID="store_customer" runat="server" TypeName="EMalkhana.MudhSearch" SelectMethod="GetFirDetails" EnablePaging="true"
                                    StartRowIndexParameterName="startrows" MaximumRowsParameterName="pagesize" SelectCountMethod="GetFirCount">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtMudhNo" DefaultValue="" Type="String" Name="txtMudhNo" />
                                        <asp:SessionParameter DefaultValue="0" SessionField="numUserId" Name="numUserId" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                        </div>
                    </div>
                    <!-- COL END -->

                    <asp:SqlDataSource ID="headView" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_fir_Search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
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
            $('[id*=sectionList]').select2({
                placeholder: "Search a section",
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
