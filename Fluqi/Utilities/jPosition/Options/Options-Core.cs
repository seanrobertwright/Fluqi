﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using Fluqi.Extension;
using Fluqi.Extension.Helpers;

namespace Fluqi.Utilities.jPosition
{

	/// <summary>
	/// A set of properties to apply to a set of jQuery UI Position.
	/// </summary>
	/// <remarks>
	/// Properties not yet supported:
	/// </remarks>
	public partial class Options: Core.Options
	{
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="pos">Position plugin to define options of.</param>
		public Options(Position pos)
		 : base()
		{
			this.Position = pos;
			this.Reset();
		}


		/// <summary>
		/// Holds a reference to the <see cref="Position"/> object these options are for
		/// </summary>
		public Position Position { get; set; }


		/// <summary>
		/// Used to flag that configuration of <see cref="Options"/> has finished, and 
		/// returns the Position object so we can continue defining Tabs attributes.
		/// </summary>
		/// <returns>Returns <see cref="Position"/> object to return chaining to the Tabs collection</returns>
		public Position Finish() {
		  return this.Position;
		}


		/// <summary>
		/// Builds up a set of options the control can use (i.e. jQuery UI control supports).  Which is
		/// then used in rendering the JavaScript required to initialise the control properties.
		/// </summary>
		/// <param name="options">Collection to add the identified options to</param>
		override protected internal void DiscoverOptions(Core.ScriptOptions options) {
			options.Add(GetPositionScriptOption(false/*asChild*/));
		}


		/// <summary>
		/// Gets a script option defining the Position options (this is exposed as the Position control
		/// is used in other controls).
		/// </summary>
		/// <returns>Script option for the Position object</returns>
		protected internal Core.ScriptOption GetPositionScriptOption() {
			return GetPositionScriptOption(true/*asChild*/);
		}


		/// <summary>
		/// Gets a script option defining the Position options (this is exposed as the Position control
		/// is used in other controls).
		/// </summary>
		/// <param name="asChild">Flags that this option should be added a child</param>
		/// <returns>Script option for the Position object</returns>
		protected Core.ScriptOption GetPositionScriptOption(bool asChild) {
			Core.ScriptOption posParent = new Core.ScriptOption() { 
				Key = "position",
				IsChild = asChild
			};
			Core.ScriptOptions posOptions = posParent.ChildOptions;
			string collisions = Core.Collision.CollisionsToString(this.Collision);

			posOptions.Add(!this.IsNullEmptyOrDefault(this.My, this.MyDefault), "my", this.My.ToLower().InDoubleQuotes());
			posOptions.Add(!this.IsNullEmptyOrDefault(this.At, this.AtDefault), "at", this.At.ToLower().InDoubleQuotes());
			if (this.IsSelector(this.Of)) 
				posOptions.Add(!this.IsNullEmptyOrDefault(this.Of, this.OfDefault), "of", this.Of.InDoubleQuotes());
			else 
				posOptions.Add(!this.IsNullEmptyOrDefault(this.Of, this.OfDefault), "of", this.Of);
			if (this.IsSelector(this.Within))
				posOptions.Add(!this.IsNullEmptyOrDefault(this.Within, this.WithinDefault), "within", this.Within.InDoubleQuotes());
			else 
				posOptions.Add(!this.IsNullEmptyOrDefault(this.Within, this.WithinDefault), "within", this.Within);
			posOptions.Add(!this.IsNullEmptyOrDefault(collisions, this.CollisionDefault), "collision", collisions.InDoubleQuotes());
			posOptions.Add(!this.IsNullEmptyOrDefault(this.UsingFunction, this.UsingFunctionDefault), "using", this.UsingFunction);

			// Any of the above actually going to render?
			posParent.Condition = posOptions.Where(x=>x.Condition).Any();
			return posParent;
		}

		/// <summary>
		/// Resets all the control properties back to their default settings (i.e. the
		/// defaults as documented by jQuery UI library
		/// </summary>
		protected void Reset() {
			this.My = "";
			this.At = "";
			this.Of = "";
			this.Collision = new List<Core.Collision.eCollision>();

			// Set defaults for the Position utility (when used in isolation)
			this.MyDefault = "center";
			this.AtDefault = "center";
			this.OfDefault = null;
			this.CollisionDefault = "flip";
			this.UsingFunctionDefault = null;
			this.WithinDefault = "window";
		}

	} // Options

} // ns Fluqi.jPosition
