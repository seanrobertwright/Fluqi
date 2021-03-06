﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Builder.Master" Inherits="System.Web.Mvc.ViewPage<Fluqi.Models.ToolTipModel>" %>
<%@ Import Namespace="Fluqi.Web.Demo.Helpers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DemoMainContent" runat="server">
<script src="<%=Url.Content("~/Scripts/tooltip.js")%>" type="text/javascript"></script>
<%
	var byTitle = Html.CreateToolTip("name");
	var byContent = Html.CreateToolTip("details");
	
	this.Model.ConfigureToolTip(byTitle);
	this.Model.ConfigureToolTip(byContent);

	byContent
		.Options
			.SetItems("textarea")
			.SetContentByFunction("function() {\n return getDynamicToolTip();\n }")
	;
%>
	<label for="name">Name:</label>
	<input type="text" id="name" title="This tooltip is taken from the 'title' attribute" />
	<br />
	<label for="details">Details:</label>
	<textarea id="details" rows="3" cols="20" style="width: 80%"></textarea>

<%byTitle.Render();%>
<%byContent.Render();%>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="DemoExampleContent" runat="server">
<%using (Html.BeginForm("ToolTip", "Builder")) {
	string positionTooltip = "Identifies the position of the ToolTip widget in relation to the associated element, best looking at the documentation for the Position utility at jQuery UI website.";
%>
	<input type="submit" value="UPDATE" />
	<ul class="small-label">
		<li><%=Html.LabelFor(vm=>vm.disabled)    %><%=Html.CheckBoxFor(vm=>vm.disabled, "Disables the tooltips.")%></li>
		<li>
			<strong>Note that effects can have an impact on how the widget behaves.</strong><br />
			<%=Html.LabelFor(vm=>vm.showEffect)  %><%=Html.DropDownTipListFor(vm=>vm.showEffect, List.AnimationItems(), "Animation effect when showing.")%>
		</li>
		<li><%=Html.LabelFor(vm=>vm.hideEffect)  %><%=Html.DropDownTipListFor(vm=>vm.hideEffect, List.AnimationItems(), "Animation effect when hiding.")%></li>
		<li><%=Html.Label("Position.at")         %><%=Html.DropDownTipListFor(vm=>vm.At1, List.DirectionItems(), positionTooltip)%> <%=Html.DropDownTipListFor(vm=>vm.At2, List.DirectionItems(), positionTooltip)%></li>
		<li><%=Html.Label("Position.my")         %><%=Html.DropDownTipListFor(vm=>vm.My1, List.DirectionItems(), positionTooltip)%> <%=Html.DropDownTipListFor(vm=>vm.My2, List.DirectionItems(), positionTooltip)%></li>
		<li><%=Html.Label("Position.collision")  %><%=Html.DropDownTipListFor(vm=>vm.Collision1, List.CollisionItems(), positionTooltip)%> <%=Html.DropDownTipListFor(vm=>vm.Collision2, List.CollisionItems(), positionTooltip)%></li>
		<%--tooltipClass is skipped as there's no advantage to showing it here--%>
		<li><%=Html.LabelFor(vm=>vm.track)       %><%=Html.CheckBoxFor(vm=>vm.track, "Tooltips track the mouse cursor.")%></li>
	</ul>
	<hr />
	<h2>Test Harness Options</h2>
	<ul>
		<li><%=Html.LabelFor(vm=>vm.showEvents)    %><%=Html.CheckBoxFor(vm=>vm.showEvents, "Shows how events are wired up.")%></li>
		<li><%=Html.LabelFor(vm=>vm.renderCSS)     %><%=Html.CheckBoxFor(vm=>vm.renderCSS, "Shows the CSS generated by jQuery UI (so non-JavaScript users still see the layout/colours).")%></li>
		<li><%=Html.LabelFor(vm=>vm.prettyRender)  %><%=Html.CheckBoxFor(vm=>vm.prettyRender, "Shows the rendered control/JavaScript in a readable layout.  Turn this option off to see the compressed version (which is the default in a RELEASE build).")%></li>
	</ul>
	<input type="submit" value="UPDATE" />
<%}//form %>
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="DemoCodeContent" runat="server">
<%
	var tooltip = Html.CreateToolTip("name");
	this.Model.ConfigureToolTip(tooltip);
%>
<%=this.Model.CSharpCode(tooltip)%>
</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="DemoHtmlContent" runat="server">
<p>
	There is no HTML extract for ToolTips as there is no underlying control, and therefore
	no HTML to render
</p>
</asp:Content>



<asp:Content ID="Content5" ContentPlaceHolderID="DemoJavaScriptCodeContent" runat="server">
<%
	var ctl = Html.CreateToolTip("name");
	this.Model.ConfigureToolTip(ctl);
%>
<%=this.Model.JavaScriptCode(ctl)%>
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="DemoMethodsContent" runat="server">
	<ul class="horizontal">
		<li><button id="disable" title="Disables the (name field) tooltip.">Disable</button></li>
		<li><button id="enable" title="Enables the (name field) tooltip.">Enable</button></li>
		<li><button id="widget" title="Shows the HTML for the tooltip widget.">Widget</button></li>
		<li><button id="close" title="Closes the (name field) tooltip.">Close</button></li>
		<li><button id="open" title="Opens the (name field) tooltip.">Open</button></li>
		<li><button id="destroy" title="Returns the tooltip to it's pre-init state.">Destroy</button></li>
	</ul>
<%
	var ctl = Html.CreateToolTip("name");
	this.Model.ConfigureToolTip(ctl);
%>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#disable").click(function() { <%ctl.Methods.Disable();%>; alert("Name field tooltip is disabled."); });
		$("#enable").click(function() { <%ctl.Methods.Enable();%>; alert("Name field tooltip is enabled."); });
		$("#widget").click(function() { alert( "Widget HTML:\n\n" + <%ctl.Methods.Widget();%>.html() ); });
		$("#close").click(function() { <%ctl.Methods.Close();%>; });
		$("#open").click(function() { <%ctl.Methods.Open();%>; });
		$("#destroy").click(function() {  if (confirm("are you sure you want to destroy the (name element) tooltip?")) <%ctl.Methods.Destroy();%>; });
	});
	</script>
</asp:Content>

