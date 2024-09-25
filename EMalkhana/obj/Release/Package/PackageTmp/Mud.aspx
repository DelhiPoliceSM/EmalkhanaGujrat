<%@ Page Title="" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="Mud.aspx.cs" Inherits="EMalkhana.Mud" %>

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
                        <h1 class="page-title">Mud</h1>
                    </div>
                    <div class="ms-auto pageheader-btn">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Mud</li>
                        </ol>
                    </div>
                </div>
                <!-- PAGE-HEADER END -->
                <div id="divMultipleQR" runat="server">
                </div>
                <asp:Panel ID="Panel2" runat="server" class="form-horizontal" Visible="False">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header border-bottom">
                                <h3 class="card-title">QR CODE</h3>
                            </div>
                            <div class="card-body">
                                <p class="text-muted"></p>
                                <div class="row">
                                    <asp:Label ID="numPrintId" name="numPrintId" runat="server" Style="display: none"></asp:Label>
                                    <div class="col-md-12" id="printQRCode" align="center">
                                        <asp:Image ID="qrCodeImg" Height="200px" Width="200px" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="offset-4 col-md-2">
                                        <asp:Button ID="Print" Width="100%" runat="server" Text="Print" CssClass="btn btn-success" OnClientClick="printDiv()" CausesValidation="False" />
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Button ID="Button4" Width="100%" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClick="btnCancel_Click_qr" CausesValidation="False" />
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="pnlAdminNew" runat="server" class="form-horizontal" Visible="False">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header border-bottom">
                                <h3 class="card-title">MUD અહીં સ્થાનાંતરિત કરો</h3>
                            </div>
                            <div class="card-body">
                                <p class="text-muted"></p>
                                <asp:FormView ID="FormView1" runat="server" Width="100%" DataKeyNames="id"
                                    DataSourceID="SqlDataSource1" OnDataBound="frmVwAdmin_DataBound"
                                    OnItemUpdating="frmVwAdmin_transfer">
                                    <EditItemTemplate>
                                        <div class="row">
                                            <div class="card card-body pd-20 pd-md-40 border shadow-none">
                                                <h4 class="card-title">અહીં વિગતો દાખલ કરો</h4>
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="form-label" for="card-name">Mud Number</label>
                                                            <asp:TextBox ID="txtMudNumber" Enabled="false" class="form-control" ValidationGroup="a" type="text" runat="server" Text='<%# Bind("mudNo") %>' placeholder="Enter Mud Number"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="regex" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtMudNumber" ErrorMessage="Please Enter Mud Number"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="form-label" for="card-name">Check this if the asset has to be presented in court</label>
                                                            <asp:CheckBox OnCheckedChanged="isPresentedInCourt_CheckedChanged" AutoPostBack="true" runat="server" ID="isPresentedInCourt" Text="Is to be presented in court?" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <asp:Label class="form-label" for="card-name" ID="lblPoliceStation" runat="server">Police Station</asp:Label>
                                                            <asp:DropDownList ID="ddlPoliceStation" runat="server" AppendDataBoundItems="True" CssClass="form-control" OnSelectedIndexChanged="ddlPoliceStation_SelectedIndexChanged" DataSourceID="dsPoliceStation" DataTextField="name" DataValueField="id">
                                                                <asp:ListItem Value="0" Text="Select a Police Station"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:SqlDataSource ID="dsPoliceStation" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM department WHERE isPS = 1"></asp:SqlDataSource>

                                                            <asp:DropDownList ID="ddlCourtName" Visible="false" runat="server" AppendDataBoundItems="True" CssClass="form-control" OnSelectedIndexChanged="ddlCourtName_SelectedIndexChanged" DataSourceID="dsCourtName" DataTextField="name" DataValueField="id">
                                                                <asp:ListItem Value="0" Text="Select a Court"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:SqlDataSource ID="dsCourtName" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM courtname WHERE isActive = 1"></asp:SqlDataSource>

                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="form-label" for="card-name">RC Number</label>
                                                            <asp:TextBox ID="rcNum" class="form-control" ValidationGroup="a" type="text" runat="server" Text='' placeholder="Enter RC Number"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="rcNum" ErrorMessage="કૃપા કરીને ટ્રાન્સફરનું નામ દાખલ કરો"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="form-label" for="card-name">Sending via</label>
                                                            <asp:TextBox ID="sendingVia" class="form-control" ValidationGroup="a" type="text" runat="server" Text='' placeholder="Enter Transferee Name"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="sendingVia" ErrorMessage="કૃપા કરીને ટ્રાન્સફરનું નામ દાખલ કરો"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="form-label" for="card-name">Sent on</label>
                                                            <asp:TextBox ID="sentOn" class="form-control" ValidationGroup="a" type="date" runat="server" Text='' placeholder="Enter Sent On"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="sentOn" ErrorMessage="Please Enter Sent On"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="form-label" for="card-name">RC Certificate</label>
                                                            <asp:FileUpload type='file' ID="rc" runat="server" accept=".png,.jpg,.jpeg,.gif, .pdf" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="a" ControlToValidate="rc" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Please Select RC"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="form-label" for="card-name">Transferee ID</label>
                                                            <asp:FileUpload type='file' ID="id" runat="server" accept=".png,.jpg,.jpeg,.gif, .pdf" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="a" ControlToValidate="id" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Please Select ID"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                    </ItemTemplate>
                                </asp:FormView>
                                <div class="row">
                                    <div class="offset-4 col-md-2">
                                        <asp:Button ID="Button1" runat="server" Width="100%" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click_ps" ValidationGroup="a" />
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Button ID="Button2" Width="100%" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClick="btnCancel_Click_ps" CausesValidation="False" />
                                    </div>
                                </div>


                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>"
                                    SelectCommand="sp_Mud_search" SelectCommandType="StoredProcedure" ProviderName="MySql.Data.MySqlClient">
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
                <script type="text/javascript" src="../assets/js/jquery1.min.js"></script>
                <link rel="stylesheet" href="../assets/css/select2.min.css" />
                <script type="text/javascript" src="../assets/js/select2.min.js"></script>
                <asp:Panel ID="pnlAdmin" runat="server" class="form-horizontal" Visible="false">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header border-bottom">
                                <h3 class="card-title">Enter New Mud Here</h3>
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
                                                                <label class="form-label" for="card-name">Mud Number</label>
                                                                <asp:TextBox ID="txtMudNumber" Enabled="false" class="form-control" ValidationGroup="a" type="text" runat="server" Text='<%# Bind("mudNo") %>' placeholder="Enter Mud Number"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="regex" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtMudNumber" ErrorMessage="Please Enter Mud Number"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Mud Year</label>
                                                                <asp:TextBox ID="txtMudYear" class="form-control" runat="server" placeholder="Enter Mud Year" Text='<%# Bind("year") %>'></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtMudYear" ErrorMessage="કૃપા કરીને મડ વર્ષ દાખલ કરો"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">FIR / DD No</label>
                                                                <asp:TextBox ID="txtFIRNo" class="form-control" runat="server" Text='<%# Bind("firNo") %>' placeholder="Enter FIR / DD No"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtFIRNo" ErrorMessage="Please Enter FIR / DD No"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Police Station</label>
                                                                <asp:DropDownList ID="ddlPoliceStation" Enabled="false" runat="server" AppendDataBoundItems="True" Text='<%# Bind("departmentId") %>' CssClass="form-control" OnSelectedIndexChanged="ddlPoliceStation_SelectedIndexChanged" DataSourceID="dsPoliceStation" DataTextField="name" DataValueField="id">
                                                                    <asp:ListItem Value="0" Text="Select a Police Station"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsPoliceStation" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM department WHERE isPS = 1"></asp:SqlDataSource>
                                                                <asp:RequiredFieldValidator ID="ddlPoliceStationExtender" runat="server" ValidationGroup="a" ControlToValidate="ddlPoliceStation" SetFocusOnError="true" ForeColor="Red" ErrorMessage="કૃપા કરીને પોલીસ સ્ટેશન પસંદ કરો"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Head</label>
                                                                <asp:DropDownList ID="ddlHead" runat="server" AppendDataBoundItems="True" CssClass="form-control" Text='<%# Bind("headId") %>' OnSelectedIndexChanged="ddlHead_SelectedIndexChanged" DataSourceID="dsHead" DataTextField="name" DataValueField="id">
                                                                    <asp:ListItem Value="0" Text="Select a Head"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsHead" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM head WHERE isActive = 1"></asp:SqlDataSource>
                                                                <asp:RequiredFieldValidator ID="ddlHeadExtender" runat="server" ValidationGroup="a" SetFocusOnError="true" ControlToValidate="ddlHead" ForeColor="Red" ErrorMessage="Please Select a Head"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">IO Name</label>
                                                                <asp:TextBox ID="txtIOName" class="form-control" runat="server" Text='<%# Bind("ioName") %>' placeholder="Enter IO Name"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtIOName" ErrorMessage="Please Enter IO Name"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">જપ્તી તારીખ</label>
                                                                <asp:TextBox ID="txtSeizureDate" class="form-control" ValidationGroup="a" type="date" Text='<%# !string.IsNullOrEmpty(Eval("sDate").ToString())?DateTime.ParseExact(Eval("sDate").ToString(), "dd-MM-yyyy HH:mm:ss",
                                       System.Globalization.CultureInfo.InvariantCulture).ToString("yyyy-MM-dd"):"" %>'
                                                                    runat="server" placeholder="Enter Mud Number"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtSeizureDate" ErrorMessage="Please enter a Date"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Location of Mud</label>
                                                                <asp:TextBox ID="txtLocationOfMud" class="form-control" runat="server" Text='<%# Bind("location") %>' placeholder="Enter Location of Mud"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtLocationOfMud" ErrorMessage="Please Enter Mud Location"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Description of Mud</label>
                                                                <asp:TextBox ID="txtDescription" class="form-control" ValidationGroup="a" Text='<%# Bind("description") %>' TextMode="MultiLine" Rows="3" runat="server" placeholder="Enter Mud Description"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtDescription" ErrorMessage="Please Enter Mud Description"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Section</label>
                                                                <asp:ListBox SelectionMode="Multiple" ID="sectionList" DataTextField="name" DataValueField="id" runat="server" DataSourceID="dsSectionList" RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Table" CssClass="chkChoice" Width="100%"></asp:ListBox>
                                                                <asp:SqlDataSource ID="dsSectionList" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM section WHERE isActive = 1"></asp:SqlDataSource>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Court Name</label>
                                                                <asp:DropDownList ID="ddlCourtName" runat="server" AppendDataBoundItems="True" Text='<%# Bind("courtId") %>' CssClass="form-control" OnSelectedIndexChanged="ddlCourtName_SelectedIndexChanged" DataSourceID="dsCourtName" DataTextField="name" DataValueField="id">
                                                                    <asp:ListItem Value="0" Text="Select a Court"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsCourtName" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM courtname WHERE isActive = 1"></asp:SqlDataSource>
                                                                <asp:RequiredFieldValidator ID="ddlCourtNameExtender" runat="server" ValidationGroup="a" SetFocusOnError="true" ControlToValidate="ddlCourtName" ForeColor="Red" ErrorMessage="Please Select a Court"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Status</label>
                                                                <asp:DropDownList ID="ddlStatus" runat="server" Text='<%# Bind("statusId") %>' AppendDataBoundItems="True" CssClass="form-control" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" DataSourceID="dsStatus" DataTextField="name" DataValueField="id">
                                                                    <asp:ListItem Value="0" Text="Select a Status"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsStatus" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM status WHERE isActive = 1"></asp:SqlDataSource>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ValidationGroup="a" SetFocusOnError="true" ControlToValidate="ddlCourtName" ForeColor="Red" ErrorMessage="Please Select a Status"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Disposal</label>
                                                                <asp:DropDownList ID="ddlDisposal" runat="server" Text='<%# Bind("disposalId") %>' AppendDataBoundItems="True" CssClass="form-control" OnSelectedIndexChanged="ddlDisposal_SelectedIndexChanged" DataSourceID="dsDisposal" DataTextField="name" DataValueField="id">
                                                                    <asp:ListItem Value="0" Text="Select Disposal"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsDisposal" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM disposal WHERE isActive = 1"></asp:SqlDataSource>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="a" SetFocusOnError="true" ControlToValidate="ddlCourtName" ForeColor="Red" ErrorMessage="Please Select a Disposal"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Case Decided</label>
                                                                <asp:CheckBox ID="caseDecided" Checked='<%# "1" == Eval("caseDecided").ToString()?true:false %>' runat="server" CssClass="toggle toggle-success" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Decision Date</label>
                                                                <asp:TextBox ID="decisionDate" class="form-control" Text='<%# !string.IsNullOrEmpty(Eval("dateDecision").ToString())?DateTime.ParseExact(Eval("dateDecision").ToString(), "dd-MM-yyyy HH:mm:ss",
                                       System.Globalization.CultureInfo.InvariantCulture).ToString("yyyy-MM-dd"):"" %>'
                                                                    ValidationGroup="a" type="text" runat="server" placeholder="Enter Mud Number"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Destroy Order Date</label>
                                                                <asp:TextBox ID="destroyOrderDate" class="form-control" Text='<%# !string.IsNullOrEmpty(Eval("dateOrderDestroy").ToString())?DateTime.ParseExact(Eval("dateOrderDestroy").ToString(), "dd-MM-yyyy HH:mm:ss",
                                       System.Globalization.CultureInfo.InvariantCulture).ToString("yyyy-MM-dd"):""%>'
                                                                    ValidationGroup="a" type="date" runat="server" placeholder="Enter Mud Number"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Destroy Date</label>
                                                                <asp:TextBox ID="dateDestory" class="form-control" ValidationGroup="a" Text='<%# !string.IsNullOrEmpty(Eval("dateDestroy").ToString())?DateTime.ParseExact(Eval("dateDestroy").ToString(), "dd-MM-yyyy HH:mm:ss",
                                         System.Globalization.CultureInfo.InvariantCulture).ToString("yyyy-MM-dd"):""%>'
                                                                    type="date" runat="server" placeholder="Enter Mud Number"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="card card-body pd-20 pd-md-40 border shadow-none">
                                                    <div class="row">
                                                        <asp:Image runat="server" Height="100%" Width="100%" ID="image_upload_preview" ImageUrl='<%# Bind("photoId") %>' AlternateText="No Pic " />
                                                    </div>
                                                    <div class="clear">
                                                        <br />
                                                        <br />
                                                        <br />
                                                    </div>
                                                    <div class="row">
                                                        <asp:FileUpload type='file' ID="inputFile" runat="server" accept=".png,.jpg,.jpeg,.gif, .pdf" />
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
                                                                <label class="form-label" for="card-name">Mud Number</label>
                                                                <asp:TextBox ID="txtMudNumber" class="form-control" ValidationGroup="a" type="text" runat="server" placeholder="Enter Mud Number"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="regex" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtMudNumber" ErrorMessage="Please Enter Mud Number"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Mud Year</label>
                                                                <asp:TextBox ID="txtMudYear" class="form-control" runat="server" placeholder="Enter Mud Year"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtMudYear" ErrorMessage="કૃપા કરીને મડ વર્ષ દાખલ કરો"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">FIR / DD No</label>
                                                                <asp:TextBox ID="txtFIRNo" class="form-control" runat="server" placeholder="Enter FIR / DD No"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtFIRNo" ErrorMessage="Please Enter FIR / DD No"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Police Station</label>
                                                                <asp:DropDownList ID="ddlPoliceStation" runat="server" AppendDataBoundItems="True" CssClass="form-control" OnSelectedIndexChanged="ddlPoliceStation_SelectedIndexChanged" DataSourceID="dsPoliceStation" DataTextField="name" DataValueField="id">
                                                                    <asp:ListItem Value="0" Text="Select a Police Station"></asp:ListItem>
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
                                                                <label class="form-label" for="card-name">Head</label>
                                                                <asp:DropDownList ID="ddlHead" runat="server" AppendDataBoundItems="True" CssClass="form-control" OnSelectedIndexChanged="ddlHead_SelectedIndexChanged" DataSourceID="dsHead" DataTextField="name" DataValueField="id">
                                                                    <asp:ListItem Value="0" Text="Select a Head"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsHead" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM head WHERE isActive = 1"></asp:SqlDataSource>
                                                                <asp:RequiredFieldValidator ID="ddlHeadExtender" runat="server" ValidationGroup="a" SetFocusOnError="true" ControlToValidate="ddlHead" ForeColor="Red" ErrorMessage="Please Select a Head"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">IO Name</label>
                                                                <asp:TextBox ID="txtIOName" class="form-control" runat="server" placeholder="Enter IO Name"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtIOName" ErrorMessage="Please Enter IO Name"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">જપ્તી તારીખ</label>
                                                                <asp:TextBox ID="txtSeizureDate" class="form-control" ValidationGroup="a" type="date" runat="server" placeholder="Enter Mud Number"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtSeizureDate" ErrorMessage="Please enter a Date"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Location of Mud</label>
                                                                <asp:TextBox ID="txtLocationOfMud" class="form-control" runat="server" placeholder="Enter Location of Mud"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtLocationOfMud" ErrorMessage="Please Enter Mud Location"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Description of Mud</label>
                                                                <asp:TextBox ID="txtDescription" class="form-control" ValidationGroup="a" TextMode="MultiLine" Rows="3" runat="server" placeholder="Enter Mud Description"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtDescription" ErrorMessage="Please Enter Mud Description"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Section</label>
                                                                <asp:ListBox SelectionMode="Multiple" ID="sectionList" DataTextField="name" DataValueField="id" runat="server" DataSourceID="dsSectionList" RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Table" CssClass="chkChoice" Width="100%"></asp:ListBox>
                                                                <asp:SqlDataSource ID="dsSectionList" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM section WHERE isActive = 1"></asp:SqlDataSource>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Court Name</label>
                                                                <asp:DropDownList ID="ddlCourtName" runat="server" AppendDataBoundItems="True" CssClass="form-control" OnSelectedIndexChanged="ddlCourtName_SelectedIndexChanged" DataSourceID="dsCourtName" DataTextField="name" DataValueField="id">
                                                                    <asp:ListItem Value="0" Text="Select a Court"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsCourtName" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM courtname WHERE isActive = 1"></asp:SqlDataSource>
                                                                <asp:RequiredFieldValidator ID="ddlCourtNameExtender" runat="server" ValidationGroup="a" SetFocusOnError="true" ControlToValidate="ddlCourtName" ForeColor="Red" ErrorMessage="Please Select a Court"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Status</label>
                                                                <asp:DropDownList ID="ddlStatus" runat="server" AppendDataBoundItems="True" CssClass="form-control" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" DataSourceID="dsStatus" DataTextField="name" DataValueField="id">
                                                                    <asp:ListItem Value="0" Text="Select a Status"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsStatus" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM status WHERE isActive = 1"></asp:SqlDataSource>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ValidationGroup="a" SetFocusOnError="true" ControlToValidate="ddlCourtName" ForeColor="Red" ErrorMessage="Please Select a Status"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Disposal</label>
                                                                <asp:DropDownList ID="ddlDisposal" runat="server" AppendDataBoundItems="True" CssClass="form-control" OnSelectedIndexChanged="ddlDisposal_SelectedIndexChanged" DataSourceID="dsDisposal" DataTextField="name" DataValueField="id">
                                                                    <asp:ListItem Value="0" Text="Select Disposal"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="dsDisposal" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM disposal WHERE isActive = 1"></asp:SqlDataSource>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="a" SetFocusOnError="true" ControlToValidate="ddlCourtName" ForeColor="Red" ErrorMessage="Please Select a Disposal"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Case Decided</label>
                                                                <asp:CheckBox ID="caseDecided" runat="server" CssClass="toggle toggle-success" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Decision Date</label>
                                                                <asp:TextBox ID="decisionDate" class="form-control" ValidationGroup="a" type="date" runat="server" placeholder="Enter Mud Number"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Destroy Order Date</label>
                                                                <asp:TextBox ID="destroyOrderDate" class="form-control" ValidationGroup="a" type="date" runat="server" placeholder="Enter Mud Number"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Destroy Date</label>
                                                                <asp:TextBox ID="dateDestory" class="form-control" ValidationGroup="a" type="date" runat="server" placeholder="Enter Mud Number"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="card card-body pd-20 pd-md-40 border shadow-none">
                                                    <div class="row">
                                                        <asp:Image runat="server" Height="100%" Width="100%" ID="image_upload_preview" ImageUrl="~/assets/images/no-image.png" AlternateText="No Pic " />
                                                    </div>
                                                    <div class="clear">
                                                        <br />
                                                        <br />
                                                        <br />
                                                    </div>
                                                    <div class="row">
                                                        <asp:FileUpload type='file' ID="inputFile" runat="server" accept=".png,.jpg,.jpeg,.gif, .pdf" />
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
                                        <asp:Button ID="btnSubmit" runat="server" Width="100%" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="a" />
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Button ID="btnCancel" Width="100%" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClick="btnCancel_Click" CausesValidation="False" />
                                    </div>
                                </div>


                                <asp:SqlDataSource ID="headDetail" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>"
                                    SelectCommand="sp_Mud_search" SelectCommandType="StoredProcedure" ProviderName="MySql.Data.MySqlClient">
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
                                    <h3 class="card-title mb-0">Mud List</h3>
                                </div>
                                <div>
                                    <asp:Button runat="server" ID="bulkPrint" CssClass="btn btn-primary" Text="Print Selected Mudh QRs" OnClick="bulkPrint_Click"></asp:Button>
                                    <asp:Button runat="server" CssClass="btn btn-primary" Text="Create New Mud" OnClick="btnAddNew_Click"></asp:Button>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="offset-3 col-md-3">
                                        <asp:TextBox ID="txtMudhNo" Width="100%" CssClass="form-fieldset" runat="server" placeholder="Please Enter Mudh Number Here"></asp:TextBox>
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
                                            No record found.
                                        </div>
                                    </EmptyDataTemplate>
                                    <InsertItemTemplate>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:CheckBox ID="chkID" runat="server" /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="numRoleId" runat="server" Text='<%# Eval("id") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold" style="width: 30%">
                                                <asp:Label ID="txtName" runat="server" Text='<%# Eval("mudNo") %>' /></td>
                                            <!--<td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="txtDescription" runat="server" Text='<%# Eval("description") %>' /></td>-->
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("year") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("departmentName") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("headName") %>' /></td>
                                             <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("firNo") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("seizeDate") %>' />
                                            </td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("ioName") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("statusName") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("location") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("caseDecided").ToString()=="1"?true:false %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("dateDecision") %>' />
                                            </td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("courtName") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("dateOrderDestroy") %>' />
                                            </td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("dateDestroy") %>' />
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-stretch">
                                                    <asp:ImageButton ID="btnEdit" ToolTip="Edit" Height="25px" Width="25px" runat="server" CommandArgument='<%# Eval("id") %>'
                                                        CommandName="EDITRECORD" ImageUrl="assets/images/action-edit.png" />
                                                    <asp:ConfirmButtonExtender ID="btnEdit_ConfirmButtonExtender" runat="server" ConfirmText="શું તમે આ રેકોર્ડમાં ફેરફાર કરવા માંગો છો?"
                                                        Enabled="True" TargetControlID="btnEdit"></asp:ConfirmButtonExtender>
                                                    <asp:ImageButton ID="btnDelete" ToolTip="Delete" Height="25px" Width="25px" runat="server" CommandArgument='<%# Eval("id") %>'
                                                        CommandName="DELETERECORD" ImageUrl="assets/images/action-remove.png" />
                                                    <asp:ConfirmButtonExtender ID="btnDelete_ConfirmButtonExtender" runat="server" ConfirmText="શું તમે આ રેકોર્ડ દૂર કરવા માંગો છો?"
                                                        Enabled="True" TargetControlID="btnDelete"></asp:ConfirmButtonExtender>

                                                    <asp:ImageButton ID="btnPrintQR" ToolTip="Print QR Code" Height="25px" Width="25px" runat="server" CommandArgument='<%# Eval("mudNo") %>'
                                                        CommandName="PRINTRECORD" ImageUrl="assets/images/print.png" />

                                                    <asp:ImageButton
                                                        ID="btnTransfer" ToolTip="Transfer Record" Height="25px" Width="25px" runat="server" CommandArgument='<%# Eval("id") %>'
                                                        CommandName="TRANSFERRECORD" ImageUrl="assets/images/Transfer.png" />
                                                </div>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <div class="table-responsive">
                                            <table class="table text-nowrap mb-0 table-bordered">
                                                <thead class="table-head">
                                                    <tr>
                                                        <th class="bg-transparent border-bottom-0 wp-15"></th>
                                                        <th class="bg-transparent border-bottom-0 wp-15">ID</th>
                                                        <th class="bg-transparent border-bottom-0">Mud Number</th>
                                                        <!--<th class="bg-transparent border-bottom-0">Description</th>-->
                                                        <th class="bg-transparent border-bottom-0">Year</th>
                                                        <th class="bg-transparent border-bottom-0">Department</th>
                                                        <th class="bg-transparent border-bottom-0">Head</th>
                                                        <th class="bg-transparent border-bottom-0">FIR No</th>
                                                        <th class="bg-transparent border-bottom-0">જપ્તી તારીખ</th>
                                                        <th class="bg-transparent border-bottom-0">IO Name</th>
                                                        <th class="bg-transparent border-bottom-0">Status</th>
                                                        <th class="bg-transparent border-bottom-0">Location</th>
                                                        <th class="bg-transparent border-bottom-0">CaseDecided</th>
                                                        <th class="bg-transparent border-bottom-0">DateDecision</th>
                                                        <th class="bg-transparent border-bottom-0">Court Name</th>
                                                        <th class="bg-transparent border-bottom-0">ડિસ્ટોરીના ઓર્ડરની તારીખ</th>
                                                        <th class="bg-transparent border-bottom-0">નાશ કરવાની તારીખ</th>
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
                                <asp:ObjectDataSource ID="store_customer" runat="server" TypeName="EMalkhana.MudhSearch" SelectMethod="GetBlockedVehicle" EnablePaging="true"
                                    StartRowIndexParameterName="startrows" MaximumRowsParameterName="pagesize" SelectCountMethod="GetBlockedVehicleCount">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtMudhNo" DefaultValue="" Type="String" Name="txtMudhNo" />
                                        <asp:SessionParameter DefaultValue="0" SessionField="numUserId" Name="numUserId" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                        </div>
                    </div>
                    <!-- COL END -->

                    <asp:SqlDataSource ID="headView" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_Mud_Search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="numId" Type="Int32" />
                            <asp:SessionParameter DefaultValue="0" SessionField="numUserId" Name="numUserId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
            </div>
        </div>
    </div>
    <asp:Panel ID="panelQR" runat="server" OnLoad="panelQR_Load">
        <div class="modal fade" id="modaldemo4">
            <div class="modal-dialog modal-dialog-centered text-center " role="document">
                <div class="modal-content tx-size-sm">
                    <div class="modal-body text-center p-4">
                        <button aria-label="Close" class="btn-close" data-bs-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                        <i class="fe fe-check-circle fs-65 text-success lh-1 mb-5 d-inline-block"></i>
                        <h4 class="text-success tx-semibold">Congratulations!</h4>
                        <asp:Button ID="btnCheck" runat="server" Text="Button" />
                        <p class="text-muted">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration.</p>
                        <button aria-label="Close" class="btn btn-success pd-x-25" data-bs-dismiss="modal">Continue</button>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="panelTransfer" runat="server" OnLoad="panelTransfer_Load">
        <div class="modal fade" id="modaldemo5">
            <div class="modal-dialog modal-dialog-centered text-center " role="document">
                <div class="modal-content tx-size-sm">
                    <div class="modal-body text-center p-4">
                        <label class="form-label" for="card-name">Police Station</label>
                        <asp:DropDownList ID="transferPoliceStation" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="dsPoliceStation" DataTextField="name" DataValueField="id">
                            <asp:ListItem Value="0" Text="Select a Police Station"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsPoliceStation" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM department WHERE isPS = 1"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="ddlPoliceStationExtender" runat="server" ValidationGroup="a" ControlToValidate="transferPoliceStation" SetFocusOnError="true" ForeColor="Red" ErrorMessage="કૃપા કરીને પોલીસ સ્ટેશન પસંદ કરો"></asp:RequiredFieldValidator>
                        <asp:Button runat="server" aria-label="Submit" OnClick="transfer_submit" class="btn btn-success pd-x-25" data-bs-dismiss="modal" Text="Submit" />
                        <button aria-label="Close" class="btn btn-success pd-x-25" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <script language="javascript">
        function printDiv() {
            var printContents = document.getElementById("printQRCode").innerHTML;
            var originalContents = document.body.innerHTML;
            var numUniqueID = document.getElementsByName("numPrintId")[0].innerHTML;

            document.body.innerHTML = "<div style=\"text-align:center;width:;height:\"><div style=\"text-align:center\"><b>DELHI POLICE</b></div><br/><div style=\"text-align:center;\">" + printContents + " <br/></div><div style=\"text-align:center\">Mudh Number: " + numUniqueID + "</div></div>";

            var WinPrint = window.open('', '', 'left=0,top=0,width=1000,height=600,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(document.body.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();

            document.body.innerHTML = originalContents;
        }
        function printDivBulk() {
            var printContents = document.getElementById("bodyHolder_divMultipleQR").innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;

            var WinPrint = window.open('', '', 'left=0,top=0,width=1000,height=600,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(printContents);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();

            document.body.innerHTML = originalContents;
            document.getElementById("bodyHolder_divMultipleQR").innerHTML = "";
        }
    </script>
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
