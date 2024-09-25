<%@ Page Title="" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="SearchMud.aspx.cs" Inherits="EMalkhana.SearchMud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- JQUERY JS -->
    <script src="../assets/js/jquery.min.js"></script>

    <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <link href="https://atlas.microsoft.com/sdk/javascript/mapcontrol/2/atlas.min.css" rel="stylesheet" />
    <script src="https://atlas.microsoft.com/sdk/javascript/mapcontrol/2/atlas.min.js"></script>
    <link href="css/textbox.css" rel="stylesheet" />
    <!-- Bootstrap-Date Range Picker js-->
    <script src="assets/plugins/bootstrap-datepicker/bootstrap-datepicker.js"></script>
    <script src="assets\js\formelementadvnced.js"></script>
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
                        <h1 class="page-title">Search Mud</h1>
                    </div>
                    <div class="ms-auto pageheader-btn">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Search Mud</li>
                        </ol>
                    </div>
                </div>
                <!-- PAGE-HEADER END -->
                <div class="row">
                    <div class="col-12 col-sm-12">
                        <div class="card product-sales-main">
                            <div class="card-header border-bottom">
                                <span id="spanVehicleData" runat="server" style="display: none;">
                                    <asp:TextBox ID="txtVehicleData" runat="server"></asp:TextBox>
                                </span>
                                <div class="col-md-3">
                                    Enter Mud Number Here:
                                    <asp:TextBox CssClass="form-fieldset" ID="mudNo" runat="server" ></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <asp:Button CssClass="btn btn-primary" ID="btnSearch" OnClick="btnSearch_Click" runat="server" Text="હવે શોધો" />
								</div>
                                <!-- input-group -->
                            </div>
                        </div>
                    </div>
                </div>
               <div class="row">
                    <div class="col-12 col-sm-12">
                        <div class="card product-sales-main">
                            <div class="card-header border-bottom">
                                <div style="width: 90%">
                                    <h3 class="card-title mb-0">Mud List</h3>
                                </div>
                                <div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                            <div class="col-md-8">
                                                <div class="card card-body pd-20 pd-md-40 border shadow-none">
                                                    <h4 class="card-title">Mud Details</h4>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Mud Number</label>
                                                                <asp:TextBox Enabled="false" ID="txtMudNumber" class="form-control" ValidationGroup="a" type="text" runat="server" placeholder="Enter Mud Number"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="regex" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtMudNumber" ErrorMessage="Please Enter Mud Number"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Mud Year</label>
                                                                <asp:TextBox Enabled="false" ID="txtMudYear" class="form-control" runat="server" placeholder="Enter Mud Year"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtMudYear" ErrorMessage="કૃપા કરીને મડ વર્ષ દાખલ કરો"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">FIR / DD No</label>
                                                                <asp:TextBox Enabled="false" ID="txtFIRNo" class="form-control" runat="server" placeholder="Enter FIR / DD No"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtFIRNo" ErrorMessage="Please Enter FIR / DD No"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Police Station</label>
                                                                <asp:TextBox Enabled="false" ID="policeStation" class="form-control" runat="server" placeholder="Enter FIR / DD No"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Head</label>
                                                                <asp:TextBox Enabled="false" ID="head" class="form-control" runat="server" placeholder="Enter FIR / DD No"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">IO Name</label>
                                                                <asp:TextBox Enabled="false" ID="txtIOName" class="form-control" runat="server" placeholder="Enter IO Name"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtIOName" ErrorMessage="Please Enter IO Name"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">જપ્તી તારીખ</label>
                                                                <asp:TextBox Enabled="false" ID="txtSeizureDate" class="form-control" ValidationGroup="a" runat="server" placeholder="Enter Mud Number"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtSeizureDate" ErrorMessage="Please enter a Date"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Location of Mud</label>
                                                                <asp:TextBox Enabled="false" ID="txtLocationOfMud" class="form-control" runat="server" placeholder="Enter Location of Mud"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtLocationOfMud" ErrorMessage="Please Enter Mud Location"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Description of Mud</label>
                                                                <asp:TextBox Enabled="false" ID="txtDescription" class="form-control" ValidationGroup="a" TextMode="MultiLine" Rows="3" runat="server" placeholder="Enter Mud Description"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtDescription" ErrorMessage="Please Enter Mud Description"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Section</label>
                                                                <asp:ListBox SelectionMode="Multiple" ID="sectionList" Enabled="false" DataTextField="name" DataValueField="id" runat="server" DataSourceID="dsSectionList" RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Table" CssClass="chkChoice" Width="100%">
                                                                </asp:ListBox>
                                                                <asp:SqlDataSource ID="dsSectionList" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM section WHERE isActive = 1"></asp:SqlDataSource>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Court Name</label>
                                                                <asp:TextBox Enabled="false" ID="courtName" class="form-control" runat="server" placeholder="Enter FIR / DD No"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Status</label>
                                                                <asp:TextBox Enabled="false" ID="status" class="form-control" runat="server" placeholder="Enter FIR / DD No"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Disposal</label>
                                                                <asp:TextBox Enabled="false" ID="disposalName" class="form-control" runat="server" placeholder="Enter FIR / DD No"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Case Decided</label>
                                                                <asp:CheckBox ENabled="false" ID="caseDecided" runat="server" CssClass="toggle toggle-success" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Decision Date</label>
                                                                <asp:TextBox Enabled="false" ID="decisionDate" class="form-control" ValidationGroup="a" runat="server" placeholder="Enter Mud Number"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Destroy Order Date</label>
                                                                <asp:TextBox Enabled="false" ID="destroyOrderDate" class="form-control" ValidationGroup="a" runat="server" placeholder="Enter Mud Number"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="form-label" for="card-name">Destroy Date</label>
                                                                <asp:TextBox Enabled="false" ID="dateDestory" class="form-control" ValidationGroup="a" runat="server" placeholder="Enter Mud Number"></asp:TextBox>
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
                                                </div>
                                            </div>
                                        </div>
                                Mud Transactions
                                <asp:ListView ID="lstView" runat="server" DataKeyNames="id"
                                    EnableModelValidation="True" >
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
                                                <asp:Label ID="numRoleId" runat="server" Text='<%# Eval("id") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="txtName" runat="server" Text='<%# Eval("mudNo") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("year") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("firNo") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("departmentName") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("headName") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("seizeDate") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("ioName") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("statusName") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("location") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("caseDecided").ToString()=="1"?true:false %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("dateDecision") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("courtName") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("dateOrderDestroy") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("dateDestroy") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("updator") %>' /></td>
                                        </tr>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <div class="table-responsive">
                                            <table id="data-table" class="table text-nowrap mb-0 table-bordered">
                                                <thead class="table-head">
                                                    <tr>
                                                        <th class="bg-transparent border-bottom-0 wp-15">ID</th>
                                                        <th class="bg-transparent border-bottom-0">Mud Name</th>
                                                        <th class="bg-transparent border-bottom-0">Year</th>
                                                        <th class="bg-transparent border-bottom-0">FIR No</th>
                                                        <th class="bg-transparent border-bottom-0">Department</th>
                                                        <th class="bg-transparent border-bottom-0">Head</th>
                                                        <th class="bg-transparent border-bottom-0">જપ્તી તારીખ</th>
                                                        <th class="bg-transparent border-bottom-0">IO Name</th>
                                                        <th class="bg-transparent border-bottom-0">Status</th>
                                                        <th class="bg-transparent border-bottom-0">Location</th>
                                                        <th class="bg-transparent border-bottom-0">CaseDecided</th>
                                                        <th class="bg-transparent border-bottom-0">DateDecision</th>
                                                        <th class="bg-transparent border-bottom-0">Court Name</th>
                                                        <th class="bg-transparent border-bottom-0">ડિસ્ટોરીના ઓર્ડરની તારીખ</th>
                                                        <th class="bg-transparent border-bottom-0">નાશ કરવાની તારીખ</th>
                                                        <th class="bg-transparent border-bottom-0">Updated By</th>
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
                                Court Movements
                                <asp:ListView ID="courtDetails" runat="server" DataKeyNames="id"
                                    EnableModelValidation="True" >
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
                                                <asp:Label ID="numRoleId" runat="server" Text='<%# Eval("id") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="ToDepartment" runat="server" Text='<%# Eval("rcNum") %>' /></td>
                                            </td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label16" runat="server" Text='<%# Eval("sendingVia") %>' /></td>
                                            </td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("sentOn") %>' /></td>
                                            </td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label15" runat="server" Text='<%# Eval("cname") %>' /></td>
                                            </td>
                                            <td class="text-muted fs-14 fw-semibold">
                                               <asp:HyperLink Target="_blank" NavigateUrl='<%# Eval("rcCertPath") %>'
                                                              Text="RC Certificate"
                                                              runat="server"/>         
                                            </td>
                                            <td class="text-muted fs-14 fw-semibold">
                                               <asp:HyperLink Target="_blank" NavigateUrl='<%# Eval("transfereeIdPath")%>'
                                                              Text="Transferee ID"
                                                              runat="server"/>         
                                            </td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="numMudNumber" runat="server" Text='<%# Eval("rname") %>' /></td>
                                        </tr>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <div class="table-responsive">
                                            <table id="data-table" class="table text-nowrap mb-0 table-bordered">
                                                <thead class="table-head">
                                                    <tr>
                                                        <th class="bg-transparent border-bottom-0 wp-15">ID</th>
                                                        <th class="bg-transparent border-bottom-0">RC Number</th>
                                                        <th class="bg-transparent border-bottom-0">Sent Via</th>
                                                        <th class="bg-transparent border-bottom-0">Sent On</th>
                                                        <th class="bg-transparent border-bottom-0">Sent At</th>
                                                        <th class="bg-transparent border-bottom-0">RC Certificate</th>
                                                        <th class="bg-transparent border-bottom-0">Transferee ID</th>
                                                        <th class="bg-transparent border-bottom-0">Initiated By</th>
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
    <script>
        $(function () {
            selectlistBox();
        });
        function selectlistBox() {
            $('[id*=sectionList]').select2({
                placeholder: "Search a section",
                allowClear: true,
                matcher: matchCustom
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
    </script>
</asp:Content>
