﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using Fluqi.Extension;
using Fluqi.Extension.Helpers;
using Microsoft.VisualBasic;

namespace Fluqi.Widget.jSpinner
{

	/// <summary>
	/// A set of properties to apply to a set of jQuery UI Spinner.
	/// </summary>
	/// <remarks>
	/// Properties not yet supported:
	/// </remarks>
	public partial class Events: Core.Options
	{
		/// <summary>
		/// Triggered when the value of the spinner has changed and the input is no longer focused.
		/// </summary>
		/// <remarks>See http://api.jqueryui.com/spinner/#event-change for details</remarks>
		public Events SetChangeEvent(string changeEvent) {
		  this.ChangeEvent = changeEvent;
		  return this;
		}

		/// <summary>
		/// This event is triggered when spinner is created.
		/// </summary>
		/// <remarks>See http://api.jqueryui.com/spinner/#event-create for details</remarks>
		public Events SetCreateEvent(string createEvent) {
		  this.CreateEvent = createEvent;
		  return this;
		}


		/// <summary>
		/// Triggered during increment/decrement (to determine direction of spin compare current value with ui.value).
		/// Can be cancelled, preventing the value from being updated.
		/// </summary>
		/// <remarks>See http://api.jqueryui.com/spinner/#event-spin for details</remarks>
		public Events SetSpinEvent(string spinEvent) {
		  this.SpinEvent = spinEvent;
		  return this;
		}


		/// <summary>
		/// Triggered before a spin. Can be canceled, preventing the spin from occurring.
		/// </summary>
		/// <remarks>See http://api.jqueryui.com/spinner/#event-start for details</remarks>
		public Events SetStartEvent(string startEvent) {
		  this.StartEvent = startEvent;
		  return this;
		}


		/// <summary>
		/// Triggered after a spin.
		/// </summary>
		/// <remarks>See http://api.jqueryui.com/spinner/#event-stop for details</remarks>
		public Events SetStopEvent(string stopEvent) {
		  this.StopEvent = stopEvent;
		  return this;
		}
		
	} // Events

} // ns 
