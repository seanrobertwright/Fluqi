﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Builder.Master" Inherits="System.Web.Mvc.ViewPage<Fluqi.Models.AutoCompleteModel>" %>
<%@ Import Namespace="Fluqi.Web.Demo.Helpers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DemoMainContent" runat="server">
<script src="<%=Url.Content("~/Scripts/auto-complete.js")%>" type="text/javascript"></script>
<script src="<%=Url.Content("~/Scripts/autocomplete-results.js")%>" type="text/javascript"></script>
<label for="ac" style="width: 100px">AutoComplete:</label>
<%=Html.TextBox("ac", "", new {@class = "wide"})%>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="DemoExampleContent" runat="server">
<%using (Html.BeginForm("AutoComplete", "Builder")) {
	string positionTooltip = "Identifies the position of the Autocomplete widget in relation to the associated input element, best looking at the documentation for the Position utility at jQuery UI website.";
%>
	<input type="submit" value="UPDATE" />
	<ul>
		<li><%=Html.LabelFor(vm=>vm.disabled)  %><%=Html.CheckBoxFor(vm=>vm.disabled, "Disables the menu from appearing when the textbox has focus (textbox is still editable however).")%></li>
		<li><%=Html.LabelFor(vm=>vm.appendTo)  %><%=Html.TextBoxFor(vm=>vm.appendTo, "wide", "jQuery selector setting which element should be used for appending the menu options - note this is in the DOM, not the visual menu.  Try '#testAppendTo' for example, then examine the DOM.")%></li>
		<li><%=Html.LabelFor(vm=>vm.autoFocus) %><%=Html.CheckBoxFor(vm=>vm.autoFocus, "If true, the first item in the menu will be selected when listing matches.")%></li>
		<li><%=Html.LabelFor(vm=>vm.delay)     %><%=Html.TextBoxFor(vm=>vm.delay, "How long before the options in the menu should appear once a key is pressed in the textbox.")%></li>
		<li><%=Html.LabelFor(vm=>vm.minLength) %><%=Html.TextBoxFor(vm=>vm.minLength, "Number of characters that must be typed before the menu of matches appears.")%></li>
		<li><%=Html.Label("Position.at")       %><%=Html.DropDownTipListFor(vm=>vm.At1, List.DirectionItems(), positionTooltip)%> <%=Html.DropDownTipListFor(vm=>vm.At2, List.DirectionItems(), positionTooltip)%></li>
		<li><%=Html.Label("Position.my")       %><%=Html.DropDownTipListFor(vm=>vm.My1, List.DirectionItems(), positionTooltip)%> <%=Html.DropDownTipListFor(vm=>vm.My2, List.DirectionItems(), positionTooltip)%></li>
		<li><%=Html.Label("Position.collision")%><%=Html.DropDownTipListFor(vm=>vm.Collision1, List.CollisionItems(), positionTooltip)%> <%=Html.DropDownTipListFor(vm=>vm.Collision2, List.CollisionItems(), positionTooltip)%></li>
	</ul>

	<hr />
	<h2>Test Harness Options</h2>
	<ul>
		<li><%=Html.LabelFor(vm=>vm.useRemoteSource)%><%=Html.CheckBoxFor(vm=>vm.useRemoteSource, "Gets results from the server - try 'circle' in the textbox above (no quotes)")%></li>
		<li><%=Html.LabelFor(vm=>vm.useJSCallBack)  %><%=Html.CheckBoxFor(vm=>vm.useJSCallBack, "Gets results from JS function - try 'homer' in the textbox above (no quotes)")%></li>
		<li><%=Html.LabelFor(vm=>vm.showEvents)    %><%=Html.CheckBoxFor(vm=>vm.showEvents, "Shows how events are wired up.")%></li>
		<li><%=Html.LabelFor(vm=>vm.renderCSS)     %><%=Html.CheckBoxFor(vm=>vm.renderCSS, "Shows the CSS generated by jQuery UI (so non-JavaScript users still see the layout/colours).")%></li>
		<li><%=Html.LabelFor(vm=>vm.prettyRender)  %><%=Html.CheckBoxFor(vm=>vm.prettyRender, "Shows the rendered control/JavaScript in a readable layout.  Turn this option off to see the compressed version (which is the default in a RELEASE build).")%></li>
	</ul>
	<input type="submit" value="UPDATE" />
<%}//form%>
	<div id="testAppendTo"></div>
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="DemoCodeContent" runat="server">
<% 
	AutoComplete ac = Html.CreateAutoComplete("ac", "availableTags");	
	this.Model.ConfigureAutoComplete(ac);
	ac.WithCss("wide");
%>
<%=this.Model.CSharpCode(ac)%>
</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="DemoHtmlContent" runat="server">
The HTML for the AutoComplete demo has been produced with normal HTML.
</asp:Content>



<asp:Content ID="Content5" ContentPlaceHolderID="DemoJavaScriptCodeContent" runat="server">
<% 
	// source is empty as it's configured through the model (see next line)
	AutoComplete ac = Html.CreateAutoComplete("ac", "availableTags");	
	this.Model.ConfigureAutoComplete(ac);
%>
<%=this.Model.JavaScriptCode(ac)%>
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="DemoMethodsContent" runat="server">
	<ul class="horizontal">
		<li><button id="disable" title="Disables the autocomplete textbox.">Disable</button></li>
		<li><button id="enable" title="Enables the autocomplete textbox.">Enable</button></li>
		<li><button id="search" title="Illustrates a programmtic search.">Search</button></li>
		<li><button id="close" title="Closes the menu (when search hits menu are shown).">Close</button></li>
		<li><button id="destroy" title="Returns the autocomplete control back to it's pre-init state.">Destroy</button></li>
	</ul>
<% 
	// source is empty as it's configured through the model (see next line)
	AutoComplete ac = Html.CreateAutoComplete("ac", "availableTags");	
	this.Model.ConfigureAutoComplete(ac);
%>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#enable").click(function() { <%ac.Methods.Enable();%>; });
		$("#disable").click(function() { <%ac.Methods.Disable();%>; });
		$("#search").click(function() { <%ac.Methods.Search("Has");%>; });
		$("#close").click(function() { <%ac.Methods.Close();%>; });
		$("#destroy").click(function() {  if (confirm("are you sure you want to destroy the autocomplete control?")) <%ac.Methods.Destroy();%>; });
	});
	</script>
</asp:Content>

