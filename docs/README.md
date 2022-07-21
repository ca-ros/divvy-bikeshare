<!DOCTYPE html>
<html>
<head><meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>EDA_SF_Salaries_Solution</title><script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.1.10/require.min.js"></script>




<style type="text/css">
    pre { line-height: 125%; }
td.linenos .normal { color: inherit; background-color: transparent; padding-left: 5px; padding-right: 5px; }
span.linenos { color: inherit; background-color: transparent; padding-left: 5px; padding-right: 5px; }
td.linenos .special { color: #000000; background-color: #ffffc0; padding-left: 5px; padding-right: 5px; }
span.linenos.special { color: #000000; background-color: #ffffc0; padding-left: 5px; padding-right: 5px; }
.highlight .hll { background-color: var(--jp-cell-editor-active-background) }
.highlight { background: var(--jp-cell-editor-background); color: var(--jp-mirror-editor-variable-color) }
.highlight .c { color: var(--jp-mirror-editor-comment-color); font-style: italic } /* Comment */
.highlight .err { color: var(--jp-mirror-editor-error-color) } /* Error */
.highlight .k { color: var(--jp-mirror-editor-keyword-color); font-weight: bold } /* Keyword */
.highlight .o { color: var(--jp-mirror-editor-operator-color); font-weight: bold } /* Operator */
.highlight .p { color: var(--jp-mirror-editor-punctuation-color) } /* Punctuation */
.highlight .ch { color: var(--jp-mirror-editor-comment-color); font-style: italic } /* Comment.Hashbang */
.highlight .cm { color: var(--jp-mirror-editor-comment-color); font-style: italic } /* Comment.Multiline */
.highlight .cp { color: var(--jp-mirror-editor-comment-color); font-style: italic } /* Comment.Preproc */
.highlight .cpf { color: var(--jp-mirror-editor-comment-color); font-style: italic } /* Comment.PreprocFile */
.highlight .c1 { color: var(--jp-mirror-editor-comment-color); font-style: italic } /* Comment.Single */
.highlight .cs { color: var(--jp-mirror-editor-comment-color); font-style: italic } /* Comment.Special */
.highlight .kc { color: var(--jp-mirror-editor-keyword-color); font-weight: bold } /* Keyword.Constant */
.highlight .kd { color: var(--jp-mirror-editor-keyword-color); font-weight: bold } /* Keyword.Declaration */
.highlight .kn { color: var(--jp-mirror-editor-keyword-color); font-weight: bold } /* Keyword.Namespace */
.highlight .kp { color: var(--jp-mirror-editor-keyword-color); font-weight: bold } /* Keyword.Pseudo */
.highlight .kr { color: var(--jp-mirror-editor-keyword-color); font-weight: bold } /* Keyword.Reserved */
.highlight .kt { color: var(--jp-mirror-editor-keyword-color); font-weight: bold } /* Keyword.Type */
.highlight .m { color: var(--jp-mirror-editor-number-color) } /* Literal.Number */
.highlight .s { color: var(--jp-mirror-editor-string-color) } /* Literal.String */
.highlight .ow { color: var(--jp-mirror-editor-operator-color); font-weight: bold } /* Operator.Word */
.highlight .w { color: var(--jp-mirror-editor-variable-color) } /* Text.Whitespace */
.highlight .mb { color: var(--jp-mirror-editor-number-color) } /* Literal.Number.Bin */
.highlight .mf { color: var(--jp-mirror-editor-number-color) } /* Literal.Number.Float */
.highlight .mh { color: var(--jp-mirror-editor-number-color) } /* Literal.Number.Hex */
.highlight .mi { color: var(--jp-mirror-editor-number-color) } /* Literal.Number.Integer */
.highlight .mo { color: var(--jp-mirror-editor-number-color) } /* Literal.Number.Oct */
.highlight .sa { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Affix */
.highlight .sb { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Backtick */
.highlight .sc { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Char */
.highlight .dl { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Delimiter */
.highlight .sd { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Doc */
.highlight .s2 { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Double */
.highlight .se { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Escape */
.highlight .sh { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Heredoc */
.highlight .si { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Interpol */
.highlight .sx { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Other */
.highlight .sr { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Regex */
.highlight .s1 { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Single */
.highlight .ss { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Symbol */
.highlight .il { color: var(--jp-mirror-editor-number-color) } /* Literal.Number.Integer.Long */
  </style>



<style type="text/css">
/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*
 * Mozilla scrollbar styling
 */

/* use standard opaque scrollbars for most nodes */
[data-jp-theme-scrollbars='true'] {
  scrollbar-color: rgb(var(--jp-scrollbar-thumb-color))
    var(--jp-scrollbar-background-color);
}

/* for code nodes, use a transparent style of scrollbar. These selectors
 * will match lower in the tree, and so will override the above */
[data-jp-theme-scrollbars='true'] .CodeMirror-hscrollbar,
[data-jp-theme-scrollbars='true'] .CodeMirror-vscrollbar {
  scrollbar-color: rgba(var(--jp-scrollbar-thumb-color), 0.5) transparent;
}

/* tiny scrollbar */

.jp-scrollbar-tiny {
  scrollbar-color: rgba(var(--jp-scrollbar-thumb-color), 0.5) transparent;
  scrollbar-width: thin;
}

/*
 * Webkit scrollbar styling
 */

/* use standard opaque scrollbars for most nodes */

[data-jp-theme-scrollbars='true'] ::-webkit-scrollbar,
[data-jp-theme-scrollbars='true'] ::-webkit-scrollbar-corner {
  background: var(--jp-scrollbar-background-color);
}

[data-jp-theme-scrollbars='true'] ::-webkit-scrollbar-thumb {
  background: rgb(var(--jp-scrollbar-thumb-color));
  border: var(--jp-scrollbar-thumb-margin) solid transparent;
  background-clip: content-box;
  border-radius: var(--jp-scrollbar-thumb-radius);
}

[data-jp-theme-scrollbars='true'] ::-webkit-scrollbar-track:horizontal {
  border-left: var(--jp-scrollbar-endpad) solid
    var(--jp-scrollbar-background-color);
  border-right: var(--jp-scrollbar-endpad) solid
    var(--jp-scrollbar-background-color);
}

[data-jp-theme-scrollbars='true'] ::-webkit-scrollbar-track:vertical {
  border-top: var(--jp-scrollbar-endpad) solid
    var(--jp-scrollbar-background-color);
  border-bottom: var(--jp-scrollbar-endpad) solid
    var(--jp-scrollbar-background-color);
}

/* for code nodes, use a transparent style of scrollbar */

[data-jp-theme-scrollbars='true'] .CodeMirror-hscrollbar::-webkit-scrollbar,
[data-jp-theme-scrollbars='true'] .CodeMirror-vscrollbar::-webkit-scrollbar,
[data-jp-theme-scrollbars='true']
  .CodeMirror-hscrollbar::-webkit-scrollbar-corner,
[data-jp-theme-scrollbars='true']
  .CodeMirror-vscrollbar::-webkit-scrollbar-corner {
  background-color: transparent;
}

[data-jp-theme-scrollbars='true']
  .CodeMirror-hscrollbar::-webkit-scrollbar-thumb,
[data-jp-theme-scrollbars='true']
  .CodeMirror-vscrollbar::-webkit-scrollbar-thumb {
  background: rgba(var(--jp-scrollbar-thumb-color), 0.5);
  border: var(--jp-scrollbar-thumb-margin) solid transparent;
  background-clip: content-box;
  border-radius: var(--jp-scrollbar-thumb-radius);
}

[data-jp-theme-scrollbars='true']
  .CodeMirror-hscrollbar::-webkit-scrollbar-track:horizontal {
  border-left: var(--jp-scrollbar-endpad) solid transparent;
  border-right: var(--jp-scrollbar-endpad) solid transparent;
}

[data-jp-theme-scrollbars='true']
  .CodeMirror-vscrollbar::-webkit-scrollbar-track:vertical {
  border-top: var(--jp-scrollbar-endpad) solid transparent;
  border-bottom: var(--jp-scrollbar-endpad) solid transparent;
}

/* tiny scrollbar */

.jp-scrollbar-tiny::-webkit-scrollbar,
.jp-scrollbar-tiny::-webkit-scrollbar-corner {
  background-color: transparent;
  height: 4px;
  width: 4px;
}

.jp-scrollbar-tiny::-webkit-scrollbar-thumb {
  background: rgba(var(--jp-scrollbar-thumb-color), 0.5);
}

.jp-scrollbar-tiny::-webkit-scrollbar-track:horizontal {
  border-left: 0px solid transparent;
  border-right: 0px solid transparent;
}

.jp-scrollbar-tiny::-webkit-scrollbar-track:vertical {
  border-top: 0px solid transparent;
  border-bottom: 0px solid transparent;
}

/*
 * Phosphor
 */

.lm-ScrollBar[data-orientation='horizontal'] {
  min-height: 16px;
  max-height: 16px;
  min-width: 45px;
  border-top: 1px solid #a0a0a0;
}

.lm-ScrollBar[data-orientation='vertical'] {
  min-width: 16px;
  max-width: 16px;
  min-height: 45px;
  border-left: 1px solid #a0a0a0;
}

.lm-ScrollBar-button {
  background-color: #f0f0f0;
  background-position: center center;
  min-height: 15px;
  max-height: 15px;
  min-width: 15px;
  max-width: 15px;
}

.lm-ScrollBar-button:hover {
  background-color: #dadada;
}

.lm-ScrollBar-button.lm-mod-active {
  background-color: #cdcdcd;
}

.lm-ScrollBar-track {
  background: #f0f0f0;
}

.lm-ScrollBar-thumb {
  background: #cdcdcd;
}

.lm-ScrollBar-thumb:hover {
  background: #bababa;
}

.lm-ScrollBar-thumb.lm-mod-active {
  background: #a0a0a0;
}

.lm-ScrollBar[data-orientation='horizontal'] .lm-ScrollBar-thumb {
  height: 100%;
  min-width: 15px;
  border-left: 1px solid #a0a0a0;
  border-right: 1px solid #a0a0a0;
}

.lm-ScrollBar[data-orientation='vertical'] .lm-ScrollBar-thumb {
  width: 100%;
  min-height: 15px;
  border-top: 1px solid #a0a0a0;
  border-bottom: 1px solid #a0a0a0;
}

.lm-ScrollBar[data-orientation='horizontal']
  .lm-ScrollBar-button[data-action='decrement'] {
  background-image: var(--jp-icon-caret-left);
  background-size: 17px;
}

.lm-ScrollBar[data-orientation='horizontal']
  .lm-ScrollBar-button[data-action='increment'] {
  background-image: var(--jp-icon-caret-right);
  background-size: 17px;
}

.lm-ScrollBar[data-orientation='vertical']
  .lm-ScrollBar-button[data-action='decrement'] {
  background-image: var(--jp-icon-caret-up);
  background-size: 17px;
}

.lm-ScrollBar[data-orientation='vertical']
  .lm-ScrollBar-button[data-action='increment'] {
  background-image: var(--jp-icon-caret-down);
  background-size: 17px;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/


/* <DEPRECATED> */ .p-Widget, /* </DEPRECATED> */
.lm-Widget {
  box-sizing: border-box;
  position: relative;
  overflow: hidden;
  cursor: default;
}


/* <DEPRECATED> */ .p-Widget.p-mod-hidden, /* </DEPRECATED> */
.lm-Widget.lm-mod-hidden {
  display: none !important;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/


/* <DEPRECATED> */ .p-CommandPalette, /* </DEPRECATED> */
.lm-CommandPalette {
  display: flex;
  flex-direction: column;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}


/* <DEPRECATED> */ .p-CommandPalette-search, /* </DEPRECATED> */
.lm-CommandPalette-search {
  flex: 0 0 auto;
}


/* <DEPRECATED> */ .p-CommandPalette-content, /* </DEPRECATED> */
.lm-CommandPalette-content {
  flex: 1 1 auto;
  margin: 0;
  padding: 0;
  min-height: 0;
  overflow: auto;
  list-style-type: none;
}


/* <DEPRECATED> */ .p-CommandPalette-header, /* </DEPRECATED> */
.lm-CommandPalette-header {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}


/* <DEPRECATED> */ .p-CommandPalette-item, /* </DEPRECATED> */
.lm-CommandPalette-item {
  display: flex;
  flex-direction: row;
}


/* <DEPRECATED> */ .p-CommandPalette-itemIcon, /* </DEPRECATED> */
.lm-CommandPalette-itemIcon {
  flex: 0 0 auto;
}


/* <DEPRECATED> */ .p-CommandPalette-itemContent, /* </DEPRECATED> */
.lm-CommandPalette-itemContent {
  flex: 1 1 auto;
  overflow: hidden;
}


/* <DEPRECATED> */ .p-CommandPalette-itemShortcut, /* </DEPRECATED> */
.lm-CommandPalette-itemShortcut {
  flex: 0 0 auto;
}


/* <DEPRECATED> */ .p-CommandPalette-itemLabel, /* </DEPRECATED> */
.lm-CommandPalette-itemLabel {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.lm-close-icon {
	border:1px solid transparent;
  background-color: transparent;
  position: absolute;
	z-index:1;
	right:3%;
	top: 0;
	bottom: 0;
	margin: auto;
	padding: 7px 0;
	display: none;
	vertical-align: middle;
  outline: 0;
  cursor: pointer;
}
.lm-close-icon:after {
	content: "X";
	display: block;
	width: 15px;
	height: 15px;
	text-align: center;
	color:#000;
	font-weight: normal;
	font-size: 12px;
	cursor: pointer;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/


/* <DEPRECATED> */ .p-DockPanel, /* </DEPRECATED> */
.lm-DockPanel {
  z-index: 0;
}


/* <DEPRECATED> */ .p-DockPanel-widget, /* </DEPRECATED> */
.lm-DockPanel-widget {
  z-index: 0;
}


/* <DEPRECATED> */ .p-DockPanel-tabBar, /* </DEPRECATED> */
.lm-DockPanel-tabBar {
  z-index: 1;
}


/* <DEPRECATED> */ .p-DockPanel-handle, /* </DEPRECATED> */
.lm-DockPanel-handle {
  z-index: 2;
}


/* <DEPRECATED> */ .p-DockPanel-handle.p-mod-hidden, /* </DEPRECATED> */
.lm-DockPanel-handle.lm-mod-hidden {
  display: none !important;
}


/* <DEPRECATED> */ .p-DockPanel-handle:after, /* </DEPRECATED> */
.lm-DockPanel-handle:after {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  content: '';
}


/* <DEPRECATED> */
.p-DockPanel-handle[data-orientation='horizontal'],
/* </DEPRECATED> */
.lm-DockPanel-handle[data-orientation='horizontal'] {
  cursor: ew-resize;
}


/* <DEPRECATED> */
.p-DockPanel-handle[data-orientation='vertical'],
/* </DEPRECATED> */
.lm-DockPanel-handle[data-orientation='vertical'] {
  cursor: ns-resize;
}


/* <DEPRECATED> */
.p-DockPanel-handle[data-orientation='horizontal']:after,
/* </DEPRECATED> */
.lm-DockPanel-handle[data-orientation='horizontal']:after {
  left: 50%;
  min-width: 8px;
  transform: translateX(-50%);
}


/* <DEPRECATED> */
.p-DockPanel-handle[data-orientation='vertical']:after,
/* </DEPRECATED> */
.lm-DockPanel-handle[data-orientation='vertical']:after {
  top: 50%;
  min-height: 8px;
  transform: translateY(-50%);
}


/* <DEPRECATED> */ .p-DockPanel-overlay, /* </DEPRECATED> */
.lm-DockPanel-overlay {
  z-index: 3;
  box-sizing: border-box;
  pointer-events: none;
}


/* <DEPRECATED> */ .p-DockPanel-overlay.p-mod-hidden, /* </DEPRECATED> */
.lm-DockPanel-overlay.lm-mod-hidden {
  display: none !important;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/


/* <DEPRECATED> */ .p-Menu, /* </DEPRECATED> */
.lm-Menu {
  z-index: 10000;
  position: absolute;
  white-space: nowrap;
  overflow-x: hidden;
  overflow-y: auto;
  outline: none;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}


/* <DEPRECATED> */ .p-Menu-content, /* </DEPRECATED> */
.lm-Menu-content {
  margin: 0;
  padding: 0;
  display: table;
  list-style-type: none;
}


/* <DEPRECATED> */ .p-Menu-item, /* </DEPRECATED> */
.lm-Menu-item {
  display: table-row;
}


/* <DEPRECATED> */
.p-Menu-item.p-mod-hidden,
.p-Menu-item.p-mod-collapsed,
/* </DEPRECATED> */
.lm-Menu-item.lm-mod-hidden,
.lm-Menu-item.lm-mod-collapsed {
  display: none !important;
}


/* <DEPRECATED> */
.p-Menu-itemIcon,
.p-Menu-itemSubmenuIcon,
/* </DEPRECATED> */
.lm-Menu-itemIcon,
.lm-Menu-itemSubmenuIcon {
  display: table-cell;
  text-align: center;
}


/* <DEPRECATED> */ .p-Menu-itemLabel, /* </DEPRECATED> */
.lm-Menu-itemLabel {
  display: table-cell;
  text-align: left;
}


/* <DEPRECATED> */ .p-Menu-itemShortcut, /* </DEPRECATED> */
.lm-Menu-itemShortcut {
  display: table-cell;
  text-align: right;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/


/* <DEPRECATED> */ .p-MenuBar, /* </DEPRECATED> */
.lm-MenuBar {
  outline: none;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}


/* <DEPRECATED> */ .p-MenuBar-content, /* </DEPRECATED> */
.lm-MenuBar-content {
  margin: 0;
  padding: 0;
  display: flex;
  flex-direction: row;
  list-style-type: none;
}


/* <DEPRECATED> */ .p--MenuBar-item, /* </DEPRECATED> */
.lm-MenuBar-item {
  box-sizing: border-box;
}


/* <DEPRECATED> */
.p-MenuBar-itemIcon,
.p-MenuBar-itemLabel,
/* </DEPRECATED> */
.lm-MenuBar-itemIcon,
.lm-MenuBar-itemLabel {
  display: inline-block;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/


/* <DEPRECATED> */ .p-ScrollBar, /* </DEPRECATED> */
.lm-ScrollBar {
  display: flex;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}


/* <DEPRECATED> */
.p-ScrollBar[data-orientation='horizontal'],
/* </DEPRECATED> */
.lm-ScrollBar[data-orientation='horizontal'] {
  flex-direction: row;
}


/* <DEPRECATED> */
.p-ScrollBar[data-orientation='vertical'],
/* </DEPRECATED> */
.lm-ScrollBar[data-orientation='vertical'] {
  flex-direction: column;
}


/* <DEPRECATED> */ .p-ScrollBar-button, /* </DEPRECATED> */
.lm-ScrollBar-button {
  box-sizing: border-box;
  flex: 0 0 auto;
}


/* <DEPRECATED> */ .p-ScrollBar-track, /* </DEPRECATED> */
.lm-ScrollBar-track {
  box-sizing: border-box;
  position: relative;
  overflow: hidden;
  flex: 1 1 auto;
}


/* <DEPRECATED> */ .p-ScrollBar-thumb, /* </DEPRECATED> */
.lm-ScrollBar-thumb {
  box-sizing: border-box;
  position: absolute;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/


/* <DEPRECATED> */ .p-SplitPanel-child, /* </DEPRECATED> */
.lm-SplitPanel-child {
  z-index: 0;
}


/* <DEPRECATED> */ .p-SplitPanel-handle, /* </DEPRECATED> */
.lm-SplitPanel-handle {
  z-index: 1;
}


/* <DEPRECATED> */ .p-SplitPanel-handle.p-mod-hidden, /* </DEPRECATED> */
.lm-SplitPanel-handle.lm-mod-hidden {
  display: none !important;
}


/* <DEPRECATED> */ .p-SplitPanel-handle:after, /* </DEPRECATED> */
.lm-SplitPanel-handle:after {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  content: '';
}


/* <DEPRECATED> */
.p-SplitPanel[data-orientation='horizontal'] > .p-SplitPanel-handle,
/* </DEPRECATED> */
.lm-SplitPanel[data-orientation='horizontal'] > .lm-SplitPanel-handle {
  cursor: ew-resize;
}


/* <DEPRECATED> */
.p-SplitPanel[data-orientation='vertical'] > .p-SplitPanel-handle,
/* </DEPRECATED> */
.lm-SplitPanel[data-orientation='vertical'] > .lm-SplitPanel-handle {
  cursor: ns-resize;
}


/* <DEPRECATED> */
.p-SplitPanel[data-orientation='horizontal'] > .p-SplitPanel-handle:after,
/* </DEPRECATED> */
.lm-SplitPanel[data-orientation='horizontal'] > .lm-SplitPanel-handle:after {
  left: 50%;
  min-width: 8px;
  transform: translateX(-50%);
}


/* <DEPRECATED> */
.p-SplitPanel[data-orientation='vertical'] > .p-SplitPanel-handle:after,
/* </DEPRECATED> */
.lm-SplitPanel[data-orientation='vertical'] > .lm-SplitPanel-handle:after {
  top: 50%;
  min-height: 8px;
  transform: translateY(-50%);
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/


/* <DEPRECATED> */ .p-TabBar, /* </DEPRECATED> */
.lm-TabBar {
  display: flex;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}


/* <DEPRECATED> */ .p-TabBar[data-orientation='horizontal'], /* </DEPRECATED> */
.lm-TabBar[data-orientation='horizontal'] {
  flex-direction: row;
  align-items: flex-end;
}


/* <DEPRECATED> */ .p-TabBar[data-orientation='vertical'], /* </DEPRECATED> */
.lm-TabBar[data-orientation='vertical'] {
  flex-direction: column;
  align-items: flex-end;
}


/* <DEPRECATED> */ .p-TabBar-content, /* </DEPRECATED> */
.lm-TabBar-content {
  margin: 0;
  padding: 0;
  display: flex;
  flex: 1 1 auto;
  list-style-type: none;
}


/* <DEPRECATED> */
.p-TabBar[data-orientation='horizontal'] > .p-TabBar-content,
/* </DEPRECATED> */
.lm-TabBar[data-orientation='horizontal'] > .lm-TabBar-content {
  flex-direction: row;
}


/* <DEPRECATED> */
.p-TabBar[data-orientation='vertical'] > .p-TabBar-content,
/* </DEPRECATED> */
.lm-TabBar[data-orientation='vertical'] > .lm-TabBar-content {
  flex-direction: column;
}


/* <DEPRECATED> */ .p-TabBar-tab, /* </DEPRECATED> */
.lm-TabBar-tab {
  display: flex;
  flex-direction: row;
  box-sizing: border-box;
  overflow: hidden;
}


/* <DEPRECATED> */
.p-TabBar-tabIcon,
.p-TabBar-tabCloseIcon,
/* </DEPRECATED> */
.lm-TabBar-tabIcon,
.lm-TabBar-tabCloseIcon {
  flex: 0 0 auto;
}


/* <DEPRECATED> */ .p-TabBar-tabLabel, /* </DEPRECATED> */
.lm-TabBar-tabLabel {
  flex: 1 1 auto;
  overflow: hidden;
  white-space: nowrap;
}


.lm-TabBar-tabInput {
  user-select: all;
  width: 100%;
  box-sizing : border-box;
}


/* <DEPRECATED> */ .p-TabBar-tab.p-mod-hidden, /* </DEPRECATED> */
.lm-TabBar-tab.lm-mod-hidden {
  display: none !important;
}


.lm-TabBar-addButton.lm-mod-hidden {
  display: none !important;
}


/* <DEPRECATED> */ .p-TabBar.p-mod-dragging .p-TabBar-tab, /* </DEPRECATED> */
.lm-TabBar.lm-mod-dragging .lm-TabBar-tab {
  position: relative;
}


/* <DEPRECATED> */
.p-TabBar.p-mod-dragging[data-orientation='horizontal'] .p-TabBar-tab,
/* </DEPRECATED> */
.lm-TabBar.lm-mod-dragging[data-orientation='horizontal'] .lm-TabBar-tab {
  left: 0;
  transition: left 150ms ease;
}


/* <DEPRECATED> */
.p-TabBar.p-mod-dragging[data-orientation='vertical'] .p-TabBar-tab,
/* </DEPRECATED> */
.lm-TabBar.lm-mod-dragging[data-orientation='vertical'] .lm-TabBar-tab {
  top: 0;
  transition: top 150ms ease;
}


/* <DEPRECATED> */
.p-TabBar.p-mod-dragging .p-TabBar-tab.p-mod-dragging,
/* </DEPRECATED> */
.lm-TabBar.lm-mod-dragging .lm-TabBar-tab.lm-mod-dragging {
  transition: none;
}

.lm-TabBar-tabLabel .lm-TabBar-tabInput {
  user-select: all;
  width: 100%;
  box-sizing : border-box;
  background: inherit;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/


/* <DEPRECATED> */ .p-TabPanel-tabBar, /* </DEPRECATED> */
.lm-TabPanel-tabBar {
  z-index: 1;
}


/* <DEPRECATED> */ .p-TabPanel-stackedPanel, /* </DEPRECATED> */
.lm-TabPanel-stackedPanel {
  z-index: 0;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/

@charset "UTF-8";
html{
  -webkit-box-sizing:border-box;
          box-sizing:border-box; }

*,
*::before,
*::after{
  -webkit-box-sizing:inherit;
          box-sizing:inherit; }

body{
  font-size:14px;
  font-weight:400;
  letter-spacing:0;
  line-height:1.28581;
  text-transform:none;
  color:#182026;
  font-family:-apple-system, "BlinkMacSystemFont", "Segoe UI", "Roboto", "Oxygen", "Ubuntu", "Cantarell", "Open Sans", "Helvetica Neue", "Icons16", sans-serif; }

p{
  margin-bottom:10px;
  margin-top:0; }

small{
  font-size:12px; }

strong{
  font-weight:600; }

::-moz-selection{
  background:rgba(125, 188, 255, 0.6); }

::selection{
  background:rgba(125, 188, 255, 0.6); }
.bp3-heading{
  color:#182026;
  font-weight:600;
  margin:0 0 10px;
  padding:0; }
  .bp3-dark .bp3-heading{
    color:#f5f8fa; }

h1.bp3-heading, .bp3-running-text h1{
  font-size:36px;
  line-height:40px; }

h2.bp3-heading, .bp3-running-text h2{
  font-size:28px;
  line-height:32px; }

h3.bp3-heading, .bp3-running-text h3{
  font-size:22px;
  line-height:25px; }

h4.bp3-heading, .bp3-running-text h4{
  font-size:18px;
  line-height:21px; }

h5.bp3-heading, .bp3-running-text h5{
  font-size:16px;
  line-height:19px; }

h6.bp3-heading, .bp3-running-text h6{
  font-size:14px;
  line-height:16px; }
.bp3-ui-text{
  font-size:14px;
  font-weight:400;
  letter-spacing:0;
  line-height:1.28581;
  text-transform:none; }

.bp3-monospace-text{
  font-family:monospace;
  text-transform:none; }

.bp3-text-muted{
  color:#5c7080; }
  .bp3-dark .bp3-text-muted{
    color:#a7b6c2; }

.bp3-text-disabled{
  color:rgba(92, 112, 128, 0.6); }
  .bp3-dark .bp3-text-disabled{
    color:rgba(167, 182, 194, 0.6); }

.bp3-text-overflow-ellipsis{
  overflow:hidden;
  text-overflow:ellipsis;
  white-space:nowrap;
  word-wrap:normal; }
.bp3-running-text{
  font-size:14px;
  line-height:1.5; }
  .bp3-running-text h1{
    color:#182026;
    font-weight:600;
    margin-bottom:20px;
    margin-top:40px; }
    .bp3-dark .bp3-running-text h1{
      color:#f5f8fa; }
  .bp3-running-text h2{
    color:#182026;
    font-weight:600;
    margin-bottom:20px;
    margin-top:40px; }
    .bp3-dark .bp3-running-text h2{
      color:#f5f8fa; }
  .bp3-running-text h3{
    color:#182026;
    font-weight:600;
    margin-bottom:20px;
    margin-top:40px; }
    .bp3-dark .bp3-running-text h3{
      color:#f5f8fa; }
  .bp3-running-text h4{
    color:#182026;
    font-weight:600;
    margin-bottom:20px;
    margin-top:40px; }
    .bp3-dark .bp3-running-text h4{
      color:#f5f8fa; }
  .bp3-running-text h5{
    color:#182026;
    font-weight:600;
    margin-bottom:20px;
    margin-top:40px; }
    .bp3-dark .bp3-running-text h5{
      color:#f5f8fa; }
  .bp3-running-text h6{
    color:#182026;
    font-weight:600;
    margin-bottom:20px;
    margin-top:40px; }
    .bp3-dark .bp3-running-text h6{
      color:#f5f8fa; }
  .bp3-running-text hr{
    border:none;
    border-bottom:1px solid rgba(16, 22, 26, 0.15);
    margin:20px 0; }
    .bp3-dark .bp3-running-text hr{
      border-color:rgba(255, 255, 255, 0.15); }
  .bp3-running-text p{
    margin:0 0 10px;
    padding:0; }

.bp3-text-large{
  font-size:16px; }

.bp3-text-small{
  font-size:12px; }
a{
  color:#106ba3;
  text-decoration:none; }
  a:hover{
    color:#106ba3;
    cursor:pointer;
    text-decoration:underline; }
  a .bp3-icon, a .bp3-icon-standard, a .bp3-icon-large{
    color:inherit; }
  a code,
  .bp3-dark a code{
    color:inherit; }
  .bp3-dark a,
  .bp3-dark a:hover{
    color:#48aff0; }
    .bp3-dark a .bp3-icon, .bp3-dark a .bp3-icon-standard, .bp3-dark a .bp3-icon-large,
    .bp3-dark a:hover .bp3-icon,
    .bp3-dark a:hover .bp3-icon-standard,
    .bp3-dark a:hover .bp3-icon-large{
      color:inherit; }
.bp3-running-text code, .bp3-code{
  font-family:monospace;
  text-transform:none;
  background:rgba(255, 255, 255, 0.7);
  border-radius:3px;
  -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2);
          box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2);
  color:#5c7080;
  font-size:smaller;
  padding:2px 5px; }
  .bp3-dark .bp3-running-text code, .bp3-running-text .bp3-dark code, .bp3-dark .bp3-code{
    background:rgba(16, 22, 26, 0.3);
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4);
    color:#a7b6c2; }
  .bp3-running-text a > code, a > .bp3-code{
    color:#137cbd; }
    .bp3-dark .bp3-running-text a > code, .bp3-running-text .bp3-dark a > code, .bp3-dark a > .bp3-code{
      color:inherit; }

.bp3-running-text pre, .bp3-code-block{
  font-family:monospace;
  text-transform:none;
  background:rgba(255, 255, 255, 0.7);
  border-radius:3px;
  -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.15);
          box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.15);
  color:#182026;
  display:block;
  font-size:13px;
  line-height:1.4;
  margin:10px 0;
  padding:13px 15px 12px;
  word-break:break-all;
  word-wrap:break-word; }
  .bp3-dark .bp3-running-text pre, .bp3-running-text .bp3-dark pre, .bp3-dark .bp3-code-block{
    background:rgba(16, 22, 26, 0.3);
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4);
    color:#f5f8fa; }
  .bp3-running-text pre > code, .bp3-code-block > code{
    background:none;
    -webkit-box-shadow:none;
            box-shadow:none;
    color:inherit;
    font-size:inherit;
    padding:0; }

.bp3-running-text kbd, .bp3-key{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  background:#ffffff;
  border-radius:3px;
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.2);
  color:#5c7080;
  display:-webkit-inline-box;
  display:-ms-inline-flexbox;
  display:inline-flex;
  font-family:inherit;
  font-size:12px;
  height:24px;
  -webkit-box-pack:center;
      -ms-flex-pack:center;
          justify-content:center;
  line-height:24px;
  min-width:24px;
  padding:3px 6px;
  vertical-align:middle; }
  .bp3-running-text kbd .bp3-icon, .bp3-key .bp3-icon, .bp3-running-text kbd .bp3-icon-standard, .bp3-key .bp3-icon-standard, .bp3-running-text kbd .bp3-icon-large, .bp3-key .bp3-icon-large{
    margin-right:5px; }
  .bp3-dark .bp3-running-text kbd, .bp3-running-text .bp3-dark kbd, .bp3-dark .bp3-key{
    background:#394b59;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4);
    color:#a7b6c2; }
.bp3-running-text blockquote, .bp3-blockquote{
  border-left:solid 4px rgba(167, 182, 194, 0.5);
  margin:0 0 10px;
  padding:0 20px; }
  .bp3-dark .bp3-running-text blockquote, .bp3-running-text .bp3-dark blockquote, .bp3-dark .bp3-blockquote{
    border-color:rgba(115, 134, 148, 0.5); }
.bp3-running-text ul,
.bp3-running-text ol, .bp3-list{
  margin:10px 0;
  padding-left:30px; }
  .bp3-running-text ul li:not(:last-child), .bp3-running-text ol li:not(:last-child), .bp3-list li:not(:last-child){
    margin-bottom:5px; }
  .bp3-running-text ul ol, .bp3-running-text ol ol, .bp3-list ol,
  .bp3-running-text ul ul,
  .bp3-running-text ol ul,
  .bp3-list ul{
    margin-top:5px; }

.bp3-list-unstyled{
  list-style:none;
  margin:0;
  padding:0; }
  .bp3-list-unstyled li{
    padding:0; }
.bp3-rtl{
  text-align:right; }

.bp3-dark{
  color:#f5f8fa; }

:focus{
  outline:rgba(19, 124, 189, 0.6) auto 2px;
  outline-offset:2px;
  -moz-outline-radius:6px; }

.bp3-focus-disabled :focus{
  outline:none !important; }
  .bp3-focus-disabled :focus ~ .bp3-control-indicator{
    outline:none !important; }

.bp3-alert{
  max-width:400px;
  padding:20px; }

.bp3-alert-body{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex; }
  .bp3-alert-body .bp3-icon{
    font-size:40px;
    margin-right:20px;
    margin-top:0; }

.bp3-alert-contents{
  word-break:break-word; }

.bp3-alert-footer{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:horizontal;
  -webkit-box-direction:reverse;
      -ms-flex-direction:row-reverse;
          flex-direction:row-reverse;
  margin-top:10px; }
  .bp3-alert-footer .bp3-button{
    margin-left:10px; }
.bp3-breadcrumbs{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  cursor:default;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -ms-flex-wrap:wrap;
      flex-wrap:wrap;
  height:30px;
  list-style:none;
  margin:0;
  padding:0; }
  .bp3-breadcrumbs > li{
    -webkit-box-align:center;
        -ms-flex-align:center;
            align-items:center;
    display:-webkit-box;
    display:-ms-flexbox;
    display:flex; }
    .bp3-breadcrumbs > li::after{
      background:url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill-rule='evenodd' clip-rule='evenodd' d='M10.71 7.29l-4-4a1.003 1.003 0 00-1.42 1.42L8.59 8 5.3 11.29c-.19.18-.3.43-.3.71a1.003 1.003 0 001.71.71l4-4c.18-.18.29-.43.29-.71 0-.28-.11-.53-.29-.71z' fill='%235C7080'/%3e%3c/svg%3e");
      content:"";
      display:block;
      height:16px;
      margin:0 5px;
      width:16px; }
    .bp3-breadcrumbs > li:last-of-type::after{
      display:none; }

.bp3-breadcrumb,
.bp3-breadcrumb-current,
.bp3-breadcrumbs-collapsed{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  display:-webkit-inline-box;
  display:-ms-inline-flexbox;
  display:inline-flex;
  font-size:16px; }

.bp3-breadcrumb,
.bp3-breadcrumbs-collapsed{
  color:#5c7080; }

.bp3-breadcrumb:hover{
  text-decoration:none; }

.bp3-breadcrumb.bp3-disabled{
  color:rgba(92, 112, 128, 0.6);
  cursor:not-allowed; }

.bp3-breadcrumb .bp3-icon{
  margin-right:5px; }

.bp3-breadcrumb-current{
  color:inherit;
  font-weight:600; }
  .bp3-breadcrumb-current .bp3-input{
    font-size:inherit;
    font-weight:inherit;
    vertical-align:baseline; }

.bp3-breadcrumbs-collapsed{
  background:#ced9e0;
  border:none;
  border-radius:3px;
  cursor:pointer;
  margin-right:2px;
  padding:1px 5px;
  vertical-align:text-bottom; }
  .bp3-breadcrumbs-collapsed::before{
    background:url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cg fill='%235C7080'%3e%3ccircle cx='2' cy='8.03' r='2'/%3e%3ccircle cx='14' cy='8.03' r='2'/%3e%3ccircle cx='8' cy='8.03' r='2'/%3e%3c/g%3e%3c/svg%3e") center no-repeat;
    content:"";
    display:block;
    height:16px;
    width:16px; }
  .bp3-breadcrumbs-collapsed:hover{
    background:#bfccd6;
    color:#182026;
    text-decoration:none; }

.bp3-dark .bp3-breadcrumb,
.bp3-dark .bp3-breadcrumbs-collapsed{
  color:#a7b6c2; }

.bp3-dark .bp3-breadcrumbs > li::after{
  color:#a7b6c2; }

.bp3-dark .bp3-breadcrumb.bp3-disabled{
  color:rgba(167, 182, 194, 0.6); }

.bp3-dark .bp3-breadcrumb-current{
  color:#f5f8fa; }

.bp3-dark .bp3-breadcrumbs-collapsed{
  background:rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-breadcrumbs-collapsed:hover{
    background:rgba(16, 22, 26, 0.6);
    color:#f5f8fa; }
.bp3-button{
  display:-webkit-inline-box;
  display:-ms-inline-flexbox;
  display:inline-flex;
  -webkit-box-orient:horizontal;
  -webkit-box-direction:normal;
      -ms-flex-direction:row;
          flex-direction:row;
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  border:none;
  border-radius:3px;
  cursor:pointer;
  font-size:14px;
  -webkit-box-pack:center;
      -ms-flex-pack:center;
          justify-content:center;
  padding:5px 10px;
  text-align:left;
  vertical-align:middle;
  min-height:30px;
  min-width:30px; }
  .bp3-button > *{
    -webkit-box-flex:0;
        -ms-flex-positive:0;
            flex-grow:0;
    -ms-flex-negative:0;
        flex-shrink:0; }
  .bp3-button > .bp3-fill{
    -webkit-box-flex:1;
        -ms-flex-positive:1;
            flex-grow:1;
    -ms-flex-negative:1;
        flex-shrink:1; }
  .bp3-button::before,
  .bp3-button > *{
    margin-right:7px; }
  .bp3-button:empty::before,
  .bp3-button > :last-child{
    margin-right:0; }
  .bp3-button:empty{
    padding:0 !important; }
  .bp3-button:disabled, .bp3-button.bp3-disabled{
    cursor:not-allowed; }
  .bp3-button.bp3-fill{
    display:-webkit-box;
    display:-ms-flexbox;
    display:flex;
    width:100%; }
  .bp3-button.bp3-align-right,
  .bp3-align-right .bp3-button{
    text-align:right; }
  .bp3-button.bp3-align-left,
  .bp3-align-left .bp3-button{
    text-align:left; }
  .bp3-button:not([class*="bp3-intent-"]){
    background-color:#f5f8fa;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.8)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.8), rgba(255, 255, 255, 0));
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
    color:#182026; }
    .bp3-button:not([class*="bp3-intent-"]):hover{
      background-clip:padding-box;
      background-color:#ebf1f5;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1); }
    .bp3-button:not([class*="bp3-intent-"]):active, .bp3-button:not([class*="bp3-intent-"]).bp3-active{
      background-color:#d8e1e8;
      background-image:none;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-button:not([class*="bp3-intent-"]):disabled, .bp3-button:not([class*="bp3-intent-"]).bp3-disabled{
      background-color:rgba(206, 217, 224, 0.5);
      background-image:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(92, 112, 128, 0.6);
      cursor:not-allowed;
      outline:none; }
      .bp3-button:not([class*="bp3-intent-"]):disabled.bp3-active, .bp3-button:not([class*="bp3-intent-"]):disabled.bp3-active:hover, .bp3-button:not([class*="bp3-intent-"]).bp3-disabled.bp3-active, .bp3-button:not([class*="bp3-intent-"]).bp3-disabled.bp3-active:hover{
        background:rgba(206, 217, 224, 0.7); }
  .bp3-button.bp3-intent-primary{
    background-color:#137cbd;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.1)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0));
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
    color:#ffffff; }
    .bp3-button.bp3-intent-primary:hover, .bp3-button.bp3-intent-primary:active, .bp3-button.bp3-intent-primary.bp3-active{
      color:#ffffff; }
    .bp3-button.bp3-intent-primary:hover{
      background-color:#106ba3;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2); }
    .bp3-button.bp3-intent-primary:active, .bp3-button.bp3-intent-primary.bp3-active{
      background-color:#0e5a8a;
      background-image:none;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-button.bp3-intent-primary:disabled, .bp3-button.bp3-intent-primary.bp3-disabled{
      background-color:rgba(19, 124, 189, 0.5);
      background-image:none;
      border-color:transparent;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(255, 255, 255, 0.6); }
  .bp3-button.bp3-intent-success{
    background-color:#0f9960;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.1)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0));
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
    color:#ffffff; }
    .bp3-button.bp3-intent-success:hover, .bp3-button.bp3-intent-success:active, .bp3-button.bp3-intent-success.bp3-active{
      color:#ffffff; }
    .bp3-button.bp3-intent-success:hover{
      background-color:#0d8050;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2); }
    .bp3-button.bp3-intent-success:active, .bp3-button.bp3-intent-success.bp3-active{
      background-color:#0a6640;
      background-image:none;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-button.bp3-intent-success:disabled, .bp3-button.bp3-intent-success.bp3-disabled{
      background-color:rgba(15, 153, 96, 0.5);
      background-image:none;
      border-color:transparent;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(255, 255, 255, 0.6); }
  .bp3-button.bp3-intent-warning{
    background-color:#d9822b;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.1)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0));
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
    color:#ffffff; }
    .bp3-button.bp3-intent-warning:hover, .bp3-button.bp3-intent-warning:active, .bp3-button.bp3-intent-warning.bp3-active{
      color:#ffffff; }
    .bp3-button.bp3-intent-warning:hover{
      background-color:#bf7326;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2); }
    .bp3-button.bp3-intent-warning:active, .bp3-button.bp3-intent-warning.bp3-active{
      background-color:#a66321;
      background-image:none;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-button.bp3-intent-warning:disabled, .bp3-button.bp3-intent-warning.bp3-disabled{
      background-color:rgba(217, 130, 43, 0.5);
      background-image:none;
      border-color:transparent;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(255, 255, 255, 0.6); }
  .bp3-button.bp3-intent-danger{
    background-color:#db3737;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.1)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0));
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
    color:#ffffff; }
    .bp3-button.bp3-intent-danger:hover, .bp3-button.bp3-intent-danger:active, .bp3-button.bp3-intent-danger.bp3-active{
      color:#ffffff; }
    .bp3-button.bp3-intent-danger:hover{
      background-color:#c23030;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2); }
    .bp3-button.bp3-intent-danger:active, .bp3-button.bp3-intent-danger.bp3-active{
      background-color:#a82a2a;
      background-image:none;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-button.bp3-intent-danger:disabled, .bp3-button.bp3-intent-danger.bp3-disabled{
      background-color:rgba(219, 55, 55, 0.5);
      background-image:none;
      border-color:transparent;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(255, 255, 255, 0.6); }
  .bp3-button[class*="bp3-intent-"] .bp3-button-spinner .bp3-spinner-head{
    stroke:#ffffff; }
  .bp3-button.bp3-large,
  .bp3-large .bp3-button{
    min-height:40px;
    min-width:40px;
    font-size:16px;
    padding:5px 15px; }
    .bp3-button.bp3-large::before,
    .bp3-button.bp3-large > *,
    .bp3-large .bp3-button::before,
    .bp3-large .bp3-button > *{
      margin-right:10px; }
    .bp3-button.bp3-large:empty::before,
    .bp3-button.bp3-large > :last-child,
    .bp3-large .bp3-button:empty::before,
    .bp3-large .bp3-button > :last-child{
      margin-right:0; }
  .bp3-button.bp3-small,
  .bp3-small .bp3-button{
    min-height:24px;
    min-width:24px;
    padding:0 7px; }
  .bp3-button.bp3-loading{
    position:relative; }
    .bp3-button.bp3-loading[class*="bp3-icon-"]::before{
      visibility:hidden; }
    .bp3-button.bp3-loading .bp3-button-spinner{
      margin:0;
      position:absolute; }
    .bp3-button.bp3-loading > :not(.bp3-button-spinner){
      visibility:hidden; }
  .bp3-button[class*="bp3-icon-"]::before{
    font-family:"Icons16", sans-serif;
    font-size:16px;
    font-style:normal;
    font-weight:400;
    line-height:1;
    -moz-osx-font-smoothing:grayscale;
    -webkit-font-smoothing:antialiased;
    color:#5c7080; }
  .bp3-button .bp3-icon, .bp3-button .bp3-icon-standard, .bp3-button .bp3-icon-large{
    color:#5c7080; }
    .bp3-button .bp3-icon.bp3-align-right, .bp3-button .bp3-icon-standard.bp3-align-right, .bp3-button .bp3-icon-large.bp3-align-right{
      margin-left:7px; }
  .bp3-button .bp3-icon:first-child:last-child,
  .bp3-button .bp3-spinner + .bp3-icon:last-child{
    margin:0 -7px; }
  .bp3-dark .bp3-button:not([class*="bp3-intent-"]){
    background-color:#394b59;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.05)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.05), rgba(255, 255, 255, 0));
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
    color:#f5f8fa; }
    .bp3-dark .bp3-button:not([class*="bp3-intent-"]):hover, .bp3-dark .bp3-button:not([class*="bp3-intent-"]):active, .bp3-dark .bp3-button:not([class*="bp3-intent-"]).bp3-active{
      color:#f5f8fa; }
    .bp3-dark .bp3-button:not([class*="bp3-intent-"]):hover{
      background-color:#30404d;
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-button:not([class*="bp3-intent-"]):active, .bp3-dark .bp3-button:not([class*="bp3-intent-"]).bp3-active{
      background-color:#202b33;
      background-image:none;
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-dark .bp3-button:not([class*="bp3-intent-"]):disabled, .bp3-dark .bp3-button:not([class*="bp3-intent-"]).bp3-disabled{
      background-color:rgba(57, 75, 89, 0.5);
      background-image:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(167, 182, 194, 0.6); }
      .bp3-dark .bp3-button:not([class*="bp3-intent-"]):disabled.bp3-active, .bp3-dark .bp3-button:not([class*="bp3-intent-"]).bp3-disabled.bp3-active{
        background:rgba(57, 75, 89, 0.7); }
    .bp3-dark .bp3-button:not([class*="bp3-intent-"]) .bp3-button-spinner .bp3-spinner-head{
      background:rgba(16, 22, 26, 0.5);
      stroke:#8a9ba8; }
    .bp3-dark .bp3-button:not([class*="bp3-intent-"])[class*="bp3-icon-"]::before{
      color:#a7b6c2; }
    .bp3-dark .bp3-button:not([class*="bp3-intent-"]) .bp3-icon, .bp3-dark .bp3-button:not([class*="bp3-intent-"]) .bp3-icon-standard, .bp3-dark .bp3-button:not([class*="bp3-intent-"]) .bp3-icon-large{
      color:#a7b6c2; }
  .bp3-dark .bp3-button[class*="bp3-intent-"]{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-button[class*="bp3-intent-"]:hover{
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-button[class*="bp3-intent-"]:active, .bp3-dark .bp3-button[class*="bp3-intent-"].bp3-active{
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-dark .bp3-button[class*="bp3-intent-"]:disabled, .bp3-dark .bp3-button[class*="bp3-intent-"].bp3-disabled{
      background-image:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(255, 255, 255, 0.3); }
    .bp3-dark .bp3-button[class*="bp3-intent-"] .bp3-button-spinner .bp3-spinner-head{
      stroke:#8a9ba8; }
  .bp3-button:disabled::before,
  .bp3-button:disabled .bp3-icon, .bp3-button:disabled .bp3-icon-standard, .bp3-button:disabled .bp3-icon-large, .bp3-button.bp3-disabled::before,
  .bp3-button.bp3-disabled .bp3-icon, .bp3-button.bp3-disabled .bp3-icon-standard, .bp3-button.bp3-disabled .bp3-icon-large, .bp3-button[class*="bp3-intent-"]::before,
  .bp3-button[class*="bp3-intent-"] .bp3-icon, .bp3-button[class*="bp3-intent-"] .bp3-icon-standard, .bp3-button[class*="bp3-intent-"] .bp3-icon-large{
    color:inherit !important; }
  .bp3-button.bp3-minimal{
    background:none;
    -webkit-box-shadow:none;
            box-shadow:none; }
    .bp3-button.bp3-minimal:hover{
      background:rgba(167, 182, 194, 0.3);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#182026;
      text-decoration:none; }
    .bp3-button.bp3-minimal:active, .bp3-button.bp3-minimal.bp3-active{
      background:rgba(115, 134, 148, 0.3);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#182026; }
    .bp3-button.bp3-minimal:disabled, .bp3-button.bp3-minimal:disabled:hover, .bp3-button.bp3-minimal.bp3-disabled, .bp3-button.bp3-minimal.bp3-disabled:hover{
      background:none;
      color:rgba(92, 112, 128, 0.6);
      cursor:not-allowed; }
      .bp3-button.bp3-minimal:disabled.bp3-active, .bp3-button.bp3-minimal:disabled:hover.bp3-active, .bp3-button.bp3-minimal.bp3-disabled.bp3-active, .bp3-button.bp3-minimal.bp3-disabled:hover.bp3-active{
        background:rgba(115, 134, 148, 0.3); }
    .bp3-dark .bp3-button.bp3-minimal{
      background:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:inherit; }
      .bp3-dark .bp3-button.bp3-minimal:hover, .bp3-dark .bp3-button.bp3-minimal:active, .bp3-dark .bp3-button.bp3-minimal.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none; }
      .bp3-dark .bp3-button.bp3-minimal:hover{
        background:rgba(138, 155, 168, 0.15); }
      .bp3-dark .bp3-button.bp3-minimal:active, .bp3-dark .bp3-button.bp3-minimal.bp3-active{
        background:rgba(138, 155, 168, 0.3);
        color:#f5f8fa; }
      .bp3-dark .bp3-button.bp3-minimal:disabled, .bp3-dark .bp3-button.bp3-minimal:disabled:hover, .bp3-dark .bp3-button.bp3-minimal.bp3-disabled, .bp3-dark .bp3-button.bp3-minimal.bp3-disabled:hover{
        background:none;
        color:rgba(167, 182, 194, 0.6);
        cursor:not-allowed; }
        .bp3-dark .bp3-button.bp3-minimal:disabled.bp3-active, .bp3-dark .bp3-button.bp3-minimal:disabled:hover.bp3-active, .bp3-dark .bp3-button.bp3-minimal.bp3-disabled.bp3-active, .bp3-dark .bp3-button.bp3-minimal.bp3-disabled:hover.bp3-active{
          background:rgba(138, 155, 168, 0.3); }
    .bp3-button.bp3-minimal.bp3-intent-primary{
      color:#106ba3; }
      .bp3-button.bp3-minimal.bp3-intent-primary:hover, .bp3-button.bp3-minimal.bp3-intent-primary:active, .bp3-button.bp3-minimal.bp3-intent-primary.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#106ba3; }
      .bp3-button.bp3-minimal.bp3-intent-primary:hover{
        background:rgba(19, 124, 189, 0.15);
        color:#106ba3; }
      .bp3-button.bp3-minimal.bp3-intent-primary:active, .bp3-button.bp3-minimal.bp3-intent-primary.bp3-active{
        background:rgba(19, 124, 189, 0.3);
        color:#106ba3; }
      .bp3-button.bp3-minimal.bp3-intent-primary:disabled, .bp3-button.bp3-minimal.bp3-intent-primary.bp3-disabled{
        background:none;
        color:rgba(16, 107, 163, 0.5); }
        .bp3-button.bp3-minimal.bp3-intent-primary:disabled.bp3-active, .bp3-button.bp3-minimal.bp3-intent-primary.bp3-disabled.bp3-active{
          background:rgba(19, 124, 189, 0.3); }
      .bp3-button.bp3-minimal.bp3-intent-primary .bp3-button-spinner .bp3-spinner-head{
        stroke:#106ba3; }
      .bp3-dark .bp3-button.bp3-minimal.bp3-intent-primary{
        color:#48aff0; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-primary:hover{
          background:rgba(19, 124, 189, 0.2);
          color:#48aff0; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-primary:active, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-primary.bp3-active{
          background:rgba(19, 124, 189, 0.3);
          color:#48aff0; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-primary:disabled, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-primary.bp3-disabled{
          background:none;
          color:rgba(72, 175, 240, 0.5); }
          .bp3-dark .bp3-button.bp3-minimal.bp3-intent-primary:disabled.bp3-active, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-primary.bp3-disabled.bp3-active{
            background:rgba(19, 124, 189, 0.3); }
    .bp3-button.bp3-minimal.bp3-intent-success{
      color:#0d8050; }
      .bp3-button.bp3-minimal.bp3-intent-success:hover, .bp3-button.bp3-minimal.bp3-intent-success:active, .bp3-button.bp3-minimal.bp3-intent-success.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#0d8050; }
      .bp3-button.bp3-minimal.bp3-intent-success:hover{
        background:rgba(15, 153, 96, 0.15);
        color:#0d8050; }
      .bp3-button.bp3-minimal.bp3-intent-success:active, .bp3-button.bp3-minimal.bp3-intent-success.bp3-active{
        background:rgba(15, 153, 96, 0.3);
        color:#0d8050; }
      .bp3-button.bp3-minimal.bp3-intent-success:disabled, .bp3-button.bp3-minimal.bp3-intent-success.bp3-disabled{
        background:none;
        color:rgba(13, 128, 80, 0.5); }
        .bp3-button.bp3-minimal.bp3-intent-success:disabled.bp3-active, .bp3-button.bp3-minimal.bp3-intent-success.bp3-disabled.bp3-active{
          background:rgba(15, 153, 96, 0.3); }
      .bp3-button.bp3-minimal.bp3-intent-success .bp3-button-spinner .bp3-spinner-head{
        stroke:#0d8050; }
      .bp3-dark .bp3-button.bp3-minimal.bp3-intent-success{
        color:#3dcc91; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-success:hover{
          background:rgba(15, 153, 96, 0.2);
          color:#3dcc91; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-success:active, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-success.bp3-active{
          background:rgba(15, 153, 96, 0.3);
          color:#3dcc91; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-success:disabled, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-success.bp3-disabled{
          background:none;
          color:rgba(61, 204, 145, 0.5); }
          .bp3-dark .bp3-button.bp3-minimal.bp3-intent-success:disabled.bp3-active, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-success.bp3-disabled.bp3-active{
            background:rgba(15, 153, 96, 0.3); }
    .bp3-button.bp3-minimal.bp3-intent-warning{
      color:#bf7326; }
      .bp3-button.bp3-minimal.bp3-intent-warning:hover, .bp3-button.bp3-minimal.bp3-intent-warning:active, .bp3-button.bp3-minimal.bp3-intent-warning.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#bf7326; }
      .bp3-button.bp3-minimal.bp3-intent-warning:hover{
        background:rgba(217, 130, 43, 0.15);
        color:#bf7326; }
      .bp3-button.bp3-minimal.bp3-intent-warning:active, .bp3-button.bp3-minimal.bp3-intent-warning.bp3-active{
        background:rgba(217, 130, 43, 0.3);
        color:#bf7326; }
      .bp3-button.bp3-minimal.bp3-intent-warning:disabled, .bp3-button.bp3-minimal.bp3-intent-warning.bp3-disabled{
        background:none;
        color:rgba(191, 115, 38, 0.5); }
        .bp3-button.bp3-minimal.bp3-intent-warning:disabled.bp3-active, .bp3-button.bp3-minimal.bp3-intent-warning.bp3-disabled.bp3-active{
          background:rgba(217, 130, 43, 0.3); }
      .bp3-button.bp3-minimal.bp3-intent-warning .bp3-button-spinner .bp3-spinner-head{
        stroke:#bf7326; }
      .bp3-dark .bp3-button.bp3-minimal.bp3-intent-warning{
        color:#ffb366; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-warning:hover{
          background:rgba(217, 130, 43, 0.2);
          color:#ffb366; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-warning:active, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-warning.bp3-active{
          background:rgba(217, 130, 43, 0.3);
          color:#ffb366; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-warning:disabled, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-warning.bp3-disabled{
          background:none;
          color:rgba(255, 179, 102, 0.5); }
          .bp3-dark .bp3-button.bp3-minimal.bp3-intent-warning:disabled.bp3-active, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-warning.bp3-disabled.bp3-active{
            background:rgba(217, 130, 43, 0.3); }
    .bp3-button.bp3-minimal.bp3-intent-danger{
      color:#c23030; }
      .bp3-button.bp3-minimal.bp3-intent-danger:hover, .bp3-button.bp3-minimal.bp3-intent-danger:active, .bp3-button.bp3-minimal.bp3-intent-danger.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#c23030; }
      .bp3-button.bp3-minimal.bp3-intent-danger:hover{
        background:rgba(219, 55, 55, 0.15);
        color:#c23030; }
      .bp3-button.bp3-minimal.bp3-intent-danger:active, .bp3-button.bp3-minimal.bp3-intent-danger.bp3-active{
        background:rgba(219, 55, 55, 0.3);
        color:#c23030; }
      .bp3-button.bp3-minimal.bp3-intent-danger:disabled, .bp3-button.bp3-minimal.bp3-intent-danger.bp3-disabled{
        background:none;
        color:rgba(194, 48, 48, 0.5); }
        .bp3-button.bp3-minimal.bp3-intent-danger:disabled.bp3-active, .bp3-button.bp3-minimal.bp3-intent-danger.bp3-disabled.bp3-active{
          background:rgba(219, 55, 55, 0.3); }
      .bp3-button.bp3-minimal.bp3-intent-danger .bp3-button-spinner .bp3-spinner-head{
        stroke:#c23030; }
      .bp3-dark .bp3-button.bp3-minimal.bp3-intent-danger{
        color:#ff7373; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-danger:hover{
          background:rgba(219, 55, 55, 0.2);
          color:#ff7373; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-danger:active, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-danger.bp3-active{
          background:rgba(219, 55, 55, 0.3);
          color:#ff7373; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-danger:disabled, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-danger.bp3-disabled{
          background:none;
          color:rgba(255, 115, 115, 0.5); }
          .bp3-dark .bp3-button.bp3-minimal.bp3-intent-danger:disabled.bp3-active, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-danger.bp3-disabled.bp3-active{
            background:rgba(219, 55, 55, 0.3); }
  .bp3-button.bp3-outlined{
    background:none;
    -webkit-box-shadow:none;
            box-shadow:none;
    border:1px solid rgba(24, 32, 38, 0.2);
    -webkit-box-sizing:border-box;
            box-sizing:border-box; }
    .bp3-button.bp3-outlined:hover{
      background:rgba(167, 182, 194, 0.3);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#182026;
      text-decoration:none; }
    .bp3-button.bp3-outlined:active, .bp3-button.bp3-outlined.bp3-active{
      background:rgba(115, 134, 148, 0.3);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#182026; }
    .bp3-button.bp3-outlined:disabled, .bp3-button.bp3-outlined:disabled:hover, .bp3-button.bp3-outlined.bp3-disabled, .bp3-button.bp3-outlined.bp3-disabled:hover{
      background:none;
      color:rgba(92, 112, 128, 0.6);
      cursor:not-allowed; }
      .bp3-button.bp3-outlined:disabled.bp3-active, .bp3-button.bp3-outlined:disabled:hover.bp3-active, .bp3-button.bp3-outlined.bp3-disabled.bp3-active, .bp3-button.bp3-outlined.bp3-disabled:hover.bp3-active{
        background:rgba(115, 134, 148, 0.3); }
    .bp3-dark .bp3-button.bp3-outlined{
      background:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:inherit; }
      .bp3-dark .bp3-button.bp3-outlined:hover, .bp3-dark .bp3-button.bp3-outlined:active, .bp3-dark .bp3-button.bp3-outlined.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none; }
      .bp3-dark .bp3-button.bp3-outlined:hover{
        background:rgba(138, 155, 168, 0.15); }
      .bp3-dark .bp3-button.bp3-outlined:active, .bp3-dark .bp3-button.bp3-outlined.bp3-active{
        background:rgba(138, 155, 168, 0.3);
        color:#f5f8fa; }
      .bp3-dark .bp3-button.bp3-outlined:disabled, .bp3-dark .bp3-button.bp3-outlined:disabled:hover, .bp3-dark .bp3-button.bp3-outlined.bp3-disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-disabled:hover{
        background:none;
        color:rgba(167, 182, 194, 0.6);
        cursor:not-allowed; }
        .bp3-dark .bp3-button.bp3-outlined:disabled.bp3-active, .bp3-dark .bp3-button.bp3-outlined:disabled:hover.bp3-active, .bp3-dark .bp3-button.bp3-outlined.bp3-disabled.bp3-active, .bp3-dark .bp3-button.bp3-outlined.bp3-disabled:hover.bp3-active{
          background:rgba(138, 155, 168, 0.3); }
    .bp3-button.bp3-outlined.bp3-intent-primary{
      color:#106ba3; }
      .bp3-button.bp3-outlined.bp3-intent-primary:hover, .bp3-button.bp3-outlined.bp3-intent-primary:active, .bp3-button.bp3-outlined.bp3-intent-primary.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#106ba3; }
      .bp3-button.bp3-outlined.bp3-intent-primary:hover{
        background:rgba(19, 124, 189, 0.15);
        color:#106ba3; }
      .bp3-button.bp3-outlined.bp3-intent-primary:active, .bp3-button.bp3-outlined.bp3-intent-primary.bp3-active{
        background:rgba(19, 124, 189, 0.3);
        color:#106ba3; }
      .bp3-button.bp3-outlined.bp3-intent-primary:disabled, .bp3-button.bp3-outlined.bp3-intent-primary.bp3-disabled{
        background:none;
        color:rgba(16, 107, 163, 0.5); }
        .bp3-button.bp3-outlined.bp3-intent-primary:disabled.bp3-active, .bp3-button.bp3-outlined.bp3-intent-primary.bp3-disabled.bp3-active{
          background:rgba(19, 124, 189, 0.3); }
      .bp3-button.bp3-outlined.bp3-intent-primary .bp3-button-spinner .bp3-spinner-head{
        stroke:#106ba3; }
      .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary{
        color:#48aff0; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary:hover{
          background:rgba(19, 124, 189, 0.2);
          color:#48aff0; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary:active, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary.bp3-active{
          background:rgba(19, 124, 189, 0.3);
          color:#48aff0; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary:disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary.bp3-disabled{
          background:none;
          color:rgba(72, 175, 240, 0.5); }
          .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary:disabled.bp3-active, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary.bp3-disabled.bp3-active{
            background:rgba(19, 124, 189, 0.3); }
    .bp3-button.bp3-outlined.bp3-intent-success{
      color:#0d8050; }
      .bp3-button.bp3-outlined.bp3-intent-success:hover, .bp3-button.bp3-outlined.bp3-intent-success:active, .bp3-button.bp3-outlined.bp3-intent-success.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#0d8050; }
      .bp3-button.bp3-outlined.bp3-intent-success:hover{
        background:rgba(15, 153, 96, 0.15);
        color:#0d8050; }
      .bp3-button.bp3-outlined.bp3-intent-success:active, .bp3-button.bp3-outlined.bp3-intent-success.bp3-active{
        background:rgba(15, 153, 96, 0.3);
        color:#0d8050; }
      .bp3-button.bp3-outlined.bp3-intent-success:disabled, .bp3-button.bp3-outlined.bp3-intent-success.bp3-disabled{
        background:none;
        color:rgba(13, 128, 80, 0.5); }
        .bp3-button.bp3-outlined.bp3-intent-success:disabled.bp3-active, .bp3-button.bp3-outlined.bp3-intent-success.bp3-disabled.bp3-active{
          background:rgba(15, 153, 96, 0.3); }
      .bp3-button.bp3-outlined.bp3-intent-success .bp3-button-spinner .bp3-spinner-head{
        stroke:#0d8050; }
      .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success{
        color:#3dcc91; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success:hover{
          background:rgba(15, 153, 96, 0.2);
          color:#3dcc91; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success:active, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success.bp3-active{
          background:rgba(15, 153, 96, 0.3);
          color:#3dcc91; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success:disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success.bp3-disabled{
          background:none;
          color:rgba(61, 204, 145, 0.5); }
          .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success:disabled.bp3-active, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success.bp3-disabled.bp3-active{
            background:rgba(15, 153, 96, 0.3); }
    .bp3-button.bp3-outlined.bp3-intent-warning{
      color:#bf7326; }
      .bp3-button.bp3-outlined.bp3-intent-warning:hover, .bp3-button.bp3-outlined.bp3-intent-warning:active, .bp3-button.bp3-outlined.bp3-intent-warning.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#bf7326; }
      .bp3-button.bp3-outlined.bp3-intent-warning:hover{
        background:rgba(217, 130, 43, 0.15);
        color:#bf7326; }
      .bp3-button.bp3-outlined.bp3-intent-warning:active, .bp3-button.bp3-outlined.bp3-intent-warning.bp3-active{
        background:rgba(217, 130, 43, 0.3);
        color:#bf7326; }
      .bp3-button.bp3-outlined.bp3-intent-warning:disabled, .bp3-button.bp3-outlined.bp3-intent-warning.bp3-disabled{
        background:none;
        color:rgba(191, 115, 38, 0.5); }
        .bp3-button.bp3-outlined.bp3-intent-warning:disabled.bp3-active, .bp3-button.bp3-outlined.bp3-intent-warning.bp3-disabled.bp3-active{
          background:rgba(217, 130, 43, 0.3); }
      .bp3-button.bp3-outlined.bp3-intent-warning .bp3-button-spinner .bp3-spinner-head{
        stroke:#bf7326; }
      .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning{
        color:#ffb366; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning:hover{
          background:rgba(217, 130, 43, 0.2);
          color:#ffb366; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning:active, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning.bp3-active{
          background:rgba(217, 130, 43, 0.3);
          color:#ffb366; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning:disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning.bp3-disabled{
          background:none;
          color:rgba(255, 179, 102, 0.5); }
          .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning:disabled.bp3-active, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning.bp3-disabled.bp3-active{
            background:rgba(217, 130, 43, 0.3); }
    .bp3-button.bp3-outlined.bp3-intent-danger{
      color:#c23030; }
      .bp3-button.bp3-outlined.bp3-intent-danger:hover, .bp3-button.bp3-outlined.bp3-intent-danger:active, .bp3-button.bp3-outlined.bp3-intent-danger.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#c23030; }
      .bp3-button.bp3-outlined.bp3-intent-danger:hover{
        background:rgba(219, 55, 55, 0.15);
        color:#c23030; }
      .bp3-button.bp3-outlined.bp3-intent-danger:active, .bp3-button.bp3-outlined.bp3-intent-danger.bp3-active{
        background:rgba(219, 55, 55, 0.3);
        color:#c23030; }
      .bp3-button.bp3-outlined.bp3-intent-danger:disabled, .bp3-button.bp3-outlined.bp3-intent-danger.bp3-disabled{
        background:none;
        color:rgba(194, 48, 48, 0.5); }
        .bp3-button.bp3-outlined.bp3-intent-danger:disabled.bp3-active, .bp3-button.bp3-outlined.bp3-intent-danger.bp3-disabled.bp3-active{
          background:rgba(219, 55, 55, 0.3); }
      .bp3-button.bp3-outlined.bp3-intent-danger .bp3-button-spinner .bp3-spinner-head{
        stroke:#c23030; }
      .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger{
        color:#ff7373; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger:hover{
          background:rgba(219, 55, 55, 0.2);
          color:#ff7373; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger:active, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger.bp3-active{
          background:rgba(219, 55, 55, 0.3);
          color:#ff7373; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger:disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger.bp3-disabled{
          background:none;
          color:rgba(255, 115, 115, 0.5); }
          .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger:disabled.bp3-active, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger.bp3-disabled.bp3-active{
            background:rgba(219, 55, 55, 0.3); }
    .bp3-button.bp3-outlined:disabled, .bp3-button.bp3-outlined.bp3-disabled, .bp3-button.bp3-outlined:disabled:hover, .bp3-button.bp3-outlined.bp3-disabled:hover{
      border-color:rgba(92, 112, 128, 0.1); }
    .bp3-dark .bp3-button.bp3-outlined{
      border-color:rgba(255, 255, 255, 0.4); }
      .bp3-dark .bp3-button.bp3-outlined:disabled, .bp3-dark .bp3-button.bp3-outlined:disabled:hover, .bp3-dark .bp3-button.bp3-outlined.bp3-disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-disabled:hover{
        border-color:rgba(255, 255, 255, 0.2); }
    .bp3-button.bp3-outlined.bp3-intent-primary{
      border-color:rgba(16, 107, 163, 0.6); }
      .bp3-button.bp3-outlined.bp3-intent-primary:disabled, .bp3-button.bp3-outlined.bp3-intent-primary.bp3-disabled{
        border-color:rgba(16, 107, 163, 0.2); }
      .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary{
        border-color:rgba(72, 175, 240, 0.6); }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary:disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary.bp3-disabled{
          border-color:rgba(72, 175, 240, 0.2); }
    .bp3-button.bp3-outlined.bp3-intent-success{
      border-color:rgba(13, 128, 80, 0.6); }
      .bp3-button.bp3-outlined.bp3-intent-success:disabled, .bp3-button.bp3-outlined.bp3-intent-success.bp3-disabled{
        border-color:rgba(13, 128, 80, 0.2); }
      .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success{
        border-color:rgba(61, 204, 145, 0.6); }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success:disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success.bp3-disabled{
          border-color:rgba(61, 204, 145, 0.2); }
    .bp3-button.bp3-outlined.bp3-intent-warning{
      border-color:rgba(191, 115, 38, 0.6); }
      .bp3-button.bp3-outlined.bp3-intent-warning:disabled, .bp3-button.bp3-outlined.bp3-intent-warning.bp3-disabled{
        border-color:rgba(191, 115, 38, 0.2); }
      .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning{
        border-color:rgba(255, 179, 102, 0.6); }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning:disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning.bp3-disabled{
          border-color:rgba(255, 179, 102, 0.2); }
    .bp3-button.bp3-outlined.bp3-intent-danger{
      border-color:rgba(194, 48, 48, 0.6); }
      .bp3-button.bp3-outlined.bp3-intent-danger:disabled, .bp3-button.bp3-outlined.bp3-intent-danger.bp3-disabled{
        border-color:rgba(194, 48, 48, 0.2); }
      .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger{
        border-color:rgba(255, 115, 115, 0.6); }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger:disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger.bp3-disabled{
          border-color:rgba(255, 115, 115, 0.2); }

a.bp3-button{
  text-align:center;
  text-decoration:none;
  -webkit-transition:none;
  transition:none; }
  a.bp3-button, a.bp3-button:hover, a.bp3-button:active{
    color:#182026; }
  a.bp3-button.bp3-disabled{
    color:rgba(92, 112, 128, 0.6); }

.bp3-button-text{
  -webkit-box-flex:0;
      -ms-flex:0 1 auto;
          flex:0 1 auto; }

.bp3-button.bp3-align-left .bp3-button-text, .bp3-button.bp3-align-right .bp3-button-text,
.bp3-button-group.bp3-align-left .bp3-button-text,
.bp3-button-group.bp3-align-right .bp3-button-text{
  -webkit-box-flex:1;
      -ms-flex:1 1 auto;
          flex:1 1 auto; }
.bp3-button-group{
  display:-webkit-inline-box;
  display:-ms-inline-flexbox;
  display:inline-flex; }
  .bp3-button-group .bp3-button{
    -webkit-box-flex:0;
        -ms-flex:0 0 auto;
            flex:0 0 auto;
    position:relative;
    z-index:4; }
    .bp3-button-group .bp3-button:focus{
      z-index:5; }
    .bp3-button-group .bp3-button:hover{
      z-index:6; }
    .bp3-button-group .bp3-button:active, .bp3-button-group .bp3-button.bp3-active{
      z-index:7; }
    .bp3-button-group .bp3-button:disabled, .bp3-button-group .bp3-button.bp3-disabled{
      z-index:3; }
    .bp3-button-group .bp3-button[class*="bp3-intent-"]{
      z-index:9; }
      .bp3-button-group .bp3-button[class*="bp3-intent-"]:focus{
        z-index:10; }
      .bp3-button-group .bp3-button[class*="bp3-intent-"]:hover{
        z-index:11; }
      .bp3-button-group .bp3-button[class*="bp3-intent-"]:active, .bp3-button-group .bp3-button[class*="bp3-intent-"].bp3-active{
        z-index:12; }
      .bp3-button-group .bp3-button[class*="bp3-intent-"]:disabled, .bp3-button-group .bp3-button[class*="bp3-intent-"].bp3-disabled{
        z-index:8; }
  .bp3-button-group:not(.bp3-minimal) > .bp3-popover-wrapper:not(:first-child) .bp3-button,
  .bp3-button-group:not(.bp3-minimal) > .bp3-button:not(:first-child){
    border-bottom-left-radius:0;
    border-top-left-radius:0; }
  .bp3-button-group:not(.bp3-minimal) > .bp3-popover-wrapper:not(:last-child) .bp3-button,
  .bp3-button-group:not(.bp3-minimal) > .bp3-button:not(:last-child){
    border-bottom-right-radius:0;
    border-top-right-radius:0;
    margin-right:-1px; }
  .bp3-button-group.bp3-minimal .bp3-button{
    background:none;
    -webkit-box-shadow:none;
            box-shadow:none; }
    .bp3-button-group.bp3-minimal .bp3-button:hover{
      background:rgba(167, 182, 194, 0.3);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#182026;
      text-decoration:none; }
    .bp3-button-group.bp3-minimal .bp3-button:active, .bp3-button-group.bp3-minimal .bp3-button.bp3-active{
      background:rgba(115, 134, 148, 0.3);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#182026; }
    .bp3-button-group.bp3-minimal .bp3-button:disabled, .bp3-button-group.bp3-minimal .bp3-button:disabled:hover, .bp3-button-group.bp3-minimal .bp3-button.bp3-disabled, .bp3-button-group.bp3-minimal .bp3-button.bp3-disabled:hover{
      background:none;
      color:rgba(92, 112, 128, 0.6);
      cursor:not-allowed; }
      .bp3-button-group.bp3-minimal .bp3-button:disabled.bp3-active, .bp3-button-group.bp3-minimal .bp3-button:disabled:hover.bp3-active, .bp3-button-group.bp3-minimal .bp3-button.bp3-disabled.bp3-active, .bp3-button-group.bp3-minimal .bp3-button.bp3-disabled:hover.bp3-active{
        background:rgba(115, 134, 148, 0.3); }
    .bp3-dark .bp3-button-group.bp3-minimal .bp3-button{
      background:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:inherit; }
      .bp3-dark .bp3-button-group.bp3-minimal .bp3-button:hover, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button:active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none; }
      .bp3-dark .bp3-button-group.bp3-minimal .bp3-button:hover{
        background:rgba(138, 155, 168, 0.15); }
      .bp3-dark .bp3-button-group.bp3-minimal .bp3-button:active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-active{
        background:rgba(138, 155, 168, 0.3);
        color:#f5f8fa; }
      .bp3-dark .bp3-button-group.bp3-minimal .bp3-button:disabled, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button:disabled:hover, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-disabled, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-disabled:hover{
        background:none;
        color:rgba(167, 182, 194, 0.6);
        cursor:not-allowed; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button:disabled.bp3-active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button:disabled:hover.bp3-active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-disabled.bp3-active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-disabled:hover.bp3-active{
          background:rgba(138, 155, 168, 0.3); }
    .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary{
      color:#106ba3; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:hover, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#106ba3; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:hover{
        background:rgba(19, 124, 189, 0.15);
        color:#106ba3; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary.bp3-active{
        background:rgba(19, 124, 189, 0.3);
        color:#106ba3; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:disabled, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary.bp3-disabled{
        background:none;
        color:rgba(16, 107, 163, 0.5); }
        .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:disabled.bp3-active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary.bp3-disabled.bp3-active{
          background:rgba(19, 124, 189, 0.3); }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary .bp3-button-spinner .bp3-spinner-head{
        stroke:#106ba3; }
      .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary{
        color:#48aff0; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:hover{
          background:rgba(19, 124, 189, 0.2);
          color:#48aff0; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary.bp3-active{
          background:rgba(19, 124, 189, 0.3);
          color:#48aff0; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:disabled, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary.bp3-disabled{
          background:none;
          color:rgba(72, 175, 240, 0.5); }
          .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:disabled.bp3-active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary.bp3-disabled.bp3-active{
            background:rgba(19, 124, 189, 0.3); }
    .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success{
      color:#0d8050; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:hover, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#0d8050; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:hover{
        background:rgba(15, 153, 96, 0.15);
        color:#0d8050; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success.bp3-active{
        background:rgba(15, 153, 96, 0.3);
        color:#0d8050; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:disabled, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success.bp3-disabled{
        background:none;
        color:rgba(13, 128, 80, 0.5); }
        .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:disabled.bp3-active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success.bp3-disabled.bp3-active{
          background:rgba(15, 153, 96, 0.3); }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success .bp3-button-spinner .bp3-spinner-head{
        stroke:#0d8050; }
      .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success{
        color:#3dcc91; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:hover{
          background:rgba(15, 153, 96, 0.2);
          color:#3dcc91; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success.bp3-active{
          background:rgba(15, 153, 96, 0.3);
          color:#3dcc91; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:disabled, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success.bp3-disabled{
          background:none;
          color:rgba(61, 204, 145, 0.5); }
          .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:disabled.bp3-active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success.bp3-disabled.bp3-active{
            background:rgba(15, 153, 96, 0.3); }
    .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning{
      color:#bf7326; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:hover, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#bf7326; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:hover{
        background:rgba(217, 130, 43, 0.15);
        color:#bf7326; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning.bp3-active{
        background:rgba(217, 130, 43, 0.3);
        color:#bf7326; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:disabled, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning.bp3-disabled{
        background:none;
        color:rgba(191, 115, 38, 0.5); }
        .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:disabled.bp3-active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning.bp3-disabled.bp3-active{
          background:rgba(217, 130, 43, 0.3); }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning .bp3-button-spinner .bp3-spinner-head{
        stroke:#bf7326; }
      .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning{
        color:#ffb366; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:hover{
          background:rgba(217, 130, 43, 0.2);
          color:#ffb366; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning.bp3-active{
          background:rgba(217, 130, 43, 0.3);
          color:#ffb366; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:disabled, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning.bp3-disabled{
          background:none;
          color:rgba(255, 179, 102, 0.5); }
          .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:disabled.bp3-active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning.bp3-disabled.bp3-active{
            background:rgba(217, 130, 43, 0.3); }
    .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger{
      color:#c23030; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:hover, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#c23030; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:hover{
        background:rgba(219, 55, 55, 0.15);
        color:#c23030; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger.bp3-active{
        background:rgba(219, 55, 55, 0.3);
        color:#c23030; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:disabled, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger.bp3-disabled{
        background:none;
        color:rgba(194, 48, 48, 0.5); }
        .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:disabled.bp3-active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger.bp3-disabled.bp3-active{
          background:rgba(219, 55, 55, 0.3); }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger .bp3-button-spinner .bp3-spinner-head{
        stroke:#c23030; }
      .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger{
        color:#ff7373; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:hover{
          background:rgba(219, 55, 55, 0.2);
          color:#ff7373; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger.bp3-active{
          background:rgba(219, 55, 55, 0.3);
          color:#ff7373; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:disabled, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger.bp3-disabled{
          background:none;
          color:rgba(255, 115, 115, 0.5); }
          .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:disabled.bp3-active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger.bp3-disabled.bp3-active{
            background:rgba(219, 55, 55, 0.3); }
  .bp3-button-group .bp3-popover-wrapper,
  .bp3-button-group .bp3-popover-target{
    display:-webkit-box;
    display:-ms-flexbox;
    display:flex;
    -webkit-box-flex:1;
        -ms-flex:1 1 auto;
            flex:1 1 auto; }
  .bp3-button-group.bp3-fill{
    display:-webkit-box;
    display:-ms-flexbox;
    display:flex;
    width:100%; }
  .bp3-button-group .bp3-button.bp3-fill,
  .bp3-button-group.bp3-fill .bp3-button:not(.bp3-fixed){
    -webkit-box-flex:1;
        -ms-flex:1 1 auto;
            flex:1 1 auto; }
  .bp3-button-group.bp3-vertical{
    -webkit-box-align:stretch;
        -ms-flex-align:stretch;
            align-items:stretch;
    -webkit-box-orient:vertical;
    -webkit-box-direction:normal;
        -ms-flex-direction:column;
            flex-direction:column;
    vertical-align:top; }
    .bp3-button-group.bp3-vertical.bp3-fill{
      height:100%;
      width:unset; }
    .bp3-button-group.bp3-vertical .bp3-button{
      margin-right:0 !important;
      width:100%; }
    .bp3-button-group.bp3-vertical:not(.bp3-minimal) > .bp3-popover-wrapper:first-child .bp3-button,
    .bp3-button-group.bp3-vertical:not(.bp3-minimal) > .bp3-button:first-child{
      border-radius:3px 3px 0 0; }
    .bp3-button-group.bp3-vertical:not(.bp3-minimal) > .bp3-popover-wrapper:last-child .bp3-button,
    .bp3-button-group.bp3-vertical:not(.bp3-minimal) > .bp3-button:last-child{
      border-radius:0 0 3px 3px; }
    .bp3-button-group.bp3-vertical:not(.bp3-minimal) > .bp3-popover-wrapper:not(:last-child) .bp3-button,
    .bp3-button-group.bp3-vertical:not(.bp3-minimal) > .bp3-button:not(:last-child){
      margin-bottom:-1px; }
  .bp3-button-group.bp3-align-left .bp3-button{
    text-align:left; }
  .bp3-dark .bp3-button-group:not(.bp3-minimal) > .bp3-popover-wrapper:not(:last-child) .bp3-button,
  .bp3-dark .bp3-button-group:not(.bp3-minimal) > .bp3-button:not(:last-child){
    margin-right:1px; }
  .bp3-dark .bp3-button-group.bp3-vertical > .bp3-popover-wrapper:not(:last-child) .bp3-button,
  .bp3-dark .bp3-button-group.bp3-vertical > .bp3-button:not(:last-child){
    margin-bottom:1px; }
.bp3-callout{
  font-size:14px;
  line-height:1.5;
  background-color:rgba(138, 155, 168, 0.15);
  border-radius:3px;
  padding:10px 12px 9px;
  position:relative;
  width:100%; }
  .bp3-callout[class*="bp3-icon-"]{
    padding-left:40px; }
    .bp3-callout[class*="bp3-icon-"]::before{
      font-family:"Icons20", sans-serif;
      font-size:20px;
      font-style:normal;
      font-weight:400;
      line-height:1;
      -moz-osx-font-smoothing:grayscale;
      -webkit-font-smoothing:antialiased;
      color:#5c7080;
      left:10px;
      position:absolute;
      top:10px; }
  .bp3-callout.bp3-callout-icon{
    padding-left:40px; }
    .bp3-callout.bp3-callout-icon > .bp3-icon:first-child{
      color:#5c7080;
      left:10px;
      position:absolute;
      top:10px; }
  .bp3-callout .bp3-heading{
    line-height:20px;
    margin-bottom:5px;
    margin-top:0; }
    .bp3-callout .bp3-heading:last-child{
      margin-bottom:0; }
  .bp3-dark .bp3-callout{
    background-color:rgba(138, 155, 168, 0.2); }
    .bp3-dark .bp3-callout[class*="bp3-icon-"]::before{
      color:#a7b6c2; }
  .bp3-callout.bp3-intent-primary{
    background-color:rgba(19, 124, 189, 0.15); }
    .bp3-callout.bp3-intent-primary[class*="bp3-icon-"]::before,
    .bp3-callout.bp3-intent-primary > .bp3-icon:first-child,
    .bp3-callout.bp3-intent-primary .bp3-heading{
      color:#106ba3; }
    .bp3-dark .bp3-callout.bp3-intent-primary{
      background-color:rgba(19, 124, 189, 0.25); }
      .bp3-dark .bp3-callout.bp3-intent-primary[class*="bp3-icon-"]::before,
      .bp3-dark .bp3-callout.bp3-intent-primary > .bp3-icon:first-child,
      .bp3-dark .bp3-callout.bp3-intent-primary .bp3-heading{
        color:#48aff0; }
  .bp3-callout.bp3-intent-success{
    background-color:rgba(15, 153, 96, 0.15); }
    .bp3-callout.bp3-intent-success[class*="bp3-icon-"]::before,
    .bp3-callout.bp3-intent-success > .bp3-icon:first-child,
    .bp3-callout.bp3-intent-success .bp3-heading{
      color:#0d8050; }
    .bp3-dark .bp3-callout.bp3-intent-success{
      background-color:rgba(15, 153, 96, 0.25); }
      .bp3-dark .bp3-callout.bp3-intent-success[class*="bp3-icon-"]::before,
      .bp3-dark .bp3-callout.bp3-intent-success > .bp3-icon:first-child,
      .bp3-dark .bp3-callout.bp3-intent-success .bp3-heading{
        color:#3dcc91; }
  .bp3-callout.bp3-intent-warning{
    background-color:rgba(217, 130, 43, 0.15); }
    .bp3-callout.bp3-intent-warning[class*="bp3-icon-"]::before,
    .bp3-callout.bp3-intent-warning > .bp3-icon:first-child,
    .bp3-callout.bp3-intent-warning .bp3-heading{
      color:#bf7326; }
    .bp3-dark .bp3-callout.bp3-intent-warning{
      background-color:rgba(217, 130, 43, 0.25); }
      .bp3-dark .bp3-callout.bp3-intent-warning[class*="bp3-icon-"]::before,
      .bp3-dark .bp3-callout.bp3-intent-warning > .bp3-icon:first-child,
      .bp3-dark .bp3-callout.bp3-intent-warning .bp3-heading{
        color:#ffb366; }
  .bp3-callout.bp3-intent-danger{
    background-color:rgba(219, 55, 55, 0.15); }
    .bp3-callout.bp3-intent-danger[class*="bp3-icon-"]::before,
    .bp3-callout.bp3-intent-danger > .bp3-icon:first-child,
    .bp3-callout.bp3-intent-danger .bp3-heading{
      color:#c23030; }
    .bp3-dark .bp3-callout.bp3-intent-danger{
      background-color:rgba(219, 55, 55, 0.25); }
      .bp3-dark .bp3-callout.bp3-intent-danger[class*="bp3-icon-"]::before,
      .bp3-dark .bp3-callout.bp3-intent-danger > .bp3-icon:first-child,
      .bp3-dark .bp3-callout.bp3-intent-danger .bp3-heading{
        color:#ff7373; }
  .bp3-running-text .bp3-callout{
    margin:20px 0; }
.bp3-card{
  background-color:#ffffff;
  border-radius:3px;
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.15), 0 0 0 rgba(16, 22, 26, 0), 0 0 0 rgba(16, 22, 26, 0);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.15), 0 0 0 rgba(16, 22, 26, 0), 0 0 0 rgba(16, 22, 26, 0);
  padding:20px;
  -webkit-transition:-webkit-transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-box-shadow 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:-webkit-transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-box-shadow 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9), box-shadow 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9), box-shadow 200ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-box-shadow 200ms cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-card.bp3-dark,
  .bp3-dark .bp3-card{
    background-color:#30404d;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), 0 0 0 rgba(16, 22, 26, 0), 0 0 0 rgba(16, 22, 26, 0);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), 0 0 0 rgba(16, 22, 26, 0), 0 0 0 rgba(16, 22, 26, 0); }

.bp3-elevation-0{
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.15), 0 0 0 rgba(16, 22, 26, 0), 0 0 0 rgba(16, 22, 26, 0);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.15), 0 0 0 rgba(16, 22, 26, 0), 0 0 0 rgba(16, 22, 26, 0); }
  .bp3-elevation-0.bp3-dark,
  .bp3-dark .bp3-elevation-0{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), 0 0 0 rgba(16, 22, 26, 0), 0 0 0 rgba(16, 22, 26, 0);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), 0 0 0 rgba(16, 22, 26, 0), 0 0 0 rgba(16, 22, 26, 0); }

.bp3-elevation-1{
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.2); }
  .bp3-elevation-1.bp3-dark,
  .bp3-dark .bp3-elevation-1{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4); }

.bp3-elevation-2{
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 1px 1px rgba(16, 22, 26, 0.2), 0 2px 6px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 1px 1px rgba(16, 22, 26, 0.2), 0 2px 6px rgba(16, 22, 26, 0.2); }
  .bp3-elevation-2.bp3-dark,
  .bp3-dark .bp3-elevation-2{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 1px 1px rgba(16, 22, 26, 0.4), 0 2px 6px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 1px 1px rgba(16, 22, 26, 0.4), 0 2px 6px rgba(16, 22, 26, 0.4); }

.bp3-elevation-3{
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2); }
  .bp3-elevation-3.bp3-dark,
  .bp3-dark .bp3-elevation-3{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4); }

.bp3-elevation-4{
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 4px 8px rgba(16, 22, 26, 0.2), 0 18px 46px 6px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 4px 8px rgba(16, 22, 26, 0.2), 0 18px 46px 6px rgba(16, 22, 26, 0.2); }
  .bp3-elevation-4.bp3-dark,
  .bp3-dark .bp3-elevation-4{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 4px 8px rgba(16, 22, 26, 0.4), 0 18px 46px 6px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 4px 8px rgba(16, 22, 26, 0.4), 0 18px 46px 6px rgba(16, 22, 26, 0.4); }

.bp3-card.bp3-interactive:hover{
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
  cursor:pointer; }
  .bp3-card.bp3-interactive:hover.bp3-dark,
  .bp3-dark .bp3-card.bp3-interactive:hover{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4); }

.bp3-card.bp3-interactive:active{
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.2);
  opacity:0.9;
  -webkit-transition-duration:0;
          transition-duration:0; }
  .bp3-card.bp3-interactive:active.bp3-dark,
  .bp3-dark .bp3-card.bp3-interactive:active{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4); }

.bp3-collapse{
  height:0;
  overflow-y:hidden;
  -webkit-transition:height 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:height 200ms cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-collapse .bp3-collapse-body{
    -webkit-transition:-webkit-transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
    transition:-webkit-transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
    transition:transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
    transition:transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9); }
    .bp3-collapse .bp3-collapse-body[aria-hidden="true"]{
      display:none; }

.bp3-context-menu .bp3-popover-target{
  display:block; }

.bp3-context-menu-popover-target{
  position:fixed; }

.bp3-divider{
  border-bottom:1px solid rgba(16, 22, 26, 0.15);
  border-right:1px solid rgba(16, 22, 26, 0.15);
  margin:5px; }
  .bp3-dark .bp3-divider{
    border-color:rgba(16, 22, 26, 0.4); }
.bp3-dialog-container{
  opacity:1;
  -webkit-transform:scale(1);
          transform:scale(1);
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-pack:center;
      -ms-flex-pack:center;
          justify-content:center;
  min-height:100%;
  pointer-events:none;
  -webkit-user-select:none;
     -moz-user-select:none;
      -ms-user-select:none;
          user-select:none;
  width:100%; }
  .bp3-dialog-container.bp3-overlay-enter > .bp3-dialog, .bp3-dialog-container.bp3-overlay-appear > .bp3-dialog{
    opacity:0;
    -webkit-transform:scale(0.5);
            transform:scale(0.5); }
  .bp3-dialog-container.bp3-overlay-enter-active > .bp3-dialog, .bp3-dialog-container.bp3-overlay-appear-active > .bp3-dialog{
    opacity:1;
    -webkit-transform:scale(1);
            transform:scale(1);
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:300ms;
            transition-duration:300ms;
    -webkit-transition-property:opacity, -webkit-transform;
    transition-property:opacity, -webkit-transform;
    transition-property:opacity, transform;
    transition-property:opacity, transform, -webkit-transform;
    -webkit-transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11);
            transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11); }
  .bp3-dialog-container.bp3-overlay-exit > .bp3-dialog{
    opacity:1;
    -webkit-transform:scale(1);
            transform:scale(1); }
  .bp3-dialog-container.bp3-overlay-exit-active > .bp3-dialog{
    opacity:0;
    -webkit-transform:scale(0.5);
            transform:scale(0.5);
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:300ms;
            transition-duration:300ms;
    -webkit-transition-property:opacity, -webkit-transform;
    transition-property:opacity, -webkit-transform;
    transition-property:opacity, transform;
    transition-property:opacity, transform, -webkit-transform;
    -webkit-transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11);
            transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11); }

.bp3-dialog{
  background:#ebf1f5;
  border-radius:6px;
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 4px 8px rgba(16, 22, 26, 0.2), 0 18px 46px 6px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 4px 8px rgba(16, 22, 26, 0.2), 0 18px 46px 6px rgba(16, 22, 26, 0.2);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:vertical;
  -webkit-box-direction:normal;
      -ms-flex-direction:column;
          flex-direction:column;
  margin:30px 0;
  padding-bottom:20px;
  pointer-events:all;
  -webkit-user-select:text;
     -moz-user-select:text;
      -ms-user-select:text;
          user-select:text;
  width:500px; }
  .bp3-dialog:focus{
    outline:0; }
  .bp3-dialog.bp3-dark,
  .bp3-dark .bp3-dialog{
    background:#293742;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 4px 8px rgba(16, 22, 26, 0.4), 0 18px 46px 6px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 4px 8px rgba(16, 22, 26, 0.4), 0 18px 46px 6px rgba(16, 22, 26, 0.4);
    color:#f5f8fa; }

.bp3-dialog-header{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  background:#ffffff;
  border-radius:6px 6px 0 0;
  -webkit-box-shadow:0 1px 0 rgba(16, 22, 26, 0.15);
          box-shadow:0 1px 0 rgba(16, 22, 26, 0.15);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-flex:0;
      -ms-flex:0 0 auto;
          flex:0 0 auto;
  min-height:40px;
  padding-left:20px;
  padding-right:5px;
  z-index:30; }
  .bp3-dialog-header .bp3-icon-large,
  .bp3-dialog-header .bp3-icon{
    color:#5c7080;
    -webkit-box-flex:0;
        -ms-flex:0 0 auto;
            flex:0 0 auto;
    margin-right:10px; }
  .bp3-dialog-header .bp3-heading{
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
    word-wrap:normal;
    -webkit-box-flex:1;
        -ms-flex:1 1 auto;
            flex:1 1 auto;
    line-height:inherit;
    margin:0; }
    .bp3-dialog-header .bp3-heading:last-child{
      margin-right:20px; }
  .bp3-dark .bp3-dialog-header{
    background:#30404d;
    -webkit-box-shadow:0 1px 0 rgba(16, 22, 26, 0.4);
            box-shadow:0 1px 0 rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-dialog-header .bp3-icon-large,
    .bp3-dark .bp3-dialog-header .bp3-icon{
      color:#a7b6c2; }

.bp3-dialog-body{
  -webkit-box-flex:1;
      -ms-flex:1 1 auto;
          flex:1 1 auto;
  line-height:18px;
  margin:20px; }

.bp3-dialog-footer{
  -webkit-box-flex:0;
      -ms-flex:0 0 auto;
          flex:0 0 auto;
  margin:0 20px; }

.bp3-dialog-footer-actions{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-pack:end;
      -ms-flex-pack:end;
          justify-content:flex-end; }
  .bp3-dialog-footer-actions .bp3-button{
    margin-left:10px; }
.bp3-multistep-dialog-panels{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex; }

.bp3-multistep-dialog-left-panel{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-flex:1;
      -ms-flex:1;
          flex:1;
  -webkit-box-orient:vertical;
  -webkit-box-direction:normal;
      -ms-flex-direction:column;
          flex-direction:column; }
  .bp3-dark .bp3-multistep-dialog-left-panel{
    background:#202b33; }

.bp3-multistep-dialog-right-panel{
  background-color:#f5f8fa;
  border-left:1px solid rgba(16, 22, 26, 0.15);
  border-radius:0 0 6px 0;
  -webkit-box-flex:3;
      -ms-flex:3;
          flex:3;
  min-width:0; }
  .bp3-dark .bp3-multistep-dialog-right-panel{
    background-color:#293742;
    border-left:1px solid rgba(16, 22, 26, 0.4); }

.bp3-multistep-dialog-footer{
  background-color:#ffffff;
  border-radius:0 0 6px 0;
  border-top:1px solid rgba(16, 22, 26, 0.15);
  padding:10px; }
  .bp3-dark .bp3-multistep-dialog-footer{
    background:#30404d;
    border-top:1px solid rgba(16, 22, 26, 0.4); }

.bp3-dialog-step-container{
  background-color:#f5f8fa;
  border-bottom:1px solid rgba(16, 22, 26, 0.15); }
  .bp3-dark .bp3-dialog-step-container{
    background:#293742;
    border-bottom:1px solid rgba(16, 22, 26, 0.4); }
  .bp3-dialog-step-container.bp3-dialog-step-viewed{
    background-color:#ffffff; }
    .bp3-dark .bp3-dialog-step-container.bp3-dialog-step-viewed{
      background:#30404d; }

.bp3-dialog-step{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  background-color:#f5f8fa;
  border-radius:6px;
  cursor:not-allowed;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  margin:4px;
  padding:6px 14px; }
  .bp3-dark .bp3-dialog-step{
    background:#293742; }
  .bp3-dialog-step-viewed .bp3-dialog-step{
    background-color:#ffffff;
    cursor:pointer; }
    .bp3-dark .bp3-dialog-step-viewed .bp3-dialog-step{
      background:#30404d; }
  .bp3-dialog-step:hover{
    background-color:#f5f8fa; }
    .bp3-dark .bp3-dialog-step:hover{
      background:#293742; }

.bp3-dialog-step-icon{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  background-color:rgba(92, 112, 128, 0.6);
  border-radius:50%;
  color:#ffffff;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  height:25px;
  -webkit-box-pack:center;
      -ms-flex-pack:center;
          justify-content:center;
  width:25px; }
  .bp3-dark .bp3-dialog-step-icon{
    background-color:rgba(167, 182, 194, 0.6); }
  .bp3-active.bp3-dialog-step-viewed .bp3-dialog-step-icon{
    background-color:#2b95d6; }
  .bp3-dialog-step-viewed .bp3-dialog-step-icon{
    background-color:#8a9ba8; }

.bp3-dialog-step-title{
  color:rgba(92, 112, 128, 0.6);
  -webkit-box-flex:1;
      -ms-flex:1;
          flex:1;
  padding-left:10px; }
  .bp3-dark .bp3-dialog-step-title{
    color:rgba(167, 182, 194, 0.6); }
  .bp3-active.bp3-dialog-step-viewed .bp3-dialog-step-title{
    color:#2b95d6; }
  .bp3-dialog-step-viewed:not(.bp3-active) .bp3-dialog-step-title{
    color:#182026; }
    .bp3-dark .bp3-dialog-step-viewed:not(.bp3-active) .bp3-dialog-step-title{
      color:#f5f8fa; }
.bp3-drawer{
  background:#ffffff;
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 4px 8px rgba(16, 22, 26, 0.2), 0 18px 46px 6px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 4px 8px rgba(16, 22, 26, 0.2), 0 18px 46px 6px rgba(16, 22, 26, 0.2);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:vertical;
  -webkit-box-direction:normal;
      -ms-flex-direction:column;
          flex-direction:column;
  margin:0;
  padding:0; }
  .bp3-drawer:focus{
    outline:0; }
  .bp3-drawer.bp3-position-top{
    height:50%;
    left:0;
    right:0;
    top:0; }
    .bp3-drawer.bp3-position-top.bp3-overlay-enter, .bp3-drawer.bp3-position-top.bp3-overlay-appear{
      -webkit-transform:translateY(-100%);
              transform:translateY(-100%); }
    .bp3-drawer.bp3-position-top.bp3-overlay-enter-active, .bp3-drawer.bp3-position-top.bp3-overlay-appear-active{
      -webkit-transform:translateY(0);
              transform:translateY(0);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:200ms;
              transition-duration:200ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
    .bp3-drawer.bp3-position-top.bp3-overlay-exit{
      -webkit-transform:translateY(0);
              transform:translateY(0); }
    .bp3-drawer.bp3-position-top.bp3-overlay-exit-active{
      -webkit-transform:translateY(-100%);
              transform:translateY(-100%);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:100ms;
              transition-duration:100ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-drawer.bp3-position-bottom{
    bottom:0;
    height:50%;
    left:0;
    right:0; }
    .bp3-drawer.bp3-position-bottom.bp3-overlay-enter, .bp3-drawer.bp3-position-bottom.bp3-overlay-appear{
      -webkit-transform:translateY(100%);
              transform:translateY(100%); }
    .bp3-drawer.bp3-position-bottom.bp3-overlay-enter-active, .bp3-drawer.bp3-position-bottom.bp3-overlay-appear-active{
      -webkit-transform:translateY(0);
              transform:translateY(0);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:200ms;
              transition-duration:200ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
    .bp3-drawer.bp3-position-bottom.bp3-overlay-exit{
      -webkit-transform:translateY(0);
              transform:translateY(0); }
    .bp3-drawer.bp3-position-bottom.bp3-overlay-exit-active{
      -webkit-transform:translateY(100%);
              transform:translateY(100%);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:100ms;
              transition-duration:100ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-drawer.bp3-position-left{
    bottom:0;
    left:0;
    top:0;
    width:50%; }
    .bp3-drawer.bp3-position-left.bp3-overlay-enter, .bp3-drawer.bp3-position-left.bp3-overlay-appear{
      -webkit-transform:translateX(-100%);
              transform:translateX(-100%); }
    .bp3-drawer.bp3-position-left.bp3-overlay-enter-active, .bp3-drawer.bp3-position-left.bp3-overlay-appear-active{
      -webkit-transform:translateX(0);
              transform:translateX(0);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:200ms;
              transition-duration:200ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
    .bp3-drawer.bp3-position-left.bp3-overlay-exit{
      -webkit-transform:translateX(0);
              transform:translateX(0); }
    .bp3-drawer.bp3-position-left.bp3-overlay-exit-active{
      -webkit-transform:translateX(-100%);
              transform:translateX(-100%);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:100ms;
              transition-duration:100ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-drawer.bp3-position-right{
    bottom:0;
    right:0;
    top:0;
    width:50%; }
    .bp3-drawer.bp3-position-right.bp3-overlay-enter, .bp3-drawer.bp3-position-right.bp3-overlay-appear{
      -webkit-transform:translateX(100%);
              transform:translateX(100%); }
    .bp3-drawer.bp3-position-right.bp3-overlay-enter-active, .bp3-drawer.bp3-position-right.bp3-overlay-appear-active{
      -webkit-transform:translateX(0);
              transform:translateX(0);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:200ms;
              transition-duration:200ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
    .bp3-drawer.bp3-position-right.bp3-overlay-exit{
      -webkit-transform:translateX(0);
              transform:translateX(0); }
    .bp3-drawer.bp3-position-right.bp3-overlay-exit-active{
      -webkit-transform:translateX(100%);
              transform:translateX(100%);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:100ms;
              transition-duration:100ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
  .bp3-position-right):not(.bp3-vertical){
    bottom:0;
    right:0;
    top:0;
    width:50%; }
    .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right):not(.bp3-vertical).bp3-overlay-enter, .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right):not(.bp3-vertical).bp3-overlay-appear{
      -webkit-transform:translateX(100%);
              transform:translateX(100%); }
    .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right):not(.bp3-vertical).bp3-overlay-enter-active, .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right):not(.bp3-vertical).bp3-overlay-appear-active{
      -webkit-transform:translateX(0);
              transform:translateX(0);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:200ms;
              transition-duration:200ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
    .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right):not(.bp3-vertical).bp3-overlay-exit{
      -webkit-transform:translateX(0);
              transform:translateX(0); }
    .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right):not(.bp3-vertical).bp3-overlay-exit-active{
      -webkit-transform:translateX(100%);
              transform:translateX(100%);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:100ms;
              transition-duration:100ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
  .bp3-position-right).bp3-vertical{
    bottom:0;
    height:50%;
    left:0;
    right:0; }
    .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right).bp3-vertical.bp3-overlay-enter, .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right).bp3-vertical.bp3-overlay-appear{
      -webkit-transform:translateY(100%);
              transform:translateY(100%); }
    .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right).bp3-vertical.bp3-overlay-enter-active, .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right).bp3-vertical.bp3-overlay-appear-active{
      -webkit-transform:translateY(0);
              transform:translateY(0);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:200ms;
              transition-duration:200ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
    .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right).bp3-vertical.bp3-overlay-exit{
      -webkit-transform:translateY(0);
              transform:translateY(0); }
    .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right).bp3-vertical.bp3-overlay-exit-active{
      -webkit-transform:translateY(100%);
              transform:translateY(100%);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:100ms;
              transition-duration:100ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-drawer.bp3-dark,
  .bp3-dark .bp3-drawer{
    background:#30404d;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 4px 8px rgba(16, 22, 26, 0.4), 0 18px 46px 6px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 4px 8px rgba(16, 22, 26, 0.4), 0 18px 46px 6px rgba(16, 22, 26, 0.4);
    color:#f5f8fa; }

.bp3-drawer-header{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  border-radius:0;
  -webkit-box-shadow:0 1px 0 rgba(16, 22, 26, 0.15);
          box-shadow:0 1px 0 rgba(16, 22, 26, 0.15);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-flex:0;
      -ms-flex:0 0 auto;
          flex:0 0 auto;
  min-height:40px;
  padding:5px;
  padding-left:20px;
  position:relative; }
  .bp3-drawer-header .bp3-icon-large,
  .bp3-drawer-header .bp3-icon{
    color:#5c7080;
    -webkit-box-flex:0;
        -ms-flex:0 0 auto;
            flex:0 0 auto;
    margin-right:10px; }
  .bp3-drawer-header .bp3-heading{
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
    word-wrap:normal;
    -webkit-box-flex:1;
        -ms-flex:1 1 auto;
            flex:1 1 auto;
    line-height:inherit;
    margin:0; }
    .bp3-drawer-header .bp3-heading:last-child{
      margin-right:20px; }
  .bp3-dark .bp3-drawer-header{
    -webkit-box-shadow:0 1px 0 rgba(16, 22, 26, 0.4);
            box-shadow:0 1px 0 rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-drawer-header .bp3-icon-large,
    .bp3-dark .bp3-drawer-header .bp3-icon{
      color:#a7b6c2; }

.bp3-drawer-body{
  -webkit-box-flex:1;
      -ms-flex:1 1 auto;
          flex:1 1 auto;
  line-height:18px;
  overflow:auto; }

.bp3-drawer-footer{
  -webkit-box-shadow:inset 0 1px 0 rgba(16, 22, 26, 0.15);
          box-shadow:inset 0 1px 0 rgba(16, 22, 26, 0.15);
  -webkit-box-flex:0;
      -ms-flex:0 0 auto;
          flex:0 0 auto;
  padding:10px 20px;
  position:relative; }
  .bp3-dark .bp3-drawer-footer{
    -webkit-box-shadow:inset 0 1px 0 rgba(16, 22, 26, 0.4);
            box-shadow:inset 0 1px 0 rgba(16, 22, 26, 0.4); }
.bp3-editable-text{
  cursor:text;
  display:inline-block;
  max-width:100%;
  position:relative;
  vertical-align:top;
  white-space:nowrap; }
  .bp3-editable-text::before{
    bottom:-3px;
    left:-3px;
    position:absolute;
    right:-3px;
    top:-3px;
    border-radius:3px;
    content:"";
    -webkit-transition:background-color 100ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
    transition:background-color 100ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
    transition:background-color 100ms cubic-bezier(0.4, 1, 0.75, 0.9), box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
    transition:background-color 100ms cubic-bezier(0.4, 1, 0.75, 0.9), box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-editable-text:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.15);
            box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.15); }
  .bp3-editable-text.bp3-editable-text-editing::before{
    background-color:#ffffff;
    -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
  .bp3-editable-text.bp3-disabled::before{
    -webkit-box-shadow:none;
            box-shadow:none; }
  .bp3-editable-text.bp3-intent-primary .bp3-editable-text-input,
  .bp3-editable-text.bp3-intent-primary .bp3-editable-text-content{
    color:#137cbd; }
  .bp3-editable-text.bp3-intent-primary:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(19, 124, 189, 0.4);
            box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(19, 124, 189, 0.4); }
  .bp3-editable-text.bp3-intent-primary.bp3-editable-text-editing::before{
    -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
  .bp3-editable-text.bp3-intent-success .bp3-editable-text-input,
  .bp3-editable-text.bp3-intent-success .bp3-editable-text-content{
    color:#0f9960; }
  .bp3-editable-text.bp3-intent-success:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), inset 0 0 0 1px rgba(15, 153, 96, 0.4);
            box-shadow:0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), inset 0 0 0 1px rgba(15, 153, 96, 0.4); }
  .bp3-editable-text.bp3-intent-success.bp3-editable-text-editing::before{
    -webkit-box-shadow:0 0 0 1px #0f9960, 0 0 0 3px rgba(15, 153, 96, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px #0f9960, 0 0 0 3px rgba(15, 153, 96, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
  .bp3-editable-text.bp3-intent-warning .bp3-editable-text-input,
  .bp3-editable-text.bp3-intent-warning .bp3-editable-text-content{
    color:#d9822b; }
  .bp3-editable-text.bp3-intent-warning:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), inset 0 0 0 1px rgba(217, 130, 43, 0.4);
            box-shadow:0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), inset 0 0 0 1px rgba(217, 130, 43, 0.4); }
  .bp3-editable-text.bp3-intent-warning.bp3-editable-text-editing::before{
    -webkit-box-shadow:0 0 0 1px #d9822b, 0 0 0 3px rgba(217, 130, 43, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px #d9822b, 0 0 0 3px rgba(217, 130, 43, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
  .bp3-editable-text.bp3-intent-danger .bp3-editable-text-input,
  .bp3-editable-text.bp3-intent-danger .bp3-editable-text-content{
    color:#db3737; }
  .bp3-editable-text.bp3-intent-danger:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), inset 0 0 0 1px rgba(219, 55, 55, 0.4);
            box-shadow:0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), inset 0 0 0 1px rgba(219, 55, 55, 0.4); }
  .bp3-editable-text.bp3-intent-danger.bp3-editable-text-editing::before{
    -webkit-box-shadow:0 0 0 1px #db3737, 0 0 0 3px rgba(219, 55, 55, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px #db3737, 0 0 0 3px rgba(219, 55, 55, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
  .bp3-dark .bp3-editable-text:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(255, 255, 255, 0.15);
            box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(255, 255, 255, 0.15); }
  .bp3-dark .bp3-editable-text.bp3-editable-text-editing::before{
    background-color:rgba(16, 22, 26, 0.3);
    -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-editable-text.bp3-disabled::before{
    -webkit-box-shadow:none;
            box-shadow:none; }
  .bp3-dark .bp3-editable-text.bp3-intent-primary .bp3-editable-text-content{
    color:#48aff0; }
  .bp3-dark .bp3-editable-text.bp3-intent-primary:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(72, 175, 240, 0), 0 0 0 0 rgba(72, 175, 240, 0), inset 0 0 0 1px rgba(72, 175, 240, 0.4);
            box-shadow:0 0 0 0 rgba(72, 175, 240, 0), 0 0 0 0 rgba(72, 175, 240, 0), inset 0 0 0 1px rgba(72, 175, 240, 0.4); }
  .bp3-dark .bp3-editable-text.bp3-intent-primary.bp3-editable-text-editing::before{
    -webkit-box-shadow:0 0 0 1px #48aff0, 0 0 0 3px rgba(72, 175, 240, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px #48aff0, 0 0 0 3px rgba(72, 175, 240, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-editable-text.bp3-intent-success .bp3-editable-text-content{
    color:#3dcc91; }
  .bp3-dark .bp3-editable-text.bp3-intent-success:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(61, 204, 145, 0), 0 0 0 0 rgba(61, 204, 145, 0), inset 0 0 0 1px rgba(61, 204, 145, 0.4);
            box-shadow:0 0 0 0 rgba(61, 204, 145, 0), 0 0 0 0 rgba(61, 204, 145, 0), inset 0 0 0 1px rgba(61, 204, 145, 0.4); }
  .bp3-dark .bp3-editable-text.bp3-intent-success.bp3-editable-text-editing::before{
    -webkit-box-shadow:0 0 0 1px #3dcc91, 0 0 0 3px rgba(61, 204, 145, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px #3dcc91, 0 0 0 3px rgba(61, 204, 145, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-editable-text.bp3-intent-warning .bp3-editable-text-content{
    color:#ffb366; }
  .bp3-dark .bp3-editable-text.bp3-intent-warning:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(255, 179, 102, 0), 0 0 0 0 rgba(255, 179, 102, 0), inset 0 0 0 1px rgba(255, 179, 102, 0.4);
            box-shadow:0 0 0 0 rgba(255, 179, 102, 0), 0 0 0 0 rgba(255, 179, 102, 0), inset 0 0 0 1px rgba(255, 179, 102, 0.4); }
  .bp3-dark .bp3-editable-text.bp3-intent-warning.bp3-editable-text-editing::before{
    -webkit-box-shadow:0 0 0 1px #ffb366, 0 0 0 3px rgba(255, 179, 102, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px #ffb366, 0 0 0 3px rgba(255, 179, 102, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-editable-text.bp3-intent-danger .bp3-editable-text-content{
    color:#ff7373; }
  .bp3-dark .bp3-editable-text.bp3-intent-danger:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(255, 115, 115, 0), 0 0 0 0 rgba(255, 115, 115, 0), inset 0 0 0 1px rgba(255, 115, 115, 0.4);
            box-shadow:0 0 0 0 rgba(255, 115, 115, 0), 0 0 0 0 rgba(255, 115, 115, 0), inset 0 0 0 1px rgba(255, 115, 115, 0.4); }
  .bp3-dark .bp3-editable-text.bp3-intent-danger.bp3-editable-text-editing::before{
    -webkit-box-shadow:0 0 0 1px #ff7373, 0 0 0 3px rgba(255, 115, 115, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px #ff7373, 0 0 0 3px rgba(255, 115, 115, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }

.bp3-editable-text-input,
.bp3-editable-text-content{
  color:inherit;
  display:inherit;
  font:inherit;
  letter-spacing:inherit;
  max-width:inherit;
  min-width:inherit;
  position:relative;
  resize:none;
  text-transform:inherit;
  vertical-align:top; }

.bp3-editable-text-input{
  background:none;
  border:none;
  -webkit-box-shadow:none;
          box-shadow:none;
  padding:0;
  white-space:pre-wrap;
  width:100%; }
  .bp3-editable-text-input::-webkit-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-editable-text-input::-moz-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-editable-text-input:-ms-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-editable-text-input::-ms-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-editable-text-input::placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-editable-text-input:focus{
    outline:none; }
  .bp3-editable-text-input::-ms-clear{
    display:none; }

.bp3-editable-text-content{
  overflow:hidden;
  padding-right:2px;
  text-overflow:ellipsis;
  white-space:pre; }
  .bp3-editable-text-editing > .bp3-editable-text-content{
    left:0;
    position:absolute;
    visibility:hidden; }
  .bp3-editable-text-placeholder > .bp3-editable-text-content{
    color:rgba(92, 112, 128, 0.6); }
    .bp3-dark .bp3-editable-text-placeholder > .bp3-editable-text-content{
      color:rgba(167, 182, 194, 0.6); }

.bp3-editable-text.bp3-multiline{
  display:block; }
  .bp3-editable-text.bp3-multiline .bp3-editable-text-content{
    overflow:auto;
    white-space:pre-wrap;
    word-wrap:break-word; }
.bp3-divider{
  border-bottom:1px solid rgba(16, 22, 26, 0.15);
  border-right:1px solid rgba(16, 22, 26, 0.15);
  margin:5px; }
  .bp3-dark .bp3-divider{
    border-color:rgba(16, 22, 26, 0.4); }
.bp3-control-group{
  -webkit-transform:translateZ(0);
          transform:translateZ(0);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:horizontal;
  -webkit-box-direction:normal;
      -ms-flex-direction:row;
          flex-direction:row;
  -webkit-box-align:stretch;
      -ms-flex-align:stretch;
          align-items:stretch; }
  .bp3-control-group > *{
    -webkit-box-flex:0;
        -ms-flex-positive:0;
            flex-grow:0;
    -ms-flex-negative:0;
        flex-shrink:0; }
  .bp3-control-group > .bp3-fill{
    -webkit-box-flex:1;
        -ms-flex-positive:1;
            flex-grow:1;
    -ms-flex-negative:1;
        flex-shrink:1; }
  .bp3-control-group .bp3-button,
  .bp3-control-group .bp3-html-select,
  .bp3-control-group .bp3-input,
  .bp3-control-group .bp3-select{
    position:relative; }
  .bp3-control-group .bp3-input{
    border-radius:inherit;
    z-index:2; }
    .bp3-control-group .bp3-input:focus{
      border-radius:3px;
      z-index:14; }
    .bp3-control-group .bp3-input[class*="bp3-intent"]{
      z-index:13; }
      .bp3-control-group .bp3-input[class*="bp3-intent"]:focus{
        z-index:15; }
    .bp3-control-group .bp3-input[readonly], .bp3-control-group .bp3-input:disabled, .bp3-control-group .bp3-input.bp3-disabled{
      z-index:1; }
  .bp3-control-group .bp3-input-group[class*="bp3-intent"] .bp3-input{
    z-index:13; }
    .bp3-control-group .bp3-input-group[class*="bp3-intent"] .bp3-input:focus{
      z-index:15; }
  .bp3-control-group .bp3-button,
  .bp3-control-group .bp3-html-select select,
  .bp3-control-group .bp3-select select{
    -webkit-transform:translateZ(0);
            transform:translateZ(0);
    border-radius:inherit;
    z-index:4; }
    .bp3-control-group .bp3-button:focus,
    .bp3-control-group .bp3-html-select select:focus,
    .bp3-control-group .bp3-select select:focus{
      z-index:5; }
    .bp3-control-group .bp3-button:hover,
    .bp3-control-group .bp3-html-select select:hover,
    .bp3-control-group .bp3-select select:hover{
      z-index:6; }
    .bp3-control-group .bp3-button:active,
    .bp3-control-group .bp3-html-select select:active,
    .bp3-control-group .bp3-select select:active{
      z-index:7; }
    .bp3-control-group .bp3-button[readonly], .bp3-control-group .bp3-button:disabled, .bp3-control-group .bp3-button.bp3-disabled,
    .bp3-control-group .bp3-html-select select[readonly],
    .bp3-control-group .bp3-html-select select:disabled,
    .bp3-control-group .bp3-html-select select.bp3-disabled,
    .bp3-control-group .bp3-select select[readonly],
    .bp3-control-group .bp3-select select:disabled,
    .bp3-control-group .bp3-select select.bp3-disabled{
      z-index:3; }
    .bp3-control-group .bp3-button[class*="bp3-intent"],
    .bp3-control-group .bp3-html-select select[class*="bp3-intent"],
    .bp3-control-group .bp3-select select[class*="bp3-intent"]{
      z-index:9; }
      .bp3-control-group .bp3-button[class*="bp3-intent"]:focus,
      .bp3-control-group .bp3-html-select select[class*="bp3-intent"]:focus,
      .bp3-control-group .bp3-select select[class*="bp3-intent"]:focus{
        z-index:10; }
      .bp3-control-group .bp3-button[class*="bp3-intent"]:hover,
      .bp3-control-group .bp3-html-select select[class*="bp3-intent"]:hover,
      .bp3-control-group .bp3-select select[class*="bp3-intent"]:hover{
        z-index:11; }
      .bp3-control-group .bp3-button[class*="bp3-intent"]:active,
      .bp3-control-group .bp3-html-select select[class*="bp3-intent"]:active,
      .bp3-control-group .bp3-select select[class*="bp3-intent"]:active{
        z-index:12; }
      .bp3-control-group .bp3-button[class*="bp3-intent"][readonly], .bp3-control-group .bp3-button[class*="bp3-intent"]:disabled, .bp3-control-group .bp3-button[class*="bp3-intent"].bp3-disabled,
      .bp3-control-group .bp3-html-select select[class*="bp3-intent"][readonly],
      .bp3-control-group .bp3-html-select select[class*="bp3-intent"]:disabled,
      .bp3-control-group .bp3-html-select select[class*="bp3-intent"].bp3-disabled,
      .bp3-control-group .bp3-select select[class*="bp3-intent"][readonly],
      .bp3-control-group .bp3-select select[class*="bp3-intent"]:disabled,
      .bp3-control-group .bp3-select select[class*="bp3-intent"].bp3-disabled{
        z-index:8; }
  .bp3-control-group .bp3-input-group > .bp3-icon,
  .bp3-control-group .bp3-input-group > .bp3-button,
  .bp3-control-group .bp3-input-group > .bp3-input-left-container,
  .bp3-control-group .bp3-input-group > .bp3-input-action{
    z-index:16; }
  .bp3-control-group .bp3-select::after,
  .bp3-control-group .bp3-html-select::after,
  .bp3-control-group .bp3-select > .bp3-icon,
  .bp3-control-group .bp3-html-select > .bp3-icon{
    z-index:17; }
  .bp3-control-group .bp3-select:focus-within{
    z-index:5; }
  .bp3-control-group:not(.bp3-vertical) > *:not(.bp3-divider){
    margin-right:-1px; }
  .bp3-control-group:not(.bp3-vertical) > .bp3-divider:not(:first-child){
    margin-left:6px; }
  .bp3-dark .bp3-control-group:not(.bp3-vertical) > *:not(.bp3-divider){
    margin-right:0; }
  .bp3-dark .bp3-control-group:not(.bp3-vertical) > .bp3-button + .bp3-button{
    margin-left:1px; }
  .bp3-control-group .bp3-popover-wrapper,
  .bp3-control-group .bp3-popover-target{
    border-radius:inherit; }
  .bp3-control-group > :first-child{
    border-radius:3px 0 0 3px; }
  .bp3-control-group > :last-child{
    border-radius:0 3px 3px 0;
    margin-right:0; }
  .bp3-control-group > :only-child{
    border-radius:3px;
    margin-right:0; }
  .bp3-control-group .bp3-input-group .bp3-button{
    border-radius:3px; }
  .bp3-control-group .bp3-numeric-input:not(:first-child) .bp3-input-group{
    border-bottom-left-radius:0;
    border-top-left-radius:0; }
  .bp3-control-group.bp3-fill{
    width:100%; }
  .bp3-control-group > .bp3-fill{
    -webkit-box-flex:1;
        -ms-flex:1 1 auto;
            flex:1 1 auto; }
  .bp3-control-group.bp3-fill > *:not(.bp3-fixed){
    -webkit-box-flex:1;
        -ms-flex:1 1 auto;
            flex:1 1 auto; }
  .bp3-control-group.bp3-vertical{
    -webkit-box-orient:vertical;
    -webkit-box-direction:normal;
        -ms-flex-direction:column;
            flex-direction:column; }
    .bp3-control-group.bp3-vertical > *{
      margin-top:-1px; }
    .bp3-control-group.bp3-vertical > :first-child{
      border-radius:3px 3px 0 0;
      margin-top:0; }
    .bp3-control-group.bp3-vertical > :last-child{
      border-radius:0 0 3px 3px; }
.bp3-control{
  cursor:pointer;
  display:block;
  margin-bottom:10px;
  position:relative;
  text-transform:none; }
  .bp3-control input:checked ~ .bp3-control-indicator{
    background-color:#137cbd;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.1)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0));
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
    color:#ffffff; }
  .bp3-control:hover input:checked ~ .bp3-control-indicator{
    background-color:#106ba3;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2); }
  .bp3-control input:not(:disabled):active:checked ~ .bp3-control-indicator{
    background:#0e5a8a;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
  .bp3-control input:disabled:checked ~ .bp3-control-indicator{
    background:rgba(19, 124, 189, 0.5);
    -webkit-box-shadow:none;
            box-shadow:none; }
  .bp3-dark .bp3-control input:checked ~ .bp3-control-indicator{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-control:hover input:checked ~ .bp3-control-indicator{
    background-color:#106ba3;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-control input:not(:disabled):active:checked ~ .bp3-control-indicator{
    background-color:#0e5a8a;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
  .bp3-dark .bp3-control input:disabled:checked ~ .bp3-control-indicator{
    background:rgba(14, 90, 138, 0.5);
    -webkit-box-shadow:none;
            box-shadow:none; }
  .bp3-control:not(.bp3-align-right){
    padding-left:26px; }
    .bp3-control:not(.bp3-align-right) .bp3-control-indicator{
      margin-left:-26px; }
  .bp3-control.bp3-align-right{
    padding-right:26px; }
    .bp3-control.bp3-align-right .bp3-control-indicator{
      margin-right:-26px; }
  .bp3-control.bp3-disabled{
    color:rgba(92, 112, 128, 0.6);
    cursor:not-allowed; }
  .bp3-control.bp3-inline{
    display:inline-block;
    margin-right:20px; }
  .bp3-control input{
    left:0;
    opacity:0;
    position:absolute;
    top:0;
    z-index:-1; }
  .bp3-control .bp3-control-indicator{
    background-clip:padding-box;
    background-color:#f5f8fa;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.8)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.8), rgba(255, 255, 255, 0));
    border:none;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
    cursor:pointer;
    display:inline-block;
    font-size:16px;
    height:1em;
    margin-right:10px;
    margin-top:-3px;
    position:relative;
    -webkit-user-select:none;
       -moz-user-select:none;
        -ms-user-select:none;
            user-select:none;
    vertical-align:middle;
    width:1em; }
    .bp3-control .bp3-control-indicator::before{
      content:"";
      display:block;
      height:1em;
      width:1em; }
  .bp3-control:hover .bp3-control-indicator{
    background-color:#ebf1f5; }
  .bp3-control input:not(:disabled):active ~ .bp3-control-indicator{
    background:#d8e1e8;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
  .bp3-control input:disabled ~ .bp3-control-indicator{
    background:rgba(206, 217, 224, 0.5);
    -webkit-box-shadow:none;
            box-shadow:none;
    cursor:not-allowed; }
  .bp3-control input:focus ~ .bp3-control-indicator{
    outline:rgba(19, 124, 189, 0.6) auto 2px;
    outline-offset:2px;
    -moz-outline-radius:6px; }
  .bp3-control.bp3-align-right .bp3-control-indicator{
    float:right;
    margin-left:10px;
    margin-top:1px; }
  .bp3-control.bp3-large{
    font-size:16px; }
    .bp3-control.bp3-large:not(.bp3-align-right){
      padding-left:30px; }
      .bp3-control.bp3-large:not(.bp3-align-right) .bp3-control-indicator{
        margin-left:-30px; }
    .bp3-control.bp3-large.bp3-align-right{
      padding-right:30px; }
      .bp3-control.bp3-large.bp3-align-right .bp3-control-indicator{
        margin-right:-30px; }
    .bp3-control.bp3-large .bp3-control-indicator{
      font-size:20px; }
    .bp3-control.bp3-large.bp3-align-right .bp3-control-indicator{
      margin-top:0; }
  .bp3-control.bp3-checkbox input:indeterminate ~ .bp3-control-indicator{
    background-color:#137cbd;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.1)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0));
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
    color:#ffffff; }
  .bp3-control.bp3-checkbox:hover input:indeterminate ~ .bp3-control-indicator{
    background-color:#106ba3;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2); }
  .bp3-control.bp3-checkbox input:not(:disabled):active:indeterminate ~ .bp3-control-indicator{
    background:#0e5a8a;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
  .bp3-control.bp3-checkbox input:disabled:indeterminate ~ .bp3-control-indicator{
    background:rgba(19, 124, 189, 0.5);
    -webkit-box-shadow:none;
            box-shadow:none; }
  .bp3-dark .bp3-control.bp3-checkbox input:indeterminate ~ .bp3-control-indicator{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-control.bp3-checkbox:hover input:indeterminate ~ .bp3-control-indicator{
    background-color:#106ba3;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-control.bp3-checkbox input:not(:disabled):active:indeterminate ~ .bp3-control-indicator{
    background-color:#0e5a8a;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
  .bp3-dark .bp3-control.bp3-checkbox input:disabled:indeterminate ~ .bp3-control-indicator{
    background:rgba(14, 90, 138, 0.5);
    -webkit-box-shadow:none;
            box-shadow:none; }
  .bp3-control.bp3-checkbox .bp3-control-indicator{
    border-radius:3px; }
  .bp3-control.bp3-checkbox input:checked ~ .bp3-control-indicator::before{
    background-image:url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill-rule='evenodd' clip-rule='evenodd' d='M12 5c-.28 0-.53.11-.71.29L7 9.59l-2.29-2.3a1.003 1.003 0 00-1.42 1.42l3 3c.18.18.43.29.71.29s.53-.11.71-.29l5-5A1.003 1.003 0 0012 5z' fill='white'/%3e%3c/svg%3e"); }
  .bp3-control.bp3-checkbox input:indeterminate ~ .bp3-control-indicator::before{
    background-image:url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill-rule='evenodd' clip-rule='evenodd' d='M11 7H5c-.55 0-1 .45-1 1s.45 1 1 1h6c.55 0 1-.45 1-1s-.45-1-1-1z' fill='white'/%3e%3c/svg%3e"); }
  .bp3-control.bp3-radio .bp3-control-indicator{
    border-radius:50%; }
  .bp3-control.bp3-radio input:checked ~ .bp3-control-indicator::before{
    background-image:radial-gradient(#ffffff, #ffffff 28%, transparent 32%); }
  .bp3-control.bp3-radio input:checked:disabled ~ .bp3-control-indicator::before{
    opacity:0.5; }
  .bp3-control.bp3-radio input:focus ~ .bp3-control-indicator{
    -moz-outline-radius:16px; }
  .bp3-control.bp3-switch input ~ .bp3-control-indicator{
    background:rgba(167, 182, 194, 0.5); }
  .bp3-control.bp3-switch:hover input ~ .bp3-control-indicator{
    background:rgba(115, 134, 148, 0.5); }
  .bp3-control.bp3-switch input:not(:disabled):active ~ .bp3-control-indicator{
    background:rgba(92, 112, 128, 0.5); }
  .bp3-control.bp3-switch input:disabled ~ .bp3-control-indicator{
    background:rgba(206, 217, 224, 0.5); }
    .bp3-control.bp3-switch input:disabled ~ .bp3-control-indicator::before{
      background:rgba(255, 255, 255, 0.8); }
  .bp3-control.bp3-switch input:checked ~ .bp3-control-indicator{
    background:#137cbd; }
  .bp3-control.bp3-switch:hover input:checked ~ .bp3-control-indicator{
    background:#106ba3; }
  .bp3-control.bp3-switch input:checked:not(:disabled):active ~ .bp3-control-indicator{
    background:#0e5a8a; }
  .bp3-control.bp3-switch input:checked:disabled ~ .bp3-control-indicator{
    background:rgba(19, 124, 189, 0.5); }
    .bp3-control.bp3-switch input:checked:disabled ~ .bp3-control-indicator::before{
      background:rgba(255, 255, 255, 0.8); }
  .bp3-control.bp3-switch:not(.bp3-align-right){
    padding-left:38px; }
    .bp3-control.bp3-switch:not(.bp3-align-right) .bp3-control-indicator{
      margin-left:-38px; }
  .bp3-control.bp3-switch.bp3-align-right{
    padding-right:38px; }
    .bp3-control.bp3-switch.bp3-align-right .bp3-control-indicator{
      margin-right:-38px; }
  .bp3-control.bp3-switch .bp3-control-indicator{
    border:none;
    border-radius:1.75em;
    -webkit-box-shadow:none !important;
            box-shadow:none !important;
    min-width:1.75em;
    -webkit-transition:background-color 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
    transition:background-color 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
    width:auto; }
    .bp3-control.bp3-switch .bp3-control-indicator::before{
      background:#ffffff;
      border-radius:50%;
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 1px 1px rgba(16, 22, 26, 0.2);
      height:calc(1em - 4px);
      left:0;
      margin:2px;
      position:absolute;
      -webkit-transition:left 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
      transition:left 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
      width:calc(1em - 4px); }
  .bp3-control.bp3-switch input:checked ~ .bp3-control-indicator::before{
    left:calc(100% - 1em); }
  .bp3-control.bp3-switch.bp3-large:not(.bp3-align-right){
    padding-left:45px; }
    .bp3-control.bp3-switch.bp3-large:not(.bp3-align-right) .bp3-control-indicator{
      margin-left:-45px; }
  .bp3-control.bp3-switch.bp3-large.bp3-align-right{
    padding-right:45px; }
    .bp3-control.bp3-switch.bp3-large.bp3-align-right .bp3-control-indicator{
      margin-right:-45px; }
  .bp3-dark .bp3-control.bp3-switch input ~ .bp3-control-indicator{
    background:rgba(16, 22, 26, 0.5); }
  .bp3-dark .bp3-control.bp3-switch:hover input ~ .bp3-control-indicator{
    background:rgba(16, 22, 26, 0.7); }
  .bp3-dark .bp3-control.bp3-switch input:not(:disabled):active ~ .bp3-control-indicator{
    background:rgba(16, 22, 26, 0.9); }
  .bp3-dark .bp3-control.bp3-switch input:disabled ~ .bp3-control-indicator{
    background:rgba(57, 75, 89, 0.5); }
    .bp3-dark .bp3-control.bp3-switch input:disabled ~ .bp3-control-indicator::before{
      background:rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-control.bp3-switch input:checked ~ .bp3-control-indicator{
    background:#137cbd; }
  .bp3-dark .bp3-control.bp3-switch:hover input:checked ~ .bp3-control-indicator{
    background:#106ba3; }
  .bp3-dark .bp3-control.bp3-switch input:checked:not(:disabled):active ~ .bp3-control-indicator{
    background:#0e5a8a; }
  .bp3-dark .bp3-control.bp3-switch input:checked:disabled ~ .bp3-control-indicator{
    background:rgba(14, 90, 138, 0.5); }
    .bp3-dark .bp3-control.bp3-switch input:checked:disabled ~ .bp3-control-indicator::before{
      background:rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-control.bp3-switch .bp3-control-indicator::before{
    background:#394b59;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-control.bp3-switch input:checked ~ .bp3-control-indicator::before{
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4); }
  .bp3-control.bp3-switch .bp3-switch-inner-text{
    font-size:0.7em;
    text-align:center; }
  .bp3-control.bp3-switch .bp3-control-indicator-child:first-child{
    line-height:0;
    margin-left:0.5em;
    margin-right:1.2em;
    visibility:hidden; }
  .bp3-control.bp3-switch .bp3-control-indicator-child:last-child{
    line-height:1em;
    margin-left:1.2em;
    margin-right:0.5em;
    visibility:visible; }
  .bp3-control.bp3-switch input:checked ~ .bp3-control-indicator .bp3-control-indicator-child:first-child{
    line-height:1em;
    visibility:visible; }
  .bp3-control.bp3-switch input:checked ~ .bp3-control-indicator .bp3-control-indicator-child:last-child{
    line-height:0;
    visibility:hidden; }
  .bp3-dark .bp3-control{
    color:#f5f8fa; }
    .bp3-dark .bp3-control.bp3-disabled{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-control .bp3-control-indicator{
      background-color:#394b59;
      background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.05)), to(rgba(255, 255, 255, 0)));
      background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.05), rgba(255, 255, 255, 0));
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-control:hover .bp3-control-indicator{
      background-color:#30404d; }
    .bp3-dark .bp3-control input:not(:disabled):active ~ .bp3-control-indicator{
      background:#202b33;
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-dark .bp3-control input:disabled ~ .bp3-control-indicator{
      background:rgba(57, 75, 89, 0.5);
      -webkit-box-shadow:none;
              box-shadow:none;
      cursor:not-allowed; }
    .bp3-dark .bp3-control.bp3-checkbox input:disabled:checked ~ .bp3-control-indicator, .bp3-dark .bp3-control.bp3-checkbox input:disabled:indeterminate ~ .bp3-control-indicator{
      color:rgba(167, 182, 194, 0.6); }
.bp3-file-input{
  cursor:pointer;
  display:inline-block;
  height:30px;
  position:relative; }
  .bp3-file-input input{
    margin:0;
    min-width:200px;
    opacity:0; }
    .bp3-file-input input:disabled + .bp3-file-upload-input,
    .bp3-file-input input.bp3-disabled + .bp3-file-upload-input{
      background:rgba(206, 217, 224, 0.5);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(92, 112, 128, 0.6);
      cursor:not-allowed;
      resize:none; }
      .bp3-file-input input:disabled + .bp3-file-upload-input::after,
      .bp3-file-input input.bp3-disabled + .bp3-file-upload-input::after{
        background-color:rgba(206, 217, 224, 0.5);
        background-image:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:rgba(92, 112, 128, 0.6);
        cursor:not-allowed;
        outline:none; }
        .bp3-file-input input:disabled + .bp3-file-upload-input::after.bp3-active, .bp3-file-input input:disabled + .bp3-file-upload-input::after.bp3-active:hover,
        .bp3-file-input input.bp3-disabled + .bp3-file-upload-input::after.bp3-active,
        .bp3-file-input input.bp3-disabled + .bp3-file-upload-input::after.bp3-active:hover{
          background:rgba(206, 217, 224, 0.7); }
      .bp3-dark .bp3-file-input input:disabled + .bp3-file-upload-input, .bp3-dark
      .bp3-file-input input.bp3-disabled + .bp3-file-upload-input{
        background:rgba(57, 75, 89, 0.5);
        -webkit-box-shadow:none;
                box-shadow:none;
        color:rgba(167, 182, 194, 0.6); }
        .bp3-dark .bp3-file-input input:disabled + .bp3-file-upload-input::after, .bp3-dark
        .bp3-file-input input.bp3-disabled + .bp3-file-upload-input::after{
          background-color:rgba(57, 75, 89, 0.5);
          background-image:none;
          -webkit-box-shadow:none;
                  box-shadow:none;
          color:rgba(167, 182, 194, 0.6); }
          .bp3-dark .bp3-file-input input:disabled + .bp3-file-upload-input::after.bp3-active, .bp3-dark
          .bp3-file-input input.bp3-disabled + .bp3-file-upload-input::after.bp3-active{
            background:rgba(57, 75, 89, 0.7); }
  .bp3-file-input.bp3-file-input-has-selection .bp3-file-upload-input{
    color:#182026; }
  .bp3-dark .bp3-file-input.bp3-file-input-has-selection .bp3-file-upload-input{
    color:#f5f8fa; }
  .bp3-file-input.bp3-fill{
    width:100%; }
  .bp3-file-input.bp3-large,
  .bp3-large .bp3-file-input{
    height:40px; }
  .bp3-file-input .bp3-file-upload-input-custom-text::after{
    content:attr(bp3-button-text); }

.bp3-file-upload-input{
  -webkit-appearance:none;
     -moz-appearance:none;
          appearance:none;
  background:#ffffff;
  border:none;
  border-radius:3px;
  -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
  color:#182026;
  font-size:14px;
  font-weight:400;
  height:30px;
  line-height:30px;
  outline:none;
  padding:0 10px;
  -webkit-transition:-webkit-box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:-webkit-box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
  vertical-align:middle;
  overflow:hidden;
  text-overflow:ellipsis;
  white-space:nowrap;
  word-wrap:normal;
  color:rgba(92, 112, 128, 0.6);
  left:0;
  padding-right:80px;
  position:absolute;
  right:0;
  top:0;
  -webkit-user-select:none;
     -moz-user-select:none;
      -ms-user-select:none;
          user-select:none; }
  .bp3-file-upload-input::-webkit-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-file-upload-input::-moz-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-file-upload-input:-ms-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-file-upload-input::-ms-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-file-upload-input::placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-file-upload-input:focus, .bp3-file-upload-input.bp3-active{
    -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
  .bp3-file-upload-input[type="search"], .bp3-file-upload-input.bp3-round{
    border-radius:30px;
    -webkit-box-sizing:border-box;
            box-sizing:border-box;
    padding-left:10px; }
  .bp3-file-upload-input[readonly]{
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.15);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.15); }
  .bp3-file-upload-input:disabled, .bp3-file-upload-input.bp3-disabled{
    background:rgba(206, 217, 224, 0.5);
    -webkit-box-shadow:none;
            box-shadow:none;
    color:rgba(92, 112, 128, 0.6);
    cursor:not-allowed;
    resize:none; }
  .bp3-file-upload-input::after{
    background-color:#f5f8fa;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.8)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.8), rgba(255, 255, 255, 0));
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
    color:#182026;
    min-height:24px;
    min-width:24px;
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
    word-wrap:normal;
    border-radius:3px;
    content:"Browse";
    line-height:24px;
    margin:3px;
    position:absolute;
    right:0;
    text-align:center;
    top:0;
    width:70px; }
    .bp3-file-upload-input::after:hover{
      background-clip:padding-box;
      background-color:#ebf1f5;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1); }
    .bp3-file-upload-input::after:active, .bp3-file-upload-input::after.bp3-active{
      background-color:#d8e1e8;
      background-image:none;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-file-upload-input::after:disabled, .bp3-file-upload-input::after.bp3-disabled{
      background-color:rgba(206, 217, 224, 0.5);
      background-image:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(92, 112, 128, 0.6);
      cursor:not-allowed;
      outline:none; }
      .bp3-file-upload-input::after:disabled.bp3-active, .bp3-file-upload-input::after:disabled.bp3-active:hover, .bp3-file-upload-input::after.bp3-disabled.bp3-active, .bp3-file-upload-input::after.bp3-disabled.bp3-active:hover{
        background:rgba(206, 217, 224, 0.7); }
  .bp3-file-upload-input:hover::after{
    background-clip:padding-box;
    background-color:#ebf1f5;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1); }
  .bp3-file-upload-input:active::after{
    background-color:#d8e1e8;
    background-image:none;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
  .bp3-large .bp3-file-upload-input{
    font-size:16px;
    height:40px;
    line-height:40px;
    padding-right:95px; }
    .bp3-large .bp3-file-upload-input[type="search"], .bp3-large .bp3-file-upload-input.bp3-round{
      padding:0 15px; }
    .bp3-large .bp3-file-upload-input::after{
      min-height:30px;
      min-width:30px;
      line-height:30px;
      margin:5px;
      width:85px; }
  .bp3-dark .bp3-file-upload-input{
    background:rgba(16, 22, 26, 0.3);
    -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
    color:#f5f8fa;
    color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-file-upload-input::-webkit-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-file-upload-input::-moz-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-file-upload-input:-ms-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-file-upload-input::-ms-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-file-upload-input::placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-file-upload-input:focus{
      -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-file-upload-input[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-file-upload-input:disabled, .bp3-dark .bp3-file-upload-input.bp3-disabled{
      background:rgba(57, 75, 89, 0.5);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-file-upload-input::after{
      background-color:#394b59;
      background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.05)), to(rgba(255, 255, 255, 0)));
      background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.05), rgba(255, 255, 255, 0));
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
      color:#f5f8fa; }
      .bp3-dark .bp3-file-upload-input::after:hover, .bp3-dark .bp3-file-upload-input::after:active, .bp3-dark .bp3-file-upload-input::after.bp3-active{
        color:#f5f8fa; }
      .bp3-dark .bp3-file-upload-input::after:hover{
        background-color:#30404d;
        -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
                box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
      .bp3-dark .bp3-file-upload-input::after:active, .bp3-dark .bp3-file-upload-input::after.bp3-active{
        background-color:#202b33;
        background-image:none;
        -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2);
                box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
      .bp3-dark .bp3-file-upload-input::after:disabled, .bp3-dark .bp3-file-upload-input::after.bp3-disabled{
        background-color:rgba(57, 75, 89, 0.5);
        background-image:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:rgba(167, 182, 194, 0.6); }
        .bp3-dark .bp3-file-upload-input::after:disabled.bp3-active, .bp3-dark .bp3-file-upload-input::after.bp3-disabled.bp3-active{
          background:rgba(57, 75, 89, 0.7); }
      .bp3-dark .bp3-file-upload-input::after .bp3-button-spinner .bp3-spinner-head{
        background:rgba(16, 22, 26, 0.5);
        stroke:#8a9ba8; }
    .bp3-dark .bp3-file-upload-input:hover::after{
      background-color:#30404d;
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-file-upload-input:active::after{
      background-color:#202b33;
      background-image:none;
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
.bp3-file-upload-input::after{
  -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
          box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1); }
.bp3-form-group{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:vertical;
  -webkit-box-direction:normal;
      -ms-flex-direction:column;
          flex-direction:column;
  margin:0 0 15px; }
  .bp3-form-group label.bp3-label{
    margin-bottom:5px; }
  .bp3-form-group .bp3-control{
    margin-top:7px; }
  .bp3-form-group .bp3-form-helper-text{
    color:#5c7080;
    font-size:12px;
    margin-top:5px; }
  .bp3-form-group.bp3-intent-primary .bp3-form-helper-text{
    color:#106ba3; }
  .bp3-form-group.bp3-intent-success .bp3-form-helper-text{
    color:#0d8050; }
  .bp3-form-group.bp3-intent-warning .bp3-form-helper-text{
    color:#bf7326; }
  .bp3-form-group.bp3-intent-danger .bp3-form-helper-text{
    color:#c23030; }
  .bp3-form-group.bp3-inline{
    -webkit-box-align:start;
        -ms-flex-align:start;
            align-items:flex-start;
    -webkit-box-orient:horizontal;
    -webkit-box-direction:normal;
        -ms-flex-direction:row;
            flex-direction:row; }
    .bp3-form-group.bp3-inline.bp3-large label.bp3-label{
      line-height:40px;
      margin:0 10px 0 0; }
    .bp3-form-group.bp3-inline label.bp3-label{
      line-height:30px;
      margin:0 10px 0 0; }
  .bp3-form-group.bp3-disabled .bp3-label,
  .bp3-form-group.bp3-disabled .bp3-text-muted,
  .bp3-form-group.bp3-disabled .bp3-form-helper-text{
    color:rgba(92, 112, 128, 0.6) !important; }
  .bp3-dark .bp3-form-group.bp3-intent-primary .bp3-form-helper-text{
    color:#48aff0; }
  .bp3-dark .bp3-form-group.bp3-intent-success .bp3-form-helper-text{
    color:#3dcc91; }
  .bp3-dark .bp3-form-group.bp3-intent-warning .bp3-form-helper-text{
    color:#ffb366; }
  .bp3-dark .bp3-form-group.bp3-intent-danger .bp3-form-helper-text{
    color:#ff7373; }
  .bp3-dark .bp3-form-group .bp3-form-helper-text{
    color:#a7b6c2; }
  .bp3-dark .bp3-form-group.bp3-disabled .bp3-label,
  .bp3-dark .bp3-form-group.bp3-disabled .bp3-text-muted,
  .bp3-dark .bp3-form-group.bp3-disabled .bp3-form-helper-text{
    color:rgba(167, 182, 194, 0.6) !important; }
.bp3-input-group{
  display:block;
  position:relative; }
  .bp3-input-group .bp3-input{
    position:relative;
    width:100%; }
    .bp3-input-group .bp3-input:not(:first-child){
      padding-left:30px; }
    .bp3-input-group .bp3-input:not(:last-child){
      padding-right:30px; }
  .bp3-input-group .bp3-input-action,
  .bp3-input-group > .bp3-input-left-container,
  .bp3-input-group > .bp3-button,
  .bp3-input-group > .bp3-icon{
    position:absolute;
    top:0; }
    .bp3-input-group .bp3-input-action:first-child,
    .bp3-input-group > .bp3-input-left-container:first-child,
    .bp3-input-group > .bp3-button:first-child,
    .bp3-input-group > .bp3-icon:first-child{
      left:0; }
    .bp3-input-group .bp3-input-action:last-child,
    .bp3-input-group > .bp3-input-left-container:last-child,
    .bp3-input-group > .bp3-button:last-child,
    .bp3-input-group > .bp3-icon:last-child{
      right:0; }
  .bp3-input-group .bp3-button{
    min-height:24px;
    min-width:24px;
    margin:3px;
    padding:0 7px; }
    .bp3-input-group .bp3-button:empty{
      padding:0; }
  .bp3-input-group > .bp3-input-left-container,
  .bp3-input-group > .bp3-icon{
    z-index:1; }
  .bp3-input-group > .bp3-input-left-container > .bp3-icon,
  .bp3-input-group > .bp3-icon{
    color:#5c7080; }
    .bp3-input-group > .bp3-input-left-container > .bp3-icon:empty,
    .bp3-input-group > .bp3-icon:empty{
      font-family:"Icons16", sans-serif;
      font-size:16px;
      font-style:normal;
      font-weight:400;
      line-height:1;
      -moz-osx-font-smoothing:grayscale;
      -webkit-font-smoothing:antialiased; }
  .bp3-input-group > .bp3-input-left-container > .bp3-icon,
  .bp3-input-group > .bp3-icon,
  .bp3-input-group .bp3-input-action > .bp3-spinner{
    margin:7px; }
  .bp3-input-group .bp3-tag{
    margin:5px; }
  .bp3-input-group .bp3-input:not(:focus) + .bp3-button.bp3-minimal:not(:hover):not(:focus),
  .bp3-input-group .bp3-input:not(:focus) + .bp3-input-action .bp3-button.bp3-minimal:not(:hover):not(:focus){
    color:#5c7080; }
    .bp3-dark .bp3-input-group .bp3-input:not(:focus) + .bp3-button.bp3-minimal:not(:hover):not(:focus), .bp3-dark
    .bp3-input-group .bp3-input:not(:focus) + .bp3-input-action .bp3-button.bp3-minimal:not(:hover):not(:focus){
      color:#a7b6c2; }
    .bp3-input-group .bp3-input:not(:focus) + .bp3-button.bp3-minimal:not(:hover):not(:focus) .bp3-icon, .bp3-input-group .bp3-input:not(:focus) + .bp3-button.bp3-minimal:not(:hover):not(:focus) .bp3-icon-standard, .bp3-input-group .bp3-input:not(:focus) + .bp3-button.bp3-minimal:not(:hover):not(:focus) .bp3-icon-large,
    .bp3-input-group .bp3-input:not(:focus) + .bp3-input-action .bp3-button.bp3-minimal:not(:hover):not(:focus) .bp3-icon,
    .bp3-input-group .bp3-input:not(:focus) + .bp3-input-action .bp3-button.bp3-minimal:not(:hover):not(:focus) .bp3-icon-standard,
    .bp3-input-group .bp3-input:not(:focus) + .bp3-input-action .bp3-button.bp3-minimal:not(:hover):not(:focus) .bp3-icon-large{
      color:#5c7080; }
  .bp3-input-group .bp3-input:not(:focus) + .bp3-button.bp3-minimal:disabled,
  .bp3-input-group .bp3-input:not(:focus) + .bp3-input-action .bp3-button.bp3-minimal:disabled{
    color:rgba(92, 112, 128, 0.6) !important; }
    .bp3-input-group .bp3-input:not(:focus) + .bp3-button.bp3-minimal:disabled .bp3-icon, .bp3-input-group .bp3-input:not(:focus) + .bp3-button.bp3-minimal:disabled .bp3-icon-standard, .bp3-input-group .bp3-input:not(:focus) + .bp3-button.bp3-minimal:disabled .bp3-icon-large,
    .bp3-input-group .bp3-input:not(:focus) + .bp3-input-action .bp3-button.bp3-minimal:disabled .bp3-icon,
    .bp3-input-group .bp3-input:not(:focus) + .bp3-input-action .bp3-button.bp3-minimal:disabled .bp3-icon-standard,
    .bp3-input-group .bp3-input:not(:focus) + .bp3-input-action .bp3-button.bp3-minimal:disabled .bp3-icon-large{
      color:rgba(92, 112, 128, 0.6) !important; }
  .bp3-input-group.bp3-disabled{
    cursor:not-allowed; }
    .bp3-input-group.bp3-disabled .bp3-icon{
      color:rgba(92, 112, 128, 0.6); }
  .bp3-input-group.bp3-large .bp3-button{
    min-height:30px;
    min-width:30px;
    margin:5px; }
  .bp3-input-group.bp3-large > .bp3-input-left-container > .bp3-icon,
  .bp3-input-group.bp3-large > .bp3-icon,
  .bp3-input-group.bp3-large .bp3-input-action > .bp3-spinner{
    margin:12px; }
  .bp3-input-group.bp3-large .bp3-input{
    font-size:16px;
    height:40px;
    line-height:40px; }
    .bp3-input-group.bp3-large .bp3-input[type="search"], .bp3-input-group.bp3-large .bp3-input.bp3-round{
      padding:0 15px; }
    .bp3-input-group.bp3-large .bp3-input:not(:first-child){
      padding-left:40px; }
    .bp3-input-group.bp3-large .bp3-input:not(:last-child){
      padding-right:40px; }
  .bp3-input-group.bp3-small .bp3-button{
    min-height:20px;
    min-width:20px;
    margin:2px; }
  .bp3-input-group.bp3-small .bp3-tag{
    min-height:20px;
    min-width:20px;
    margin:2px; }
  .bp3-input-group.bp3-small > .bp3-input-left-container > .bp3-icon,
  .bp3-input-group.bp3-small > .bp3-icon,
  .bp3-input-group.bp3-small .bp3-input-action > .bp3-spinner{
    margin:4px; }
  .bp3-input-group.bp3-small .bp3-input{
    font-size:12px;
    height:24px;
    line-height:24px;
    padding-left:8px;
    padding-right:8px; }
    .bp3-input-group.bp3-small .bp3-input[type="search"], .bp3-input-group.bp3-small .bp3-input.bp3-round{
      padding:0 12px; }
    .bp3-input-group.bp3-small .bp3-input:not(:first-child){
      padding-left:24px; }
    .bp3-input-group.bp3-small .bp3-input:not(:last-child){
      padding-right:24px; }
  .bp3-input-group.bp3-fill{
    -webkit-box-flex:1;
        -ms-flex:1 1 auto;
            flex:1 1 auto;
    width:100%; }
  .bp3-input-group.bp3-round .bp3-button,
  .bp3-input-group.bp3-round .bp3-input,
  .bp3-input-group.bp3-round .bp3-tag{
    border-radius:30px; }
  .bp3-dark .bp3-input-group .bp3-icon{
    color:#a7b6c2; }
  .bp3-dark .bp3-input-group.bp3-disabled .bp3-icon{
    color:rgba(167, 182, 194, 0.6); }
  .bp3-input-group.bp3-intent-primary .bp3-input{
    -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px #137cbd, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px #137cbd, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input-group.bp3-intent-primary .bp3-input:focus{
      -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input-group.bp3-intent-primary .bp3-input[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px #137cbd;
              box-shadow:inset 0 0 0 1px #137cbd; }
    .bp3-input-group.bp3-intent-primary .bp3-input:disabled, .bp3-input-group.bp3-intent-primary .bp3-input.bp3-disabled{
      -webkit-box-shadow:none;
              box-shadow:none; }
  .bp3-input-group.bp3-intent-primary > .bp3-icon{
    color:#106ba3; }
    .bp3-dark .bp3-input-group.bp3-intent-primary > .bp3-icon{
      color:#48aff0; }
  .bp3-input-group.bp3-intent-success .bp3-input{
    -webkit-box-shadow:0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), inset 0 0 0 1px #0f9960, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), inset 0 0 0 1px #0f9960, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input-group.bp3-intent-success .bp3-input:focus{
      -webkit-box-shadow:0 0 0 1px #0f9960, 0 0 0 3px rgba(15, 153, 96, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #0f9960, 0 0 0 3px rgba(15, 153, 96, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input-group.bp3-intent-success .bp3-input[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px #0f9960;
              box-shadow:inset 0 0 0 1px #0f9960; }
    .bp3-input-group.bp3-intent-success .bp3-input:disabled, .bp3-input-group.bp3-intent-success .bp3-input.bp3-disabled{
      -webkit-box-shadow:none;
              box-shadow:none; }
  .bp3-input-group.bp3-intent-success > .bp3-icon{
    color:#0d8050; }
    .bp3-dark .bp3-input-group.bp3-intent-success > .bp3-icon{
      color:#3dcc91; }
  .bp3-input-group.bp3-intent-warning .bp3-input{
    -webkit-box-shadow:0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), inset 0 0 0 1px #d9822b, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), inset 0 0 0 1px #d9822b, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input-group.bp3-intent-warning .bp3-input:focus{
      -webkit-box-shadow:0 0 0 1px #d9822b, 0 0 0 3px rgba(217, 130, 43, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #d9822b, 0 0 0 3px rgba(217, 130, 43, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input-group.bp3-intent-warning .bp3-input[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px #d9822b;
              box-shadow:inset 0 0 0 1px #d9822b; }
    .bp3-input-group.bp3-intent-warning .bp3-input:disabled, .bp3-input-group.bp3-intent-warning .bp3-input.bp3-disabled{
      -webkit-box-shadow:none;
              box-shadow:none; }
  .bp3-input-group.bp3-intent-warning > .bp3-icon{
    color:#bf7326; }
    .bp3-dark .bp3-input-group.bp3-intent-warning > .bp3-icon{
      color:#ffb366; }
  .bp3-input-group.bp3-intent-danger .bp3-input{
    -webkit-box-shadow:0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), inset 0 0 0 1px #db3737, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), inset 0 0 0 1px #db3737, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input-group.bp3-intent-danger .bp3-input:focus{
      -webkit-box-shadow:0 0 0 1px #db3737, 0 0 0 3px rgba(219, 55, 55, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #db3737, 0 0 0 3px rgba(219, 55, 55, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input-group.bp3-intent-danger .bp3-input[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px #db3737;
              box-shadow:inset 0 0 0 1px #db3737; }
    .bp3-input-group.bp3-intent-danger .bp3-input:disabled, .bp3-input-group.bp3-intent-danger .bp3-input.bp3-disabled{
      -webkit-box-shadow:none;
              box-shadow:none; }
  .bp3-input-group.bp3-intent-danger > .bp3-icon{
    color:#c23030; }
    .bp3-dark .bp3-input-group.bp3-intent-danger > .bp3-icon{
      color:#ff7373; }
.bp3-input{
  -webkit-appearance:none;
     -moz-appearance:none;
          appearance:none;
  background:#ffffff;
  border:none;
  border-radius:3px;
  -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
  color:#182026;
  font-size:14px;
  font-weight:400;
  height:30px;
  line-height:30px;
  outline:none;
  padding:0 10px;
  -webkit-transition:-webkit-box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:-webkit-box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
  vertical-align:middle; }
  .bp3-input::-webkit-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input::-moz-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input:-ms-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input::-ms-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input::placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input:focus, .bp3-input.bp3-active{
    -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
  .bp3-input[type="search"], .bp3-input.bp3-round{
    border-radius:30px;
    -webkit-box-sizing:border-box;
            box-sizing:border-box;
    padding-left:10px; }
  .bp3-input[readonly]{
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.15);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.15); }
  .bp3-input:disabled, .bp3-input.bp3-disabled{
    background:rgba(206, 217, 224, 0.5);
    -webkit-box-shadow:none;
            box-shadow:none;
    color:rgba(92, 112, 128, 0.6);
    cursor:not-allowed;
    resize:none; }
  .bp3-input.bp3-large{
    font-size:16px;
    height:40px;
    line-height:40px; }
    .bp3-input.bp3-large[type="search"], .bp3-input.bp3-large.bp3-round{
      padding:0 15px; }
  .bp3-input.bp3-small{
    font-size:12px;
    height:24px;
    line-height:24px;
    padding-left:8px;
    padding-right:8px; }
    .bp3-input.bp3-small[type="search"], .bp3-input.bp3-small.bp3-round{
      padding:0 12px; }
  .bp3-input.bp3-fill{
    -webkit-box-flex:1;
        -ms-flex:1 1 auto;
            flex:1 1 auto;
    width:100%; }
  .bp3-dark .bp3-input{
    background:rgba(16, 22, 26, 0.3);
    -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
    color:#f5f8fa; }
    .bp3-dark .bp3-input::-webkit-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-input::-moz-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-input:-ms-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-input::-ms-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-input::placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-input:focus{
      -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-input[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-input:disabled, .bp3-dark .bp3-input.bp3-disabled{
      background:rgba(57, 75, 89, 0.5);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(167, 182, 194, 0.6); }
  .bp3-input.bp3-intent-primary{
    -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px #137cbd, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px #137cbd, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input.bp3-intent-primary:focus{
      -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input.bp3-intent-primary[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px #137cbd;
              box-shadow:inset 0 0 0 1px #137cbd; }
    .bp3-input.bp3-intent-primary:disabled, .bp3-input.bp3-intent-primary.bp3-disabled{
      -webkit-box-shadow:none;
              box-shadow:none; }
    .bp3-dark .bp3-input.bp3-intent-primary{
      -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px #137cbd, inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px #137cbd, inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
      .bp3-dark .bp3-input.bp3-intent-primary:focus{
        -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
                box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
      .bp3-dark .bp3-input.bp3-intent-primary[readonly]{
        -webkit-box-shadow:inset 0 0 0 1px #137cbd;
                box-shadow:inset 0 0 0 1px #137cbd; }
      .bp3-dark .bp3-input.bp3-intent-primary:disabled, .bp3-dark .bp3-input.bp3-intent-primary.bp3-disabled{
        -webkit-box-shadow:none;
                box-shadow:none; }
  .bp3-input.bp3-intent-success{
    -webkit-box-shadow:0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), inset 0 0 0 1px #0f9960, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), inset 0 0 0 1px #0f9960, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input.bp3-intent-success:focus{
      -webkit-box-shadow:0 0 0 1px #0f9960, 0 0 0 3px rgba(15, 153, 96, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #0f9960, 0 0 0 3px rgba(15, 153, 96, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input.bp3-intent-success[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px #0f9960;
              box-shadow:inset 0 0 0 1px #0f9960; }
    .bp3-input.bp3-intent-success:disabled, .bp3-input.bp3-intent-success.bp3-disabled{
      -webkit-box-shadow:none;
              box-shadow:none; }
    .bp3-dark .bp3-input.bp3-intent-success{
      -webkit-box-shadow:0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), inset 0 0 0 1px #0f9960, inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), inset 0 0 0 1px #0f9960, inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
      .bp3-dark .bp3-input.bp3-intent-success:focus{
        -webkit-box-shadow:0 0 0 1px #0f9960, 0 0 0 1px #0f9960, 0 0 0 3px rgba(15, 153, 96, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
                box-shadow:0 0 0 1px #0f9960, 0 0 0 1px #0f9960, 0 0 0 3px rgba(15, 153, 96, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
      .bp3-dark .bp3-input.bp3-intent-success[readonly]{
        -webkit-box-shadow:inset 0 0 0 1px #0f9960;
                box-shadow:inset 0 0 0 1px #0f9960; }
      .bp3-dark .bp3-input.bp3-intent-success:disabled, .bp3-dark .bp3-input.bp3-intent-success.bp3-disabled{
        -webkit-box-shadow:none;
                box-shadow:none; }
  .bp3-input.bp3-intent-warning{
    -webkit-box-shadow:0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), inset 0 0 0 1px #d9822b, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), inset 0 0 0 1px #d9822b, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input.bp3-intent-warning:focus{
      -webkit-box-shadow:0 0 0 1px #d9822b, 0 0 0 3px rgba(217, 130, 43, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #d9822b, 0 0 0 3px rgba(217, 130, 43, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input.bp3-intent-warning[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px #d9822b;
              box-shadow:inset 0 0 0 1px #d9822b; }
    .bp3-input.bp3-intent-warning:disabled, .bp3-input.bp3-intent-warning.bp3-disabled{
      -webkit-box-shadow:none;
              box-shadow:none; }
    .bp3-dark .bp3-input.bp3-intent-warning{
      -webkit-box-shadow:0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), inset 0 0 0 1px #d9822b, inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), inset 0 0 0 1px #d9822b, inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
      .bp3-dark .bp3-input.bp3-intent-warning:focus{
        -webkit-box-shadow:0 0 0 1px #d9822b, 0 0 0 1px #d9822b, 0 0 0 3px rgba(217, 130, 43, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
                box-shadow:0 0 0 1px #d9822b, 0 0 0 1px #d9822b, 0 0 0 3px rgba(217, 130, 43, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
      .bp3-dark .bp3-input.bp3-intent-warning[readonly]{
        -webkit-box-shadow:inset 0 0 0 1px #d9822b;
                box-shadow:inset 0 0 0 1px #d9822b; }
      .bp3-dark .bp3-input.bp3-intent-warning:disabled, .bp3-dark .bp3-input.bp3-intent-warning.bp3-disabled{
        -webkit-box-shadow:none;
                box-shadow:none; }
  .bp3-input.bp3-intent-danger{
    -webkit-box-shadow:0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), inset 0 0 0 1px #db3737, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), inset 0 0 0 1px #db3737, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input.bp3-intent-danger:focus{
      -webkit-box-shadow:0 0 0 1px #db3737, 0 0 0 3px rgba(219, 55, 55, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #db3737, 0 0 0 3px rgba(219, 55, 55, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input.bp3-intent-danger[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px #db3737;
              box-shadow:inset 0 0 0 1px #db3737; }
    .bp3-input.bp3-intent-danger:disabled, .bp3-input.bp3-intent-danger.bp3-disabled{
      -webkit-box-shadow:none;
              box-shadow:none; }
    .bp3-dark .bp3-input.bp3-intent-danger{
      -webkit-box-shadow:0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), inset 0 0 0 1px #db3737, inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), inset 0 0 0 1px #db3737, inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
      .bp3-dark .bp3-input.bp3-intent-danger:focus{
        -webkit-box-shadow:0 0 0 1px #db3737, 0 0 0 1px #db3737, 0 0 0 3px rgba(219, 55, 55, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
                box-shadow:0 0 0 1px #db3737, 0 0 0 1px #db3737, 0 0 0 3px rgba(219, 55, 55, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
      .bp3-dark .bp3-input.bp3-intent-danger[readonly]{
        -webkit-box-shadow:inset 0 0 0 1px #db3737;
                box-shadow:inset 0 0 0 1px #db3737; }
      .bp3-dark .bp3-input.bp3-intent-danger:disabled, .bp3-dark .bp3-input.bp3-intent-danger.bp3-disabled{
        -webkit-box-shadow:none;
                box-shadow:none; }
  .bp3-input::-ms-clear{
    display:none; }
textarea.bp3-input{
  max-width:100%;
  padding:10px; }
  textarea.bp3-input, textarea.bp3-input.bp3-large, textarea.bp3-input.bp3-small{
    height:auto;
    line-height:inherit; }
  textarea.bp3-input.bp3-small{
    padding:8px; }
  .bp3-dark textarea.bp3-input{
    background:rgba(16, 22, 26, 0.3);
    -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
    color:#f5f8fa; }
    .bp3-dark textarea.bp3-input::-webkit-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark textarea.bp3-input::-moz-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark textarea.bp3-input:-ms-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark textarea.bp3-input::-ms-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark textarea.bp3-input::placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark textarea.bp3-input:focus{
      -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark textarea.bp3-input[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark textarea.bp3-input:disabled, .bp3-dark textarea.bp3-input.bp3-disabled{
      background:rgba(57, 75, 89, 0.5);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(167, 182, 194, 0.6); }
label.bp3-label{
  display:block;
  margin-bottom:15px;
  margin-top:0; }
  label.bp3-label .bp3-html-select,
  label.bp3-label .bp3-input,
  label.bp3-label .bp3-select,
  label.bp3-label .bp3-slider,
  label.bp3-label .bp3-popover-wrapper{
    display:block;
    margin-top:5px;
    text-transform:none; }
  label.bp3-label .bp3-button-group{
    margin-top:5px; }
  label.bp3-label .bp3-select select,
  label.bp3-label .bp3-html-select select{
    font-weight:400;
    vertical-align:top;
    width:100%; }
  label.bp3-label.bp3-disabled,
  label.bp3-label.bp3-disabled .bp3-text-muted{
    color:rgba(92, 112, 128, 0.6); }
  label.bp3-label.bp3-inline{
    line-height:30px; }
    label.bp3-label.bp3-inline .bp3-html-select,
    label.bp3-label.bp3-inline .bp3-input,
    label.bp3-label.bp3-inline .bp3-input-group,
    label.bp3-label.bp3-inline .bp3-select,
    label.bp3-label.bp3-inline .bp3-popover-wrapper{
      display:inline-block;
      margin:0 0 0 5px;
      vertical-align:top; }
    label.bp3-label.bp3-inline .bp3-button-group{
      margin:0 0 0 5px; }
    label.bp3-label.bp3-inline .bp3-input-group .bp3-input{
      margin-left:0; }
    label.bp3-label.bp3-inline.bp3-large{
      line-height:40px; }
  label.bp3-label:not(.bp3-inline) .bp3-popover-target{
    display:block; }
  .bp3-dark label.bp3-label{
    color:#f5f8fa; }
    .bp3-dark label.bp3-label.bp3-disabled,
    .bp3-dark label.bp3-label.bp3-disabled .bp3-text-muted{
      color:rgba(167, 182, 194, 0.6); }
.bp3-numeric-input .bp3-button-group.bp3-vertical > .bp3-button{
  -webkit-box-flex:1;
      -ms-flex:1 1 14px;
          flex:1 1 14px;
  min-height:0;
  padding:0;
  width:30px; }
  .bp3-numeric-input .bp3-button-group.bp3-vertical > .bp3-button:first-child{
    border-radius:0 3px 0 0; }
  .bp3-numeric-input .bp3-button-group.bp3-vertical > .bp3-button:last-child{
    border-radius:0 0 3px 0; }

.bp3-numeric-input .bp3-button-group.bp3-vertical:first-child > .bp3-button:first-child{
  border-radius:3px 0 0 0; }

.bp3-numeric-input .bp3-button-group.bp3-vertical:first-child > .bp3-button:last-child{
  border-radius:0 0 0 3px; }

.bp3-numeric-input.bp3-large .bp3-button-group.bp3-vertical > .bp3-button{
  width:40px; }

form{
  display:block; }
.bp3-html-select select,
.bp3-select select{
  display:-webkit-inline-box;
  display:-ms-inline-flexbox;
  display:inline-flex;
  -webkit-box-orient:horizontal;
  -webkit-box-direction:normal;
      -ms-flex-direction:row;
          flex-direction:row;
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  border:none;
  border-radius:3px;
  cursor:pointer;
  font-size:14px;
  -webkit-box-pack:center;
      -ms-flex-pack:center;
          justify-content:center;
  padding:5px 10px;
  text-align:left;
  vertical-align:middle;
  background-color:#f5f8fa;
  background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.8)), to(rgba(255, 255, 255, 0)));
  background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.8), rgba(255, 255, 255, 0));
  -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
          box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
  color:#182026;
  -moz-appearance:none;
  -webkit-appearance:none;
  border-radius:3px;
  height:30px;
  padding:0 25px 0 10px;
  width:100%; }
  .bp3-html-select select > *, .bp3-select select > *{
    -webkit-box-flex:0;
        -ms-flex-positive:0;
            flex-grow:0;
    -ms-flex-negative:0;
        flex-shrink:0; }
  .bp3-html-select select > .bp3-fill, .bp3-select select > .bp3-fill{
    -webkit-box-flex:1;
        -ms-flex-positive:1;
            flex-grow:1;
    -ms-flex-negative:1;
        flex-shrink:1; }
  .bp3-html-select select::before,
  .bp3-select select::before, .bp3-html-select select > *, .bp3-select select > *{
    margin-right:7px; }
  .bp3-html-select select:empty::before,
  .bp3-select select:empty::before,
  .bp3-html-select select > :last-child,
  .bp3-select select > :last-child{
    margin-right:0; }
  .bp3-html-select select:hover,
  .bp3-select select:hover{
    background-clip:padding-box;
    background-color:#ebf1f5;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1); }
  .bp3-html-select select:active,
  .bp3-select select:active, .bp3-html-select select.bp3-active,
  .bp3-select select.bp3-active{
    background-color:#d8e1e8;
    background-image:none;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
  .bp3-html-select select:disabled,
  .bp3-select select:disabled, .bp3-html-select select.bp3-disabled,
  .bp3-select select.bp3-disabled{
    background-color:rgba(206, 217, 224, 0.5);
    background-image:none;
    -webkit-box-shadow:none;
            box-shadow:none;
    color:rgba(92, 112, 128, 0.6);
    cursor:not-allowed;
    outline:none; }
    .bp3-html-select select:disabled.bp3-active,
    .bp3-select select:disabled.bp3-active, .bp3-html-select select:disabled.bp3-active:hover,
    .bp3-select select:disabled.bp3-active:hover, .bp3-html-select select.bp3-disabled.bp3-active,
    .bp3-select select.bp3-disabled.bp3-active, .bp3-html-select select.bp3-disabled.bp3-active:hover,
    .bp3-select select.bp3-disabled.bp3-active:hover{
      background:rgba(206, 217, 224, 0.7); }

.bp3-html-select.bp3-minimal select,
.bp3-select.bp3-minimal select{
  background:none;
  -webkit-box-shadow:none;
          box-shadow:none; }
  .bp3-html-select.bp3-minimal select:hover,
  .bp3-select.bp3-minimal select:hover{
    background:rgba(167, 182, 194, 0.3);
    -webkit-box-shadow:none;
            box-shadow:none;
    color:#182026;
    text-decoration:none; }
  .bp3-html-select.bp3-minimal select:active,
  .bp3-select.bp3-minimal select:active, .bp3-html-select.bp3-minimal select.bp3-active,
  .bp3-select.bp3-minimal select.bp3-active{
    background:rgba(115, 134, 148, 0.3);
    -webkit-box-shadow:none;
            box-shadow:none;
    color:#182026; }
  .bp3-html-select.bp3-minimal select:disabled,
  .bp3-select.bp3-minimal select:disabled, .bp3-html-select.bp3-minimal select:disabled:hover,
  .bp3-select.bp3-minimal select:disabled:hover, .bp3-html-select.bp3-minimal select.bp3-disabled,
  .bp3-select.bp3-minimal select.bp3-disabled, .bp3-html-select.bp3-minimal select.bp3-disabled:hover,
  .bp3-select.bp3-minimal select.bp3-disabled:hover{
    background:none;
    color:rgba(92, 112, 128, 0.6);
    cursor:not-allowed; }
    .bp3-html-select.bp3-minimal select:disabled.bp3-active,
    .bp3-select.bp3-minimal select:disabled.bp3-active, .bp3-html-select.bp3-minimal select:disabled:hover.bp3-active,
    .bp3-select.bp3-minimal select:disabled:hover.bp3-active, .bp3-html-select.bp3-minimal select.bp3-disabled.bp3-active,
    .bp3-select.bp3-minimal select.bp3-disabled.bp3-active, .bp3-html-select.bp3-minimal select.bp3-disabled:hover.bp3-active,
    .bp3-select.bp3-minimal select.bp3-disabled:hover.bp3-active{
      background:rgba(115, 134, 148, 0.3); }
  .bp3-dark .bp3-html-select.bp3-minimal select, .bp3-html-select.bp3-minimal .bp3-dark select,
  .bp3-dark .bp3-select.bp3-minimal select, .bp3-select.bp3-minimal .bp3-dark select{
    background:none;
    -webkit-box-shadow:none;
            box-shadow:none;
    color:inherit; }
    .bp3-dark .bp3-html-select.bp3-minimal select:hover, .bp3-html-select.bp3-minimal .bp3-dark select:hover,
    .bp3-dark .bp3-select.bp3-minimal select:hover, .bp3-select.bp3-minimal .bp3-dark select:hover, .bp3-dark .bp3-html-select.bp3-minimal select:active, .bp3-html-select.bp3-minimal .bp3-dark select:active,
    .bp3-dark .bp3-select.bp3-minimal select:active, .bp3-select.bp3-minimal .bp3-dark select:active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-active,
    .bp3-dark .bp3-select.bp3-minimal select.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-active{
      background:none;
      -webkit-box-shadow:none;
              box-shadow:none; }
    .bp3-dark .bp3-html-select.bp3-minimal select:hover, .bp3-html-select.bp3-minimal .bp3-dark select:hover,
    .bp3-dark .bp3-select.bp3-minimal select:hover, .bp3-select.bp3-minimal .bp3-dark select:hover{
      background:rgba(138, 155, 168, 0.15); }
    .bp3-dark .bp3-html-select.bp3-minimal select:active, .bp3-html-select.bp3-minimal .bp3-dark select:active,
    .bp3-dark .bp3-select.bp3-minimal select:active, .bp3-select.bp3-minimal .bp3-dark select:active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-active,
    .bp3-dark .bp3-select.bp3-minimal select.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-active{
      background:rgba(138, 155, 168, 0.3);
      color:#f5f8fa; }
    .bp3-dark .bp3-html-select.bp3-minimal select:disabled, .bp3-html-select.bp3-minimal .bp3-dark select:disabled,
    .bp3-dark .bp3-select.bp3-minimal select:disabled, .bp3-select.bp3-minimal .bp3-dark select:disabled, .bp3-dark .bp3-html-select.bp3-minimal select:disabled:hover, .bp3-html-select.bp3-minimal .bp3-dark select:disabled:hover,
    .bp3-dark .bp3-select.bp3-minimal select:disabled:hover, .bp3-select.bp3-minimal .bp3-dark select:disabled:hover, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-disabled, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-disabled,
    .bp3-dark .bp3-select.bp3-minimal select.bp3-disabled, .bp3-select.bp3-minimal .bp3-dark select.bp3-disabled, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-disabled:hover, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-disabled:hover,
    .bp3-dark .bp3-select.bp3-minimal select.bp3-disabled:hover, .bp3-select.bp3-minimal .bp3-dark select.bp3-disabled:hover{
      background:none;
      color:rgba(167, 182, 194, 0.6);
      cursor:not-allowed; }
      .bp3-dark .bp3-html-select.bp3-minimal select:disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select:disabled.bp3-active,
      .bp3-dark .bp3-select.bp3-minimal select:disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select:disabled.bp3-active, .bp3-dark .bp3-html-select.bp3-minimal select:disabled:hover.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select:disabled:hover.bp3-active,
      .bp3-dark .bp3-select.bp3-minimal select:disabled:hover.bp3-active, .bp3-select.bp3-minimal .bp3-dark select:disabled:hover.bp3-active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-disabled.bp3-active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-disabled.bp3-active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-disabled:hover.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-disabled:hover.bp3-active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-disabled:hover.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-disabled:hover.bp3-active{
        background:rgba(138, 155, 168, 0.3); }
  .bp3-html-select.bp3-minimal select.bp3-intent-primary,
  .bp3-select.bp3-minimal select.bp3-intent-primary{
    color:#106ba3; }
    .bp3-html-select.bp3-minimal select.bp3-intent-primary:hover,
    .bp3-select.bp3-minimal select.bp3-intent-primary:hover, .bp3-html-select.bp3-minimal select.bp3-intent-primary:active,
    .bp3-select.bp3-minimal select.bp3-intent-primary:active, .bp3-html-select.bp3-minimal select.bp3-intent-primary.bp3-active,
    .bp3-select.bp3-minimal select.bp3-intent-primary.bp3-active{
      background:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#106ba3; }
    .bp3-html-select.bp3-minimal select.bp3-intent-primary:hover,
    .bp3-select.bp3-minimal select.bp3-intent-primary:hover{
      background:rgba(19, 124, 189, 0.15);
      color:#106ba3; }
    .bp3-html-select.bp3-minimal select.bp3-intent-primary:active,
    .bp3-select.bp3-minimal select.bp3-intent-primary:active, .bp3-html-select.bp3-minimal select.bp3-intent-primary.bp3-active,
    .bp3-select.bp3-minimal select.bp3-intent-primary.bp3-active{
      background:rgba(19, 124, 189, 0.3);
      color:#106ba3; }
    .bp3-html-select.bp3-minimal select.bp3-intent-primary:disabled,
    .bp3-select.bp3-minimal select.bp3-intent-primary:disabled, .bp3-html-select.bp3-minimal select.bp3-intent-primary.bp3-disabled,
    .bp3-select.bp3-minimal select.bp3-intent-primary.bp3-disabled{
      background:none;
      color:rgba(16, 107, 163, 0.5); }
      .bp3-html-select.bp3-minimal select.bp3-intent-primary:disabled.bp3-active,
      .bp3-select.bp3-minimal select.bp3-intent-primary:disabled.bp3-active, .bp3-html-select.bp3-minimal select.bp3-intent-primary.bp3-disabled.bp3-active,
      .bp3-select.bp3-minimal select.bp3-intent-primary.bp3-disabled.bp3-active{
        background:rgba(19, 124, 189, 0.3); }
    .bp3-html-select.bp3-minimal select.bp3-intent-primary .bp3-button-spinner .bp3-spinner-head, .bp3-select.bp3-minimal select.bp3-intent-primary .bp3-button-spinner .bp3-spinner-head{
      stroke:#106ba3; }
    .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-primary, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-primary,
    .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-primary, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-primary{
      color:#48aff0; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-primary:hover, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-primary:hover,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-primary:hover, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-primary:hover{
        background:rgba(19, 124, 189, 0.2);
        color:#48aff0; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-primary:active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-primary:active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-primary:active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-primary:active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-primary.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-primary.bp3-active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-primary.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-primary.bp3-active{
        background:rgba(19, 124, 189, 0.3);
        color:#48aff0; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-primary:disabled, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-primary:disabled,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-primary:disabled, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-primary:disabled, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-primary.bp3-disabled, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-primary.bp3-disabled,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-primary.bp3-disabled, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-primary.bp3-disabled{
        background:none;
        color:rgba(72, 175, 240, 0.5); }
        .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-primary:disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-primary:disabled.bp3-active,
        .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-primary:disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-primary:disabled.bp3-active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-primary.bp3-disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-primary.bp3-disabled.bp3-active,
        .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-primary.bp3-disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-primary.bp3-disabled.bp3-active{
          background:rgba(19, 124, 189, 0.3); }
  .bp3-html-select.bp3-minimal select.bp3-intent-success,
  .bp3-select.bp3-minimal select.bp3-intent-success{
    color:#0d8050; }
    .bp3-html-select.bp3-minimal select.bp3-intent-success:hover,
    .bp3-select.bp3-minimal select.bp3-intent-success:hover, .bp3-html-select.bp3-minimal select.bp3-intent-success:active,
    .bp3-select.bp3-minimal select.bp3-intent-success:active, .bp3-html-select.bp3-minimal select.bp3-intent-success.bp3-active,
    .bp3-select.bp3-minimal select.bp3-intent-success.bp3-active{
      background:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#0d8050; }
    .bp3-html-select.bp3-minimal select.bp3-intent-success:hover,
    .bp3-select.bp3-minimal select.bp3-intent-success:hover{
      background:rgba(15, 153, 96, 0.15);
      color:#0d8050; }
    .bp3-html-select.bp3-minimal select.bp3-intent-success:active,
    .bp3-select.bp3-minimal select.bp3-intent-success:active, .bp3-html-select.bp3-minimal select.bp3-intent-success.bp3-active,
    .bp3-select.bp3-minimal select.bp3-intent-success.bp3-active{
      background:rgba(15, 153, 96, 0.3);
      color:#0d8050; }
    .bp3-html-select.bp3-minimal select.bp3-intent-success:disabled,
    .bp3-select.bp3-minimal select.bp3-intent-success:disabled, .bp3-html-select.bp3-minimal select.bp3-intent-success.bp3-disabled,
    .bp3-select.bp3-minimal select.bp3-intent-success.bp3-disabled{
      background:none;
      color:rgba(13, 128, 80, 0.5); }
      .bp3-html-select.bp3-minimal select.bp3-intent-success:disabled.bp3-active,
      .bp3-select.bp3-minimal select.bp3-intent-success:disabled.bp3-active, .bp3-html-select.bp3-minimal select.bp3-intent-success.bp3-disabled.bp3-active,
      .bp3-select.bp3-minimal select.bp3-intent-success.bp3-disabled.bp3-active{
        background:rgba(15, 153, 96, 0.3); }
    .bp3-html-select.bp3-minimal select.bp3-intent-success .bp3-button-spinner .bp3-spinner-head, .bp3-select.bp3-minimal select.bp3-intent-success .bp3-button-spinner .bp3-spinner-head{
      stroke:#0d8050; }
    .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-success, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-success,
    .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-success, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-success{
      color:#3dcc91; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-success:hover, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-success:hover,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-success:hover, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-success:hover{
        background:rgba(15, 153, 96, 0.2);
        color:#3dcc91; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-success:active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-success:active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-success:active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-success:active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-success.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-success.bp3-active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-success.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-success.bp3-active{
        background:rgba(15, 153, 96, 0.3);
        color:#3dcc91; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-success:disabled, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-success:disabled,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-success:disabled, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-success:disabled, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-success.bp3-disabled, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-success.bp3-disabled,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-success.bp3-disabled, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-success.bp3-disabled{
        background:none;
        color:rgba(61, 204, 145, 0.5); }
        .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-success:disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-success:disabled.bp3-active,
        .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-success:disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-success:disabled.bp3-active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-success.bp3-disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-success.bp3-disabled.bp3-active,
        .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-success.bp3-disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-success.bp3-disabled.bp3-active{
          background:rgba(15, 153, 96, 0.3); }
  .bp3-html-select.bp3-minimal select.bp3-intent-warning,
  .bp3-select.bp3-minimal select.bp3-intent-warning{
    color:#bf7326; }
    .bp3-html-select.bp3-minimal select.bp3-intent-warning:hover,
    .bp3-select.bp3-minimal select.bp3-intent-warning:hover, .bp3-html-select.bp3-minimal select.bp3-intent-warning:active,
    .bp3-select.bp3-minimal select.bp3-intent-warning:active, .bp3-html-select.bp3-minimal select.bp3-intent-warning.bp3-active,
    .bp3-select.bp3-minimal select.bp3-intent-warning.bp3-active{
      background:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#bf7326; }
    .bp3-html-select.bp3-minimal select.bp3-intent-warning:hover,
    .bp3-select.bp3-minimal select.bp3-intent-warning:hover{
      background:rgba(217, 130, 43, 0.15);
      color:#bf7326; }
    .bp3-html-select.bp3-minimal select.bp3-intent-warning:active,
    .bp3-select.bp3-minimal select.bp3-intent-warning:active, .bp3-html-select.bp3-minimal select.bp3-intent-warning.bp3-active,
    .bp3-select.bp3-minimal select.bp3-intent-warning.bp3-active{
      background:rgba(217, 130, 43, 0.3);
      color:#bf7326; }
    .bp3-html-select.bp3-minimal select.bp3-intent-warning:disabled,
    .bp3-select.bp3-minimal select.bp3-intent-warning:disabled, .bp3-html-select.bp3-minimal select.bp3-intent-warning.bp3-disabled,
    .bp3-select.bp3-minimal select.bp3-intent-warning.bp3-disabled{
      background:none;
      color:rgba(191, 115, 38, 0.5); }
      .bp3-html-select.bp3-minimal select.bp3-intent-warning:disabled.bp3-active,
      .bp3-select.bp3-minimal select.bp3-intent-warning:disabled.bp3-active, .bp3-html-select.bp3-minimal select.bp3-intent-warning.bp3-disabled.bp3-active,
      .bp3-select.bp3-minimal select.bp3-intent-warning.bp3-disabled.bp3-active{
        background:rgba(217, 130, 43, 0.3); }
    .bp3-html-select.bp3-minimal select.bp3-intent-warning .bp3-button-spinner .bp3-spinner-head, .bp3-select.bp3-minimal select.bp3-intent-warning .bp3-button-spinner .bp3-spinner-head{
      stroke:#bf7326; }
    .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-warning, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-warning,
    .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-warning, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-warning{
      color:#ffb366; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-warning:hover, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-warning:hover,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-warning:hover, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-warning:hover{
        background:rgba(217, 130, 43, 0.2);
        color:#ffb366; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-warning:active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-warning:active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-warning:active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-warning:active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-warning.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-warning.bp3-active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-warning.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-warning.bp3-active{
        background:rgba(217, 130, 43, 0.3);
        color:#ffb366; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-warning:disabled, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-warning:disabled,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-warning:disabled, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-warning:disabled, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-warning.bp3-disabled, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-warning.bp3-disabled,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-warning.bp3-disabled, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-warning.bp3-disabled{
        background:none;
        color:rgba(255, 179, 102, 0.5); }
        .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-warning:disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-warning:disabled.bp3-active,
        .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-warning:disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-warning:disabled.bp3-active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-warning.bp3-disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-warning.bp3-disabled.bp3-active,
        .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-warning.bp3-disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-warning.bp3-disabled.bp3-active{
          background:rgba(217, 130, 43, 0.3); }
  .bp3-html-select.bp3-minimal select.bp3-intent-danger,
  .bp3-select.bp3-minimal select.bp3-intent-danger{
    color:#c23030; }
    .bp3-html-select.bp3-minimal select.bp3-intent-danger:hover,
    .bp3-select.bp3-minimal select.bp3-intent-danger:hover, .bp3-html-select.bp3-minimal select.bp3-intent-danger:active,
    .bp3-select.bp3-minimal select.bp3-intent-danger:active, .bp3-html-select.bp3-minimal select.bp3-intent-danger.bp3-active,
    .bp3-select.bp3-minimal select.bp3-intent-danger.bp3-active{
      background:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#c23030; }
    .bp3-html-select.bp3-minimal select.bp3-intent-danger:hover,
    .bp3-select.bp3-minimal select.bp3-intent-danger:hover{
      background:rgba(219, 55, 55, 0.15);
      color:#c23030; }
    .bp3-html-select.bp3-minimal select.bp3-intent-danger:active,
    .bp3-select.bp3-minimal select.bp3-intent-danger:active, .bp3-html-select.bp3-minimal select.bp3-intent-danger.bp3-active,
    .bp3-select.bp3-minimal select.bp3-intent-danger.bp3-active{
      background:rgba(219, 55, 55, 0.3);
      color:#c23030; }
    .bp3-html-select.bp3-minimal select.bp3-intent-danger:disabled,
    .bp3-select.bp3-minimal select.bp3-intent-danger:disabled, .bp3-html-select.bp3-minimal select.bp3-intent-danger.bp3-disabled,
    .bp3-select.bp3-minimal select.bp3-intent-danger.bp3-disabled{
      background:none;
      color:rgba(194, 48, 48, 0.5); }
      .bp3-html-select.bp3-minimal select.bp3-intent-danger:disabled.bp3-active,
      .bp3-select.bp3-minimal select.bp3-intent-danger:disabled.bp3-active, .bp3-html-select.bp3-minimal select.bp3-intent-danger.bp3-disabled.bp3-active,
      .bp3-select.bp3-minimal select.bp3-intent-danger.bp3-disabled.bp3-active{
        background:rgba(219, 55, 55, 0.3); }
    .bp3-html-select.bp3-minimal select.bp3-intent-danger .bp3-button-spinner .bp3-spinner-head, .bp3-select.bp3-minimal select.bp3-intent-danger .bp3-button-spinner .bp3-spinner-head{
      stroke:#c23030; }
    .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-danger, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-danger,
    .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-danger, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-danger{
      color:#ff7373; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-danger:hover, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-danger:hover,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-danger:hover, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-danger:hover{
        background:rgba(219, 55, 55, 0.2);
        color:#ff7373; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-danger:active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-danger:active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-danger:active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-danger:active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-danger.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-danger.bp3-active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-danger.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-danger.bp3-active{
        background:rgba(219, 55, 55, 0.3);
        color:#ff7373; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-danger:disabled, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-danger:disabled,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-danger:disabled, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-danger:disabled, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-danger.bp3-disabled, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-danger.bp3-disabled,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-danger.bp3-disabled, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-danger.bp3-disabled{
        background:none;
        color:rgba(255, 115, 115, 0.5); }
        .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-danger:disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-danger:disabled.bp3-active,
        .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-danger:disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-danger:disabled.bp3-active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-danger.bp3-disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-danger.bp3-disabled.bp3-active,
        .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-danger.bp3-disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-danger.bp3-disabled.bp3-active{
          background:rgba(219, 55, 55, 0.3); }

.bp3-html-select.bp3-large select,
.bp3-select.bp3-large select{
  font-size:16px;
  height:40px;
  padding-right:35px; }

.bp3-dark .bp3-html-select select, .bp3-dark .bp3-select select{
  background-color:#394b59;
  background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.05)), to(rgba(255, 255, 255, 0)));
  background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.05), rgba(255, 255, 255, 0));
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
  color:#f5f8fa; }
  .bp3-dark .bp3-html-select select:hover, .bp3-dark .bp3-select select:hover, .bp3-dark .bp3-html-select select:active, .bp3-dark .bp3-select select:active, .bp3-dark .bp3-html-select select.bp3-active, .bp3-dark .bp3-select select.bp3-active{
    color:#f5f8fa; }
  .bp3-dark .bp3-html-select select:hover, .bp3-dark .bp3-select select:hover{
    background-color:#30404d;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-html-select select:active, .bp3-dark .bp3-select select:active, .bp3-dark .bp3-html-select select.bp3-active, .bp3-dark .bp3-select select.bp3-active{
    background-color:#202b33;
    background-image:none;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
  .bp3-dark .bp3-html-select select:disabled, .bp3-dark .bp3-select select:disabled, .bp3-dark .bp3-html-select select.bp3-disabled, .bp3-dark .bp3-select select.bp3-disabled{
    background-color:rgba(57, 75, 89, 0.5);
    background-image:none;
    -webkit-box-shadow:none;
            box-shadow:none;
    color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-html-select select:disabled.bp3-active, .bp3-dark .bp3-select select:disabled.bp3-active, .bp3-dark .bp3-html-select select.bp3-disabled.bp3-active, .bp3-dark .bp3-select select.bp3-disabled.bp3-active{
      background:rgba(57, 75, 89, 0.7); }
  .bp3-dark .bp3-html-select select .bp3-button-spinner .bp3-spinner-head, .bp3-dark .bp3-select select .bp3-button-spinner .bp3-spinner-head{
    background:rgba(16, 22, 26, 0.5);
    stroke:#8a9ba8; }

.bp3-html-select select:disabled,
.bp3-select select:disabled{
  background-color:rgba(206, 217, 224, 0.5);
  -webkit-box-shadow:none;
          box-shadow:none;
  color:rgba(92, 112, 128, 0.6);
  cursor:not-allowed; }

.bp3-html-select .bp3-icon,
.bp3-select .bp3-icon, .bp3-select::after{
  color:#5c7080;
  pointer-events:none;
  position:absolute;
  right:7px;
  top:7px; }
  .bp3-html-select .bp3-disabled.bp3-icon,
  .bp3-select .bp3-disabled.bp3-icon, .bp3-disabled.bp3-select::after{
    color:rgba(92, 112, 128, 0.6); }
.bp3-html-select,
.bp3-select{
  display:inline-block;
  letter-spacing:normal;
  position:relative;
  vertical-align:middle; }
  .bp3-html-select select::-ms-expand,
  .bp3-select select::-ms-expand{
    display:none; }
  .bp3-html-select .bp3-icon,
  .bp3-select .bp3-icon{
    color:#5c7080; }
    .bp3-html-select .bp3-icon:hover,
    .bp3-select .bp3-icon:hover{
      color:#182026; }
    .bp3-dark .bp3-html-select .bp3-icon, .bp3-dark
    .bp3-select .bp3-icon{
      color:#a7b6c2; }
      .bp3-dark .bp3-html-select .bp3-icon:hover, .bp3-dark
      .bp3-select .bp3-icon:hover{
        color:#f5f8fa; }
  .bp3-html-select.bp3-large::after,
  .bp3-html-select.bp3-large .bp3-icon,
  .bp3-select.bp3-large::after,
  .bp3-select.bp3-large .bp3-icon{
    right:12px;
    top:12px; }
  .bp3-html-select.bp3-fill,
  .bp3-html-select.bp3-fill select,
  .bp3-select.bp3-fill,
  .bp3-select.bp3-fill select{
    width:100%; }
  .bp3-dark .bp3-html-select option, .bp3-dark
  .bp3-select option{
    background-color:#30404d;
    color:#f5f8fa; }
  .bp3-dark .bp3-html-select option:disabled, .bp3-dark
  .bp3-select option:disabled{
    color:rgba(167, 182, 194, 0.6); }
  .bp3-dark .bp3-html-select::after, .bp3-dark
  .bp3-select::after{
    color:#a7b6c2; }

.bp3-select::after{
  font-family:"Icons16", sans-serif;
  font-size:16px;
  font-style:normal;
  font-weight:400;
  line-height:1;
  -moz-osx-font-smoothing:grayscale;
  -webkit-font-smoothing:antialiased;
  content:""; }
.bp3-running-text table, table.bp3-html-table{
  border-spacing:0;
  font-size:14px; }
  .bp3-running-text table th, table.bp3-html-table th,
  .bp3-running-text table td,
  table.bp3-html-table td{
    padding:11px;
    text-align:left;
    vertical-align:top; }
  .bp3-running-text table th, table.bp3-html-table th{
    color:#182026;
    font-weight:600; }
  
  .bp3-running-text table td,
  table.bp3-html-table td{
    color:#182026; }
  .bp3-running-text table tbody tr:first-child th, table.bp3-html-table tbody tr:first-child th,
  .bp3-running-text table tbody tr:first-child td,
  table.bp3-html-table tbody tr:first-child td,
  .bp3-running-text table tfoot tr:first-child th,
  table.bp3-html-table tfoot tr:first-child th,
  .bp3-running-text table tfoot tr:first-child td,
  table.bp3-html-table tfoot tr:first-child td{
    -webkit-box-shadow:inset 0 1px 0 0 rgba(16, 22, 26, 0.15);
            box-shadow:inset 0 1px 0 0 rgba(16, 22, 26, 0.15); }
  .bp3-dark .bp3-running-text table th, .bp3-running-text .bp3-dark table th, .bp3-dark table.bp3-html-table th{
    color:#f5f8fa; }
  .bp3-dark .bp3-running-text table td, .bp3-running-text .bp3-dark table td, .bp3-dark table.bp3-html-table td{
    color:#f5f8fa; }
  .bp3-dark .bp3-running-text table tbody tr:first-child th, .bp3-running-text .bp3-dark table tbody tr:first-child th, .bp3-dark table.bp3-html-table tbody tr:first-child th,
  .bp3-dark .bp3-running-text table tbody tr:first-child td,
  .bp3-running-text .bp3-dark table tbody tr:first-child td,
  .bp3-dark table.bp3-html-table tbody tr:first-child td,
  .bp3-dark .bp3-running-text table tfoot tr:first-child th,
  .bp3-running-text .bp3-dark table tfoot tr:first-child th,
  .bp3-dark table.bp3-html-table tfoot tr:first-child th,
  .bp3-dark .bp3-running-text table tfoot tr:first-child td,
  .bp3-running-text .bp3-dark table tfoot tr:first-child td,
  .bp3-dark table.bp3-html-table tfoot tr:first-child td{
    -webkit-box-shadow:inset 0 1px 0 0 rgba(255, 255, 255, 0.15);
            box-shadow:inset 0 1px 0 0 rgba(255, 255, 255, 0.15); }

table.bp3-html-table.bp3-html-table-condensed th,
table.bp3-html-table.bp3-html-table-condensed td, table.bp3-html-table.bp3-small th,
table.bp3-html-table.bp3-small td{
  padding-bottom:6px;
  padding-top:6px; }

table.bp3-html-table.bp3-html-table-striped tbody tr:nth-child(odd) td{
  background:rgba(191, 204, 214, 0.15); }

table.bp3-html-table.bp3-html-table-bordered th:not(:first-child){
  -webkit-box-shadow:inset 1px 0 0 0 rgba(16, 22, 26, 0.15);
          box-shadow:inset 1px 0 0 0 rgba(16, 22, 26, 0.15); }

table.bp3-html-table.bp3-html-table-bordered tbody tr td,
table.bp3-html-table.bp3-html-table-bordered tfoot tr td{
  -webkit-box-shadow:inset 0 1px 0 0 rgba(16, 22, 26, 0.15);
          box-shadow:inset 0 1px 0 0 rgba(16, 22, 26, 0.15); }
  table.bp3-html-table.bp3-html-table-bordered tbody tr td:not(:first-child),
  table.bp3-html-table.bp3-html-table-bordered tfoot tr td:not(:first-child){
    -webkit-box-shadow:inset 1px 1px 0 0 rgba(16, 22, 26, 0.15);
            box-shadow:inset 1px 1px 0 0 rgba(16, 22, 26, 0.15); }

table.bp3-html-table.bp3-html-table-bordered.bp3-html-table-striped tbody tr:not(:first-child) td{
  -webkit-box-shadow:none;
          box-shadow:none; }
  table.bp3-html-table.bp3-html-table-bordered.bp3-html-table-striped tbody tr:not(:first-child) td:not(:first-child){
    -webkit-box-shadow:inset 1px 0 0 0 rgba(16, 22, 26, 0.15);
            box-shadow:inset 1px 0 0 0 rgba(16, 22, 26, 0.15); }

table.bp3-html-table.bp3-interactive tbody tr:hover td{
  background-color:rgba(191, 204, 214, 0.3);
  cursor:pointer; }

table.bp3-html-table.bp3-interactive tbody tr:active td{
  background-color:rgba(191, 204, 214, 0.4); }

.bp3-dark table.bp3-html-table{ }
  .bp3-dark table.bp3-html-table.bp3-html-table-striped tbody tr:nth-child(odd) td{
    background:rgba(92, 112, 128, 0.15); }
  .bp3-dark table.bp3-html-table.bp3-html-table-bordered th:not(:first-child){
    -webkit-box-shadow:inset 1px 0 0 0 rgba(255, 255, 255, 0.15);
            box-shadow:inset 1px 0 0 0 rgba(255, 255, 255, 0.15); }
  .bp3-dark table.bp3-html-table.bp3-html-table-bordered tbody tr td,
  .bp3-dark table.bp3-html-table.bp3-html-table-bordered tfoot tr td{
    -webkit-box-shadow:inset 0 1px 0 0 rgba(255, 255, 255, 0.15);
            box-shadow:inset 0 1px 0 0 rgba(255, 255, 255, 0.15); }
    .bp3-dark table.bp3-html-table.bp3-html-table-bordered tbody tr td:not(:first-child),
    .bp3-dark table.bp3-html-table.bp3-html-table-bordered tfoot tr td:not(:first-child){
      -webkit-box-shadow:inset 1px 1px 0 0 rgba(255, 255, 255, 0.15);
              box-shadow:inset 1px 1px 0 0 rgba(255, 255, 255, 0.15); }
  .bp3-dark table.bp3-html-table.bp3-html-table-bordered.bp3-html-table-striped tbody tr:not(:first-child) td{
    -webkit-box-shadow:inset 1px 0 0 0 rgba(255, 255, 255, 0.15);
            box-shadow:inset 1px 0 0 0 rgba(255, 255, 255, 0.15); }
    .bp3-dark table.bp3-html-table.bp3-html-table-bordered.bp3-html-table-striped tbody tr:not(:first-child) td:first-child{
      -webkit-box-shadow:none;
              box-shadow:none; }
  .bp3-dark table.bp3-html-table.bp3-interactive tbody tr:hover td{
    background-color:rgba(92, 112, 128, 0.3);
    cursor:pointer; }
  .bp3-dark table.bp3-html-table.bp3-interactive tbody tr:active td{
    background-color:rgba(92, 112, 128, 0.4); }

.bp3-key-combo{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:horizontal;
  -webkit-box-direction:normal;
      -ms-flex-direction:row;
          flex-direction:row;
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center; }
  .bp3-key-combo > *{
    -webkit-box-flex:0;
        -ms-flex-positive:0;
            flex-grow:0;
    -ms-flex-negative:0;
        flex-shrink:0; }
  .bp3-key-combo > .bp3-fill{
    -webkit-box-flex:1;
        -ms-flex-positive:1;
            flex-grow:1;
    -ms-flex-negative:1;
        flex-shrink:1; }
  .bp3-key-combo::before,
  .bp3-key-combo > *{
    margin-right:5px; }
  .bp3-key-combo:empty::before,
  .bp3-key-combo > :last-child{
    margin-right:0; }

.bp3-hotkey-dialog{
  padding-bottom:0;
  top:40px; }
  .bp3-hotkey-dialog .bp3-dialog-body{
    margin:0;
    padding:0; }
  .bp3-hotkey-dialog .bp3-hotkey-label{
    -webkit-box-flex:1;
        -ms-flex-positive:1;
            flex-grow:1; }

.bp3-hotkey-column{
  margin:auto;
  max-height:80vh;
  overflow-y:auto;
  padding:30px; }
  .bp3-hotkey-column .bp3-heading{
    margin-bottom:20px; }
    .bp3-hotkey-column .bp3-heading:not(:first-child){
      margin-top:40px; }

.bp3-hotkey{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-pack:justify;
      -ms-flex-pack:justify;
          justify-content:space-between;
  margin-left:0;
  margin-right:0; }
  .bp3-hotkey:not(:last-child){
    margin-bottom:10px; }
.bp3-icon{
  display:inline-block;
  -webkit-box-flex:0;
      -ms-flex:0 0 auto;
          flex:0 0 auto;
  vertical-align:text-bottom; }
  .bp3-icon:not(:empty)::before{
    content:"" !important;
    content:unset !important; }
  .bp3-icon > svg{
    display:block; }
    .bp3-icon > svg:not([fill]){
      fill:currentColor; }

.bp3-icon.bp3-intent-primary, .bp3-icon-standard.bp3-intent-primary, .bp3-icon-large.bp3-intent-primary{
  color:#106ba3; }
  .bp3-dark .bp3-icon.bp3-intent-primary, .bp3-dark .bp3-icon-standard.bp3-intent-primary, .bp3-dark .bp3-icon-large.bp3-intent-primary{
    color:#48aff0; }

.bp3-icon.bp3-intent-success, .bp3-icon-standard.bp3-intent-success, .bp3-icon-large.bp3-intent-success{
  color:#0d8050; }
  .bp3-dark .bp3-icon.bp3-intent-success, .bp3-dark .bp3-icon-standard.bp3-intent-success, .bp3-dark .bp3-icon-large.bp3-intent-success{
    color:#3dcc91; }

.bp3-icon.bp3-intent-warning, .bp3-icon-standard.bp3-intent-warning, .bp3-icon-large.bp3-intent-warning{
  color:#bf7326; }
  .bp3-dark .bp3-icon.bp3-intent-warning, .bp3-dark .bp3-icon-standard.bp3-intent-warning, .bp3-dark .bp3-icon-large.bp3-intent-warning{
    color:#ffb366; }

.bp3-icon.bp3-intent-danger, .bp3-icon-standard.bp3-intent-danger, .bp3-icon-large.bp3-intent-danger{
  color:#c23030; }
  .bp3-dark .bp3-icon.bp3-intent-danger, .bp3-dark .bp3-icon-standard.bp3-intent-danger, .bp3-dark .bp3-icon-large.bp3-intent-danger{
    color:#ff7373; }

span.bp3-icon-standard{
  font-family:"Icons16", sans-serif;
  font-size:16px;
  font-style:normal;
  font-weight:400;
  line-height:1;
  -moz-osx-font-smoothing:grayscale;
  -webkit-font-smoothing:antialiased;
  display:inline-block; }

span.bp3-icon-large{
  font-family:"Icons20", sans-serif;
  font-size:20px;
  font-style:normal;
  font-weight:400;
  line-height:1;
  -moz-osx-font-smoothing:grayscale;
  -webkit-font-smoothing:antialiased;
  display:inline-block; }

span.bp3-icon:empty{
  font-family:"Icons20";
  font-size:inherit;
  font-style:normal;
  font-weight:400;
  line-height:1; }
  span.bp3-icon:empty::before{
    -moz-osx-font-smoothing:grayscale;
    -webkit-font-smoothing:antialiased; }

.bp3-icon-add::before{
  content:""; }

.bp3-icon-add-column-left::before{
  content:""; }

.bp3-icon-add-column-right::before{
  content:""; }

.bp3-icon-add-row-bottom::before{
  content:""; }

.bp3-icon-add-row-top::before{
  content:""; }

.bp3-icon-add-to-artifact::before{
  content:""; }

.bp3-icon-add-to-folder::before{
  content:""; }

.bp3-icon-airplane::before{
  content:""; }

.bp3-icon-align-center::before{
  content:""; }

.bp3-icon-align-justify::before{
  content:""; }

.bp3-icon-align-left::before{
  content:""; }

.bp3-icon-align-right::before{
  content:""; }

.bp3-icon-alignment-bottom::before{
  content:""; }

.bp3-icon-alignment-horizontal-center::before{
  content:""; }

.bp3-icon-alignment-left::before{
  content:""; }

.bp3-icon-alignment-right::before{
  content:""; }

.bp3-icon-alignment-top::before{
  content:""; }

.bp3-icon-alignment-vertical-center::before{
  content:""; }

.bp3-icon-annotation::before{
  content:""; }

.bp3-icon-application::before{
  content:""; }

.bp3-icon-applications::before{
  content:""; }

.bp3-icon-archive::before{
  content:""; }

.bp3-icon-arrow-bottom-left::before{
  content:"↙"; }

.bp3-icon-arrow-bottom-right::before{
  content:"↘"; }

.bp3-icon-arrow-down::before{
  content:"↓"; }

.bp3-icon-arrow-left::before{
  content:"←"; }

.bp3-icon-arrow-right::before{
  content:"→"; }

.bp3-icon-arrow-top-left::before{
  content:"↖"; }

.bp3-icon-arrow-top-right::before{
  content:"↗"; }

.bp3-icon-arrow-up::before{
  content:"↑"; }

.bp3-icon-arrows-horizontal::before{
  content:"↔"; }

.bp3-icon-arrows-vertical::before{
  content:"↕"; }

.bp3-icon-asterisk::before{
  content:"*"; }

.bp3-icon-automatic-updates::before{
  content:""; }

.bp3-icon-badge::before{
  content:""; }

.bp3-icon-ban-circle::before{
  content:""; }

.bp3-icon-bank-account::before{
  content:""; }

.bp3-icon-barcode::before{
  content:""; }

.bp3-icon-blank::before{
  content:""; }

.bp3-icon-blocked-person::before{
  content:""; }

.bp3-icon-bold::before{
  content:""; }

.bp3-icon-book::before{
  content:""; }

.bp3-icon-bookmark::before{
  content:""; }

.bp3-icon-box::before{
  content:""; }

.bp3-icon-briefcase::before{
  content:""; }

.bp3-icon-bring-data::before{
  content:""; }

.bp3-icon-build::before{
  content:""; }

.bp3-icon-calculator::before{
  content:""; }

.bp3-icon-calendar::before{
  content:""; }

.bp3-icon-camera::before{
  content:""; }

.bp3-icon-caret-down::before{
  content:"⌄"; }

.bp3-icon-caret-left::before{
  content:"〈"; }

.bp3-icon-caret-right::before{
  content:"〉"; }

.bp3-icon-caret-up::before{
  content:"⌃"; }

.bp3-icon-cell-tower::before{
  content:""; }

.bp3-icon-changes::before{
  content:""; }

.bp3-icon-chart::before{
  content:""; }

.bp3-icon-chat::before{
  content:""; }

.bp3-icon-chevron-backward::before{
  content:""; }

.bp3-icon-chevron-down::before{
  content:""; }

.bp3-icon-chevron-forward::before{
  content:""; }

.bp3-icon-chevron-left::before{
  content:""; }

.bp3-icon-chevron-right::before{
  content:""; }

.bp3-icon-chevron-up::before{
  content:""; }

.bp3-icon-circle::before{
  content:""; }

.bp3-icon-circle-arrow-down::before{
  content:""; }

.bp3-icon-circle-arrow-left::before{
  content:""; }

.bp3-icon-circle-arrow-right::before{
  content:""; }

.bp3-icon-circle-arrow-up::before{
  content:""; }

.bp3-icon-citation::before{
  content:""; }

.bp3-icon-clean::before{
  content:""; }

.bp3-icon-clipboard::before{
  content:""; }

.bp3-icon-cloud::before{
  content:"☁"; }

.bp3-icon-cloud-download::before{
  content:""; }

.bp3-icon-cloud-upload::before{
  content:""; }

.bp3-icon-code::before{
  content:""; }

.bp3-icon-code-block::before{
  content:""; }

.bp3-icon-cog::before{
  content:""; }

.bp3-icon-collapse-all::before{
  content:""; }

.bp3-icon-column-layout::before{
  content:""; }

.bp3-icon-comment::before{
  content:""; }

.bp3-icon-comparison::before{
  content:""; }

.bp3-icon-compass::before{
  content:""; }

.bp3-icon-compressed::before{
  content:""; }

.bp3-icon-confirm::before{
  content:""; }

.bp3-icon-console::before{
  content:""; }

.bp3-icon-contrast::before{
  content:""; }

.bp3-icon-control::before{
  content:""; }

.bp3-icon-credit-card::before{
  content:""; }

.bp3-icon-cross::before{
  content:"✗"; }

.bp3-icon-crown::before{
  content:""; }

.bp3-icon-cube::before{
  content:""; }

.bp3-icon-cube-add::before{
  content:""; }

.bp3-icon-cube-remove::before{
  content:""; }

.bp3-icon-curved-range-chart::before{
  content:""; }

.bp3-icon-cut::before{
  content:""; }

.bp3-icon-dashboard::before{
  content:""; }

.bp3-icon-data-lineage::before{
  content:""; }

.bp3-icon-database::before{
  content:""; }

.bp3-icon-delete::before{
  content:""; }

.bp3-icon-delta::before{
  content:"Δ"; }

.bp3-icon-derive-column::before{
  content:""; }

.bp3-icon-desktop::before{
  content:""; }

.bp3-icon-diagnosis::before{
  content:""; }

.bp3-icon-diagram-tree::before{
  content:""; }

.bp3-icon-direction-left::before{
  content:""; }

.bp3-icon-direction-right::before{
  content:""; }

.bp3-icon-disable::before{
  content:""; }

.bp3-icon-document::before{
  content:""; }

.bp3-icon-document-open::before{
  content:""; }

.bp3-icon-document-share::before{
  content:""; }

.bp3-icon-dollar::before{
  content:"$"; }

.bp3-icon-dot::before{
  content:"•"; }

.bp3-icon-double-caret-horizontal::before{
  content:""; }

.bp3-icon-double-caret-vertical::before{
  content:""; }

.bp3-icon-double-chevron-down::before{
  content:""; }

.bp3-icon-double-chevron-left::before{
  content:""; }

.bp3-icon-double-chevron-right::before{
  content:""; }

.bp3-icon-double-chevron-up::before{
  content:""; }

.bp3-icon-doughnut-chart::before{
  content:""; }

.bp3-icon-download::before{
  content:""; }

.bp3-icon-drag-handle-horizontal::before{
  content:""; }

.bp3-icon-drag-handle-vertical::before{
  content:""; }

.bp3-icon-draw::before{
  content:""; }

.bp3-icon-drive-time::before{
  content:""; }

.bp3-icon-duplicate::before{
  content:""; }

.bp3-icon-edit::before{
  content:"✎"; }

.bp3-icon-eject::before{
  content:"⏏"; }

.bp3-icon-endorsed::before{
  content:""; }

.bp3-icon-envelope::before{
  content:"✉"; }

.bp3-icon-equals::before{
  content:""; }

.bp3-icon-eraser::before{
  content:""; }

.bp3-icon-error::before{
  content:""; }

.bp3-icon-euro::before{
  content:"€"; }

.bp3-icon-exchange::before{
  content:""; }

.bp3-icon-exclude-row::before{
  content:""; }

.bp3-icon-expand-all::before{
  content:""; }

.bp3-icon-export::before{
  content:""; }

.bp3-icon-eye-off::before{
  content:""; }

.bp3-icon-eye-on::before{
  content:""; }

.bp3-icon-eye-open::before{
  content:""; }

.bp3-icon-fast-backward::before{
  content:""; }

.bp3-icon-fast-forward::before{
  content:""; }

.bp3-icon-feed::before{
  content:""; }

.bp3-icon-feed-subscribed::before{
  content:""; }

.bp3-icon-film::before{
  content:""; }

.bp3-icon-filter::before{
  content:""; }

.bp3-icon-filter-keep::before{
  content:""; }

.bp3-icon-filter-list::before{
  content:""; }

.bp3-icon-filter-open::before{
  content:""; }

.bp3-icon-filter-remove::before{
  content:""; }

.bp3-icon-flag::before{
  content:"⚑"; }

.bp3-icon-flame::before{
  content:""; }

.bp3-icon-flash::before{
  content:""; }

.bp3-icon-floppy-disk::before{
  content:""; }

.bp3-icon-flow-branch::before{
  content:""; }

.bp3-icon-flow-end::before{
  content:""; }

.bp3-icon-flow-linear::before{
  content:""; }

.bp3-icon-flow-review::before{
  content:""; }

.bp3-icon-flow-review-branch::before{
  content:""; }

.bp3-icon-flows::before{
  content:""; }

.bp3-icon-folder-close::before{
  content:""; }

.bp3-icon-folder-new::before{
  content:""; }

.bp3-icon-folder-open::before{
  content:""; }

.bp3-icon-folder-shared::before{
  content:""; }

.bp3-icon-folder-shared-open::before{
  content:""; }

.bp3-icon-follower::before{
  content:""; }

.bp3-icon-following::before{
  content:""; }

.bp3-icon-font::before{
  content:""; }

.bp3-icon-fork::before{
  content:""; }

.bp3-icon-form::before{
  content:""; }

.bp3-icon-full-circle::before{
  content:""; }

.bp3-icon-full-stacked-chart::before{
  content:""; }

.bp3-icon-fullscreen::before{
  content:""; }

.bp3-icon-function::before{
  content:""; }

.bp3-icon-gantt-chart::before{
  content:""; }

.bp3-icon-geolocation::before{
  content:""; }

.bp3-icon-geosearch::before{
  content:""; }

.bp3-icon-git-branch::before{
  content:""; }

.bp3-icon-git-commit::before{
  content:""; }

.bp3-icon-git-merge::before{
  content:""; }

.bp3-icon-git-new-branch::before{
  content:""; }

.bp3-icon-git-pull::before{
  content:""; }

.bp3-icon-git-push::before{
  content:""; }

.bp3-icon-git-repo::before{
  content:""; }

.bp3-icon-glass::before{
  content:""; }

.bp3-icon-globe::before{
  content:""; }

.bp3-icon-globe-network::before{
  content:""; }

.bp3-icon-graph::before{
  content:""; }

.bp3-icon-graph-remove::before{
  content:""; }

.bp3-icon-greater-than::before{
  content:""; }

.bp3-icon-greater-than-or-equal-to::before{
  content:""; }

.bp3-icon-grid::before{
  content:""; }

.bp3-icon-grid-view::before{
  content:""; }

.bp3-icon-group-objects::before{
  content:""; }

.bp3-icon-grouped-bar-chart::before{
  content:""; }

.bp3-icon-hand::before{
  content:""; }

.bp3-icon-hand-down::before{
  content:""; }

.bp3-icon-hand-left::before{
  content:""; }

.bp3-icon-hand-right::before{
  content:""; }

.bp3-icon-hand-up::before{
  content:""; }

.bp3-icon-header::before{
  content:""; }

.bp3-icon-header-one::before{
  content:""; }

.bp3-icon-header-two::before{
  content:""; }

.bp3-icon-headset::before{
  content:""; }

.bp3-icon-heart::before{
  content:"♥"; }

.bp3-icon-heart-broken::before{
  content:""; }

.bp3-icon-heat-grid::before{
  content:""; }

.bp3-icon-heatmap::before{
  content:""; }

.bp3-icon-help::before{
  content:"?"; }

.bp3-icon-helper-management::before{
  content:""; }

.bp3-icon-highlight::before{
  content:""; }

.bp3-icon-history::before{
  content:""; }

.bp3-icon-home::before{
  content:"⌂"; }

.bp3-icon-horizontal-bar-chart::before{
  content:""; }

.bp3-icon-horizontal-bar-chart-asc::before{
  content:""; }

.bp3-icon-horizontal-bar-chart-desc::before{
  content:""; }

.bp3-icon-horizontal-distribution::before{
  content:""; }

.bp3-icon-id-number::before{
  content:""; }

.bp3-icon-image-rotate-left::before{
  content:""; }

.bp3-icon-image-rotate-right::before{
  content:""; }

.bp3-icon-import::before{
  content:""; }

.bp3-icon-inbox::before{
  content:""; }

.bp3-icon-inbox-filtered::before{
  content:""; }

.bp3-icon-inbox-geo::before{
  content:""; }

.bp3-icon-inbox-search::before{
  content:""; }

.bp3-icon-inbox-update::before{
  content:""; }

.bp3-icon-info-sign::before{
  content:"ℹ"; }

.bp3-icon-inheritance::before{
  content:""; }

.bp3-icon-inner-join::before{
  content:""; }

.bp3-icon-insert::before{
  content:""; }

.bp3-icon-intersection::before{
  content:""; }

.bp3-icon-ip-address::before{
  content:""; }

.bp3-icon-issue::before{
  content:""; }

.bp3-icon-issue-closed::before{
  content:""; }

.bp3-icon-issue-new::before{
  content:""; }

.bp3-icon-italic::before{
  content:""; }

.bp3-icon-join-table::before{
  content:""; }

.bp3-icon-key::before{
  content:""; }

.bp3-icon-key-backspace::before{
  content:""; }

.bp3-icon-key-command::before{
  content:""; }

.bp3-icon-key-control::before{
  content:""; }

.bp3-icon-key-delete::before{
  content:""; }

.bp3-icon-key-enter::before{
  content:""; }

.bp3-icon-key-escape::before{
  content:""; }

.bp3-icon-key-option::before{
  content:""; }

.bp3-icon-key-shift::before{
  content:""; }

.bp3-icon-key-tab::before{
  content:""; }

.bp3-icon-known-vehicle::before{
  content:""; }

.bp3-icon-lab-test::before{
  content:""; }

.bp3-icon-label::before{
  content:""; }

.bp3-icon-layer::before{
  content:""; }

.bp3-icon-layers::before{
  content:""; }

.bp3-icon-layout::before{
  content:""; }

.bp3-icon-layout-auto::before{
  content:""; }

.bp3-icon-layout-balloon::before{
  content:""; }

.bp3-icon-layout-circle::before{
  content:""; }

.bp3-icon-layout-grid::before{
  content:""; }

.bp3-icon-layout-group-by::before{
  content:""; }

.bp3-icon-layout-hierarchy::before{
  content:""; }

.bp3-icon-layout-linear::before{
  content:""; }

.bp3-icon-layout-skew-grid::before{
  content:""; }

.bp3-icon-layout-sorted-clusters::before{
  content:""; }

.bp3-icon-learning::before{
  content:""; }

.bp3-icon-left-join::before{
  content:""; }

.bp3-icon-less-than::before{
  content:""; }

.bp3-icon-less-than-or-equal-to::before{
  content:""; }

.bp3-icon-lifesaver::before{
  content:""; }

.bp3-icon-lightbulb::before{
  content:""; }

.bp3-icon-link::before{
  content:""; }

.bp3-icon-list::before{
  content:"☰"; }

.bp3-icon-list-columns::before{
  content:""; }

.bp3-icon-list-detail-view::before{
  content:""; }

.bp3-icon-locate::before{
  content:""; }

.bp3-icon-lock::before{
  content:""; }

.bp3-icon-log-in::before{
  content:""; }

.bp3-icon-log-out::before{
  content:""; }

.bp3-icon-manual::before{
  content:""; }

.bp3-icon-manually-entered-data::before{
  content:""; }

.bp3-icon-map::before{
  content:""; }

.bp3-icon-map-create::before{
  content:""; }

.bp3-icon-map-marker::before{
  content:""; }

.bp3-icon-maximize::before{
  content:""; }

.bp3-icon-media::before{
  content:""; }

.bp3-icon-menu::before{
  content:""; }

.bp3-icon-menu-closed::before{
  content:""; }

.bp3-icon-menu-open::before{
  content:""; }

.bp3-icon-merge-columns::before{
  content:""; }

.bp3-icon-merge-links::before{
  content:""; }

.bp3-icon-minimize::before{
  content:""; }

.bp3-icon-minus::before{
  content:"−"; }

.bp3-icon-mobile-phone::before{
  content:""; }

.bp3-icon-mobile-video::before{
  content:""; }

.bp3-icon-moon::before{
  content:""; }

.bp3-icon-more::before{
  content:""; }

.bp3-icon-mountain::before{
  content:""; }

.bp3-icon-move::before{
  content:""; }

.bp3-icon-mugshot::before{
  content:""; }

.bp3-icon-multi-select::before{
  content:""; }

.bp3-icon-music::before{
  content:""; }

.bp3-icon-new-drawing::before{
  content:""; }

.bp3-icon-new-grid-item::before{
  content:""; }

.bp3-icon-new-layer::before{
  content:""; }

.bp3-icon-new-layers::before{
  content:""; }

.bp3-icon-new-link::before{
  content:""; }

.bp3-icon-new-object::before{
  content:""; }

.bp3-icon-new-person::before{
  content:""; }

.bp3-icon-new-prescription::before{
  content:""; }

.bp3-icon-new-text-box::before{
  content:""; }

.bp3-icon-ninja::before{
  content:""; }

.bp3-icon-not-equal-to::before{
  content:""; }

.bp3-icon-notifications::before{
  content:""; }

.bp3-icon-notifications-updated::before{
  content:""; }

.bp3-icon-numbered-list::before{
  content:""; }

.bp3-icon-numerical::before{
  content:""; }

.bp3-icon-office::before{
  content:""; }

.bp3-icon-offline::before{
  content:""; }

.bp3-icon-oil-field::before{
  content:""; }

.bp3-icon-one-column::before{
  content:""; }

.bp3-icon-outdated::before{
  content:""; }

.bp3-icon-page-layout::before{
  content:""; }

.bp3-icon-panel-stats::before{
  content:""; }

.bp3-icon-panel-table::before{
  content:""; }

.bp3-icon-paperclip::before{
  content:""; }

.bp3-icon-paragraph::before{
  content:""; }

.bp3-icon-path::before{
  content:""; }

.bp3-icon-path-search::before{
  content:""; }

.bp3-icon-pause::before{
  content:""; }

.bp3-icon-people::before{
  content:""; }

.bp3-icon-percentage::before{
  content:""; }

.bp3-icon-person::before{
  content:""; }

.bp3-icon-phone::before{
  content:"☎"; }

.bp3-icon-pie-chart::before{
  content:""; }

.bp3-icon-pin::before{
  content:""; }

.bp3-icon-pivot::before{
  content:""; }

.bp3-icon-pivot-table::before{
  content:""; }

.bp3-icon-play::before{
  content:""; }

.bp3-icon-plus::before{
  content:"+"; }

.bp3-icon-polygon-filter::before{
  content:""; }

.bp3-icon-power::before{
  content:""; }

.bp3-icon-predictive-analysis::before{
  content:""; }

.bp3-icon-prescription::before{
  content:""; }

.bp3-icon-presentation::before{
  content:""; }

.bp3-icon-print::before{
  content:"⎙"; }

.bp3-icon-projects::before{
  content:""; }

.bp3-icon-properties::before{
  content:""; }

.bp3-icon-property::before{
  content:""; }

.bp3-icon-publish-function::before{
  content:""; }

.bp3-icon-pulse::before{
  content:""; }

.bp3-icon-random::before{
  content:""; }

.bp3-icon-record::before{
  content:""; }

.bp3-icon-redo::before{
  content:""; }

.bp3-icon-refresh::before{
  content:""; }

.bp3-icon-regression-chart::before{
  content:""; }

.bp3-icon-remove::before{
  content:""; }

.bp3-icon-remove-column::before{
  content:""; }

.bp3-icon-remove-column-left::before{
  content:""; }

.bp3-icon-remove-column-right::before{
  content:""; }

.bp3-icon-remove-row-bottom::before{
  content:""; }

.bp3-icon-remove-row-top::before{
  content:""; }

.bp3-icon-repeat::before{
  content:""; }

.bp3-icon-reset::before{
  content:""; }

.bp3-icon-resolve::before{
  content:""; }

.bp3-icon-rig::before{
  content:""; }

.bp3-icon-right-join::before{
  content:""; }

.bp3-icon-ring::before{
  content:""; }

.bp3-icon-rotate-document::before{
  content:""; }

.bp3-icon-rotate-page::before{
  content:""; }

.bp3-icon-satellite::before{
  content:""; }

.bp3-icon-saved::before{
  content:""; }

.bp3-icon-scatter-plot::before{
  content:""; }

.bp3-icon-search::before{
  content:""; }

.bp3-icon-search-around::before{
  content:""; }

.bp3-icon-search-template::before{
  content:""; }

.bp3-icon-search-text::before{
  content:""; }

.bp3-icon-segmented-control::before{
  content:""; }

.bp3-icon-select::before{
  content:""; }

.bp3-icon-selection::before{
  content:"⦿"; }

.bp3-icon-send-to::before{
  content:""; }

.bp3-icon-send-to-graph::before{
  content:""; }

.bp3-icon-send-to-map::before{
  content:""; }

.bp3-icon-series-add::before{
  content:""; }

.bp3-icon-series-configuration::before{
  content:""; }

.bp3-icon-series-derived::before{
  content:""; }

.bp3-icon-series-filtered::before{
  content:""; }

.bp3-icon-series-search::before{
  content:""; }

.bp3-icon-settings::before{
  content:""; }

.bp3-icon-share::before{
  content:""; }

.bp3-icon-shield::before{
  content:""; }

.bp3-icon-shop::before{
  content:""; }

.bp3-icon-shopping-cart::before{
  content:""; }

.bp3-icon-signal-search::before{
  content:""; }

.bp3-icon-sim-card::before{
  content:""; }

.bp3-icon-slash::before{
  content:""; }

.bp3-icon-small-cross::before{
  content:""; }

.bp3-icon-small-minus::before{
  content:""; }

.bp3-icon-small-plus::before{
  content:""; }

.bp3-icon-small-tick::before{
  content:""; }

.bp3-icon-snowflake::before{
  content:""; }

.bp3-icon-social-media::before{
  content:""; }

.bp3-icon-sort::before{
  content:""; }

.bp3-icon-sort-alphabetical::before{
  content:""; }

.bp3-icon-sort-alphabetical-desc::before{
  content:""; }

.bp3-icon-sort-asc::before{
  content:""; }

.bp3-icon-sort-desc::before{
  content:""; }

.bp3-icon-sort-numerical::before{
  content:""; }

.bp3-icon-sort-numerical-desc::before{
  content:""; }

.bp3-icon-split-columns::before{
  content:""; }

.bp3-icon-square::before{
  content:""; }

.bp3-icon-stacked-chart::before{
  content:""; }

.bp3-icon-star::before{
  content:"★"; }

.bp3-icon-star-empty::before{
  content:"☆"; }

.bp3-icon-step-backward::before{
  content:""; }

.bp3-icon-step-chart::before{
  content:""; }

.bp3-icon-step-forward::before{
  content:""; }

.bp3-icon-stop::before{
  content:""; }

.bp3-icon-stopwatch::before{
  content:""; }

.bp3-icon-strikethrough::before{
  content:""; }

.bp3-icon-style::before{
  content:""; }

.bp3-icon-swap-horizontal::before{
  content:""; }

.bp3-icon-swap-vertical::before{
  content:""; }

.bp3-icon-symbol-circle::before{
  content:""; }

.bp3-icon-symbol-cross::before{
  content:""; }

.bp3-icon-symbol-diamond::before{
  content:""; }

.bp3-icon-symbol-square::before{
  content:""; }

.bp3-icon-symbol-triangle-down::before{
  content:""; }

.bp3-icon-symbol-triangle-up::before{
  content:""; }

.bp3-icon-tag::before{
  content:""; }

.bp3-icon-take-action::before{
  content:""; }

.bp3-icon-taxi::before{
  content:""; }

.bp3-icon-text-highlight::before{
  content:""; }

.bp3-icon-th::before{
  content:""; }

.bp3-icon-th-derived::before{
  content:""; }

.bp3-icon-th-disconnect::before{
  content:""; }

.bp3-icon-th-filtered::before{
  content:""; }

.bp3-icon-th-list::before{
  content:""; }

.bp3-icon-thumbs-down::before{
  content:""; }

.bp3-icon-thumbs-up::before{
  content:""; }

.bp3-icon-tick::before{
  content:"✓"; }

.bp3-icon-tick-circle::before{
  content:""; }

.bp3-icon-time::before{
  content:"⏲"; }

.bp3-icon-timeline-area-chart::before{
  content:""; }

.bp3-icon-timeline-bar-chart::before{
  content:""; }

.bp3-icon-timeline-events::before{
  content:""; }

.bp3-icon-timeline-line-chart::before{
  content:""; }

.bp3-icon-tint::before{
  content:""; }

.bp3-icon-torch::before{
  content:""; }

.bp3-icon-tractor::before{
  content:""; }

.bp3-icon-train::before{
  content:""; }

.bp3-icon-translate::before{
  content:""; }

.bp3-icon-trash::before{
  content:""; }

.bp3-icon-tree::before{
  content:""; }

.bp3-icon-trending-down::before{
  content:""; }

.bp3-icon-trending-up::before{
  content:""; }

.bp3-icon-truck::before{
  content:""; }

.bp3-icon-two-columns::before{
  content:""; }

.bp3-icon-unarchive::before{
  content:""; }

.bp3-icon-underline::before{
  content:"⎁"; }

.bp3-icon-undo::before{
  content:"⎌"; }

.bp3-icon-ungroup-objects::before{
  content:""; }

.bp3-icon-unknown-vehicle::before{
  content:""; }

.bp3-icon-unlock::before{
  content:""; }

.bp3-icon-unpin::before{
  content:""; }

.bp3-icon-unresolve::before{
  content:""; }

.bp3-icon-updated::before{
  content:""; }

.bp3-icon-upload::before{
  content:""; }

.bp3-icon-user::before{
  content:""; }

.bp3-icon-variable::before{
  content:""; }

.bp3-icon-vertical-bar-chart-asc::before{
  content:""; }

.bp3-icon-vertical-bar-chart-desc::before{
  content:""; }

.bp3-icon-vertical-distribution::before{
  content:""; }

.bp3-icon-video::before{
  content:""; }

.bp3-icon-volume-down::before{
  content:""; }

.bp3-icon-volume-off::before{
  content:""; }

.bp3-icon-volume-up::before{
  content:""; }

.bp3-icon-walk::before{
  content:""; }

.bp3-icon-warning-sign::before{
  content:""; }

.bp3-icon-waterfall-chart::before{
  content:""; }

.bp3-icon-widget::before{
  content:""; }

.bp3-icon-widget-button::before{
  content:""; }

.bp3-icon-widget-footer::before{
  content:""; }

.bp3-icon-widget-header::before{
  content:""; }

.bp3-icon-wrench::before{
  content:""; }

.bp3-icon-zoom-in::before{
  content:""; }

.bp3-icon-zoom-out::before{
  content:""; }

.bp3-icon-zoom-to-fit::before{
  content:""; }
.bp3-submenu > .bp3-popover-wrapper{
  display:block; }

.bp3-submenu .bp3-popover-target{
  display:block; }
  .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-menu-item{ }

.bp3-submenu.bp3-popover{
  -webkit-box-shadow:none;
          box-shadow:none;
  padding:0 5px; }
  .bp3-submenu.bp3-popover > .bp3-popover-content{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2); }
  .bp3-dark .bp3-submenu.bp3-popover, .bp3-submenu.bp3-popover.bp3-dark{
    -webkit-box-shadow:none;
            box-shadow:none; }
    .bp3-dark .bp3-submenu.bp3-popover > .bp3-popover-content, .bp3-submenu.bp3-popover.bp3-dark > .bp3-popover-content{
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4); }
.bp3-menu{
  background:#ffffff;
  border-radius:3px;
  color:#182026;
  list-style:none;
  margin:0;
  min-width:180px;
  padding:5px;
  text-align:left; }

.bp3-menu-divider{
  border-top:1px solid rgba(16, 22, 26, 0.15);
  display:block;
  margin:5px; }
  .bp3-dark .bp3-menu-divider{
    border-top-color:rgba(255, 255, 255, 0.15); }

.bp3-menu-item{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:horizontal;
  -webkit-box-direction:normal;
      -ms-flex-direction:row;
          flex-direction:row;
  -webkit-box-align:start;
      -ms-flex-align:start;
          align-items:flex-start;
  border-radius:2px;
  color:inherit;
  line-height:20px;
  padding:5px 7px;
  text-decoration:none;
  -webkit-user-select:none;
     -moz-user-select:none;
      -ms-user-select:none;
          user-select:none; }
  .bp3-menu-item > *{
    -webkit-box-flex:0;
        -ms-flex-positive:0;
            flex-grow:0;
    -ms-flex-negative:0;
        flex-shrink:0; }
  .bp3-menu-item > .bp3-fill{
    -webkit-box-flex:1;
        -ms-flex-positive:1;
            flex-grow:1;
    -ms-flex-negative:1;
        flex-shrink:1; }
  .bp3-menu-item::before,
  .bp3-menu-item > *{
    margin-right:7px; }
  .bp3-menu-item:empty::before,
  .bp3-menu-item > :last-child{
    margin-right:0; }
  .bp3-menu-item > .bp3-fill{
    word-break:break-word; }
  .bp3-menu-item:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-menu-item{
    background-color:rgba(167, 182, 194, 0.3);
    cursor:pointer;
    text-decoration:none; }
  .bp3-menu-item.bp3-disabled{
    background-color:inherit;
    color:rgba(92, 112, 128, 0.6);
    cursor:not-allowed; }
  .bp3-dark .bp3-menu-item{
    color:inherit; }
    .bp3-dark .bp3-menu-item:hover, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-menu-item, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-menu-item{
      background-color:rgba(138, 155, 168, 0.15);
      color:inherit; }
    .bp3-dark .bp3-menu-item.bp3-disabled{
      background-color:inherit;
      color:rgba(167, 182, 194, 0.6); }
  .bp3-menu-item.bp3-intent-primary{
    color:#106ba3; }
    .bp3-menu-item.bp3-intent-primary .bp3-icon{
      color:inherit; }
    .bp3-menu-item.bp3-intent-primary::before, .bp3-menu-item.bp3-intent-primary::after,
    .bp3-menu-item.bp3-intent-primary .bp3-menu-item-label{
      color:#106ba3; }
    .bp3-menu-item.bp3-intent-primary:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item, .bp3-menu-item.bp3-intent-primary.bp3-active{
      background-color:#137cbd; }
    .bp3-menu-item.bp3-intent-primary:active{
      background-color:#106ba3; }
    .bp3-menu-item.bp3-intent-primary:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item, .bp3-menu-item.bp3-intent-primary:hover::before, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item::before, .bp3-menu-item.bp3-intent-primary:hover::after, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item::after,
    .bp3-menu-item.bp3-intent-primary:hover .bp3-menu-item-label,
    .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item .bp3-menu-item-label, .bp3-menu-item.bp3-intent-primary:active, .bp3-menu-item.bp3-intent-primary:active::before, .bp3-menu-item.bp3-intent-primary:active::after,
    .bp3-menu-item.bp3-intent-primary:active .bp3-menu-item-label, .bp3-menu-item.bp3-intent-primary.bp3-active, .bp3-menu-item.bp3-intent-primary.bp3-active::before, .bp3-menu-item.bp3-intent-primary.bp3-active::after,
    .bp3-menu-item.bp3-intent-primary.bp3-active .bp3-menu-item-label{
      color:#ffffff; }
  .bp3-menu-item.bp3-intent-success{
    color:#0d8050; }
    .bp3-menu-item.bp3-intent-success .bp3-icon{
      color:inherit; }
    .bp3-menu-item.bp3-intent-success::before, .bp3-menu-item.bp3-intent-success::after,
    .bp3-menu-item.bp3-intent-success .bp3-menu-item-label{
      color:#0d8050; }
    .bp3-menu-item.bp3-intent-success:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item, .bp3-menu-item.bp3-intent-success.bp3-active{
      background-color:#0f9960; }
    .bp3-menu-item.bp3-intent-success:active{
      background-color:#0d8050; }
    .bp3-menu-item.bp3-intent-success:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item, .bp3-menu-item.bp3-intent-success:hover::before, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item::before, .bp3-menu-item.bp3-intent-success:hover::after, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item::after,
    .bp3-menu-item.bp3-intent-success:hover .bp3-menu-item-label,
    .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item .bp3-menu-item-label, .bp3-menu-item.bp3-intent-success:active, .bp3-menu-item.bp3-intent-success:active::before, .bp3-menu-item.bp3-intent-success:active::after,
    .bp3-menu-item.bp3-intent-success:active .bp3-menu-item-label, .bp3-menu-item.bp3-intent-success.bp3-active, .bp3-menu-item.bp3-intent-success.bp3-active::before, .bp3-menu-item.bp3-intent-success.bp3-active::after,
    .bp3-menu-item.bp3-intent-success.bp3-active .bp3-menu-item-label{
      color:#ffffff; }
  .bp3-menu-item.bp3-intent-warning{
    color:#bf7326; }
    .bp3-menu-item.bp3-intent-warning .bp3-icon{
      color:inherit; }
    .bp3-menu-item.bp3-intent-warning::before, .bp3-menu-item.bp3-intent-warning::after,
    .bp3-menu-item.bp3-intent-warning .bp3-menu-item-label{
      color:#bf7326; }
    .bp3-menu-item.bp3-intent-warning:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item, .bp3-menu-item.bp3-intent-warning.bp3-active{
      background-color:#d9822b; }
    .bp3-menu-item.bp3-intent-warning:active{
      background-color:#bf7326; }
    .bp3-menu-item.bp3-intent-warning:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item, .bp3-menu-item.bp3-intent-warning:hover::before, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item::before, .bp3-menu-item.bp3-intent-warning:hover::after, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item::after,
    .bp3-menu-item.bp3-intent-warning:hover .bp3-menu-item-label,
    .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item .bp3-menu-item-label, .bp3-menu-item.bp3-intent-warning:active, .bp3-menu-item.bp3-intent-warning:active::before, .bp3-menu-item.bp3-intent-warning:active::after,
    .bp3-menu-item.bp3-intent-warning:active .bp3-menu-item-label, .bp3-menu-item.bp3-intent-warning.bp3-active, .bp3-menu-item.bp3-intent-warning.bp3-active::before, .bp3-menu-item.bp3-intent-warning.bp3-active::after,
    .bp3-menu-item.bp3-intent-warning.bp3-active .bp3-menu-item-label{
      color:#ffffff; }
  .bp3-menu-item.bp3-intent-danger{
    color:#c23030; }
    .bp3-menu-item.bp3-intent-danger .bp3-icon{
      color:inherit; }
    .bp3-menu-item.bp3-intent-danger::before, .bp3-menu-item.bp3-intent-danger::after,
    .bp3-menu-item.bp3-intent-danger .bp3-menu-item-label{
      color:#c23030; }
    .bp3-menu-item.bp3-intent-danger:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item, .bp3-menu-item.bp3-intent-danger.bp3-active{
      background-color:#db3737; }
    .bp3-menu-item.bp3-intent-danger:active{
      background-color:#c23030; }
    .bp3-menu-item.bp3-intent-danger:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item, .bp3-menu-item.bp3-intent-danger:hover::before, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item::before, .bp3-menu-item.bp3-intent-danger:hover::after, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item::after,
    .bp3-menu-item.bp3-intent-danger:hover .bp3-menu-item-label,
    .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item .bp3-menu-item-label, .bp3-menu-item.bp3-intent-danger:active, .bp3-menu-item.bp3-intent-danger:active::before, .bp3-menu-item.bp3-intent-danger:active::after,
    .bp3-menu-item.bp3-intent-danger:active .bp3-menu-item-label, .bp3-menu-item.bp3-intent-danger.bp3-active, .bp3-menu-item.bp3-intent-danger.bp3-active::before, .bp3-menu-item.bp3-intent-danger.bp3-active::after,
    .bp3-menu-item.bp3-intent-danger.bp3-active .bp3-menu-item-label{
      color:#ffffff; }
  .bp3-menu-item::before{
    font-family:"Icons16", sans-serif;
    font-size:16px;
    font-style:normal;
    font-weight:400;
    line-height:1;
    -moz-osx-font-smoothing:grayscale;
    -webkit-font-smoothing:antialiased;
    margin-right:7px; }
  .bp3-menu-item::before,
  .bp3-menu-item > .bp3-icon{
    color:#5c7080;
    margin-top:2px; }
  .bp3-menu-item .bp3-menu-item-label{
    color:#5c7080; }
  .bp3-menu-item:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-menu-item{
    color:inherit; }
  .bp3-menu-item.bp3-active, .bp3-menu-item:active{
    background-color:rgba(115, 134, 148, 0.3); }
  .bp3-menu-item.bp3-disabled{
    background-color:inherit !important;
    color:rgba(92, 112, 128, 0.6) !important;
    cursor:not-allowed !important;
    outline:none !important; }
    .bp3-menu-item.bp3-disabled::before,
    .bp3-menu-item.bp3-disabled > .bp3-icon,
    .bp3-menu-item.bp3-disabled .bp3-menu-item-label{
      color:rgba(92, 112, 128, 0.6) !important; }
  .bp3-large .bp3-menu-item{
    font-size:16px;
    line-height:22px;
    padding:9px 7px; }
    .bp3-large .bp3-menu-item .bp3-icon{
      margin-top:3px; }
    .bp3-large .bp3-menu-item::before{
      font-family:"Icons20", sans-serif;
      font-size:20px;
      font-style:normal;
      font-weight:400;
      line-height:1;
      -moz-osx-font-smoothing:grayscale;
      -webkit-font-smoothing:antialiased;
      margin-right:10px;
      margin-top:1px; }

button.bp3-menu-item{
  background:none;
  border:none;
  text-align:left;
  width:100%; }
.bp3-menu-header{
  border-top:1px solid rgba(16, 22, 26, 0.15);
  display:block;
  margin:5px;
  cursor:default;
  padding-left:2px; }
  .bp3-dark .bp3-menu-header{
    border-top-color:rgba(255, 255, 255, 0.15); }
  .bp3-menu-header:first-of-type{
    border-top:none; }
  .bp3-menu-header > h6{
    color:#182026;
    font-weight:600;
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
    word-wrap:normal;
    line-height:17px;
    margin:0;
    padding:10px 7px 0 1px; }
    .bp3-dark .bp3-menu-header > h6{
      color:#f5f8fa; }
  .bp3-menu-header:first-of-type > h6{
    padding-top:0; }
  .bp3-large .bp3-menu-header > h6{
    font-size:18px;
    padding-bottom:5px;
    padding-top:15px; }
  .bp3-large .bp3-menu-header:first-of-type > h6{
    padding-top:0; }

.bp3-dark .bp3-menu{
  background:#30404d;
  color:#f5f8fa; }

.bp3-dark .bp3-menu-item{ }
  .bp3-dark .bp3-menu-item.bp3-intent-primary{
    color:#48aff0; }
    .bp3-dark .bp3-menu-item.bp3-intent-primary .bp3-icon{
      color:inherit; }
    .bp3-dark .bp3-menu-item.bp3-intent-primary::before, .bp3-dark .bp3-menu-item.bp3-intent-primary::after,
    .bp3-dark .bp3-menu-item.bp3-intent-primary .bp3-menu-item-label{
      color:#48aff0; }
    .bp3-dark .bp3-menu-item.bp3-intent-primary:hover, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item, .bp3-dark .bp3-menu-item.bp3-intent-primary.bp3-active{
      background-color:#137cbd; }
    .bp3-dark .bp3-menu-item.bp3-intent-primary:active{
      background-color:#106ba3; }
    .bp3-dark .bp3-menu-item.bp3-intent-primary:hover, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item, .bp3-dark .bp3-menu-item.bp3-intent-primary:hover::before, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item::before, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item::before, .bp3-dark .bp3-menu-item.bp3-intent-primary:hover::after, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item::after, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item::after,
    .bp3-dark .bp3-menu-item.bp3-intent-primary:hover .bp3-menu-item-label,
    .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item .bp3-menu-item-label,
    .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item .bp3-menu-item-label, .bp3-dark .bp3-menu-item.bp3-intent-primary:active, .bp3-dark .bp3-menu-item.bp3-intent-primary:active::before, .bp3-dark .bp3-menu-item.bp3-intent-primary:active::after,
    .bp3-dark .bp3-menu-item.bp3-intent-primary:active .bp3-menu-item-label, .bp3-dark .bp3-menu-item.bp3-intent-primary.bp3-active, .bp3-dark .bp3-menu-item.bp3-intent-primary.bp3-active::before, .bp3-dark .bp3-menu-item.bp3-intent-primary.bp3-active::after,
    .bp3-dark .bp3-menu-item.bp3-intent-primary.bp3-active .bp3-menu-item-label{
      color:#ffffff; }
  .bp3-dark .bp3-menu-item.bp3-intent-success{
    color:#3dcc91; }
    .bp3-dark .bp3-menu-item.bp3-intent-success .bp3-icon{
      color:inherit; }
    .bp3-dark .bp3-menu-item.bp3-intent-success::before, .bp3-dark .bp3-menu-item.bp3-intent-success::after,
    .bp3-dark .bp3-menu-item.bp3-intent-success .bp3-menu-item-label{
      color:#3dcc91; }
    .bp3-dark .bp3-menu-item.bp3-intent-success:hover, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item, .bp3-dark .bp3-menu-item.bp3-intent-success.bp3-active{
      background-color:#0f9960; }
    .bp3-dark .bp3-menu-item.bp3-intent-success:active{
      background-color:#0d8050; }
    .bp3-dark .bp3-menu-item.bp3-intent-success:hover, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item, .bp3-dark .bp3-menu-item.bp3-intent-success:hover::before, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item::before, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item::before, .bp3-dark .bp3-menu-item.bp3-intent-success:hover::after, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item::after, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item::after,
    .bp3-dark .bp3-menu-item.bp3-intent-success:hover .bp3-menu-item-label,
    .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item .bp3-menu-item-label,
    .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item .bp3-menu-item-label, .bp3-dark .bp3-menu-item.bp3-intent-success:active, .bp3-dark .bp3-menu-item.bp3-intent-success:active::before, .bp3-dark .bp3-menu-item.bp3-intent-success:active::after,
    .bp3-dark .bp3-menu-item.bp3-intent-success:active .bp3-menu-item-label, .bp3-dark .bp3-menu-item.bp3-intent-success.bp3-active, .bp3-dark .bp3-menu-item.bp3-intent-success.bp3-active::before, .bp3-dark .bp3-menu-item.bp3-intent-success.bp3-active::after,
    .bp3-dark .bp3-menu-item.bp3-intent-success.bp3-active .bp3-menu-item-label{
      color:#ffffff; }
  .bp3-dark .bp3-menu-item.bp3-intent-warning{
    color:#ffb366; }
    .bp3-dark .bp3-menu-item.bp3-intent-warning .bp3-icon{
      color:inherit; }
    .bp3-dark .bp3-menu-item.bp3-intent-warning::before, .bp3-dark .bp3-menu-item.bp3-intent-warning::after,
    .bp3-dark .bp3-menu-item.bp3-intent-warning .bp3-menu-item-label{
      color:#ffb366; }
    .bp3-dark .bp3-menu-item.bp3-intent-warning:hover, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item, .bp3-dark .bp3-menu-item.bp3-intent-warning.bp3-active{
      background-color:#d9822b; }
    .bp3-dark .bp3-menu-item.bp3-intent-warning:active{
      background-color:#bf7326; }
    .bp3-dark .bp3-menu-item.bp3-intent-warning:hover, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item, .bp3-dark .bp3-menu-item.bp3-intent-warning:hover::before, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item::before, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item::before, .bp3-dark .bp3-menu-item.bp3-intent-warning:hover::after, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item::after, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item::after,
    .bp3-dark .bp3-menu-item.bp3-intent-warning:hover .bp3-menu-item-label,
    .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item .bp3-menu-item-label,
    .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item .bp3-menu-item-label, .bp3-dark .bp3-menu-item.bp3-intent-warning:active, .bp3-dark .bp3-menu-item.bp3-intent-warning:active::before, .bp3-dark .bp3-menu-item.bp3-intent-warning:active::after,
    .bp3-dark .bp3-menu-item.bp3-intent-warning:active .bp3-menu-item-label, .bp3-dark .bp3-menu-item.bp3-intent-warning.bp3-active, .bp3-dark .bp3-menu-item.bp3-intent-warning.bp3-active::before, .bp3-dark .bp3-menu-item.bp3-intent-warning.bp3-active::after,
    .bp3-dark .bp3-menu-item.bp3-intent-warning.bp3-active .bp3-menu-item-label{
      color:#ffffff; }
  .bp3-dark .bp3-menu-item.bp3-intent-danger{
    color:#ff7373; }
    .bp3-dark .bp3-menu-item.bp3-intent-danger .bp3-icon{
      color:inherit; }
    .bp3-dark .bp3-menu-item.bp3-intent-danger::before, .bp3-dark .bp3-menu-item.bp3-intent-danger::after,
    .bp3-dark .bp3-menu-item.bp3-intent-danger .bp3-menu-item-label{
      color:#ff7373; }
    .bp3-dark .bp3-menu-item.bp3-intent-danger:hover, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item, .bp3-dark .bp3-menu-item.bp3-intent-danger.bp3-active{
      background-color:#db3737; }
    .bp3-dark .bp3-menu-item.bp3-intent-danger:active{
      background-color:#c23030; }
    .bp3-dark .bp3-menu-item.bp3-intent-danger:hover, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item, .bp3-dark .bp3-menu-item.bp3-intent-danger:hover::before, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item::before, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item::before, .bp3-dark .bp3-menu-item.bp3-intent-danger:hover::after, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item::after, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item::after,
    .bp3-dark .bp3-menu-item.bp3-intent-danger:hover .bp3-menu-item-label,
    .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item .bp3-menu-item-label,
    .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item .bp3-menu-item-label, .bp3-dark .bp3-menu-item.bp3-intent-danger:active, .bp3-dark .bp3-menu-item.bp3-intent-danger:active::before, .bp3-dark .bp3-menu-item.bp3-intent-danger:active::after,
    .bp3-dark .bp3-menu-item.bp3-intent-danger:active .bp3-menu-item-label, .bp3-dark .bp3-menu-item.bp3-intent-danger.bp3-active, .bp3-dark .bp3-menu-item.bp3-intent-danger.bp3-active::before, .bp3-dark .bp3-menu-item.bp3-intent-danger.bp3-active::after,
    .bp3-dark .bp3-menu-item.bp3-intent-danger.bp3-active .bp3-menu-item-label{
      color:#ffffff; }
  .bp3-dark .bp3-menu-item::before,
  .bp3-dark .bp3-menu-item > .bp3-icon{
    color:#a7b6c2; }
  .bp3-dark .bp3-menu-item .bp3-menu-item-label{
    color:#a7b6c2; }
  .bp3-dark .bp3-menu-item.bp3-active, .bp3-dark .bp3-menu-item:active{
    background-color:rgba(138, 155, 168, 0.3); }
  .bp3-dark .bp3-menu-item.bp3-disabled{
    color:rgba(167, 182, 194, 0.6) !important; }
    .bp3-dark .bp3-menu-item.bp3-disabled::before,
    .bp3-dark .bp3-menu-item.bp3-disabled > .bp3-icon,
    .bp3-dark .bp3-menu-item.bp3-disabled .bp3-menu-item-label{
      color:rgba(167, 182, 194, 0.6) !important; }

.bp3-dark .bp3-menu-divider,
.bp3-dark .bp3-menu-header{
  border-color:rgba(255, 255, 255, 0.15); }

.bp3-dark .bp3-menu-header > h6{
  color:#f5f8fa; }

.bp3-label .bp3-menu{
  margin-top:5px; }
.bp3-navbar{
  background-color:#ffffff;
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.2);
  height:50px;
  padding:0 15px;
  position:relative;
  width:100%;
  z-index:10; }
  .bp3-navbar.bp3-dark,
  .bp3-dark .bp3-navbar{
    background-color:#394b59; }
  .bp3-navbar.bp3-dark{
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-navbar{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4); }
  .bp3-navbar.bp3-fixed-top{
    left:0;
    position:fixed;
    right:0;
    top:0; }

.bp3-navbar-heading{
  font-size:16px;
  margin-right:15px; }

.bp3-navbar-group{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  height:50px; }
  .bp3-navbar-group.bp3-align-left{
    float:left; }
  .bp3-navbar-group.bp3-align-right{
    float:right; }

.bp3-navbar-divider{
  border-left:1px solid rgba(16, 22, 26, 0.15);
  height:20px;
  margin:0 10px; }
  .bp3-dark .bp3-navbar-divider{
    border-left-color:rgba(255, 255, 255, 0.15); }
.bp3-non-ideal-state{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:vertical;
  -webkit-box-direction:normal;
      -ms-flex-direction:column;
          flex-direction:column;
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  height:100%;
  -webkit-box-pack:center;
      -ms-flex-pack:center;
          justify-content:center;
  text-align:center;
  width:100%; }
  .bp3-non-ideal-state > *{
    -webkit-box-flex:0;
        -ms-flex-positive:0;
            flex-grow:0;
    -ms-flex-negative:0;
        flex-shrink:0; }
  .bp3-non-ideal-state > .bp3-fill{
    -webkit-box-flex:1;
        -ms-flex-positive:1;
            flex-grow:1;
    -ms-flex-negative:1;
        flex-shrink:1; }
  .bp3-non-ideal-state::before,
  .bp3-non-ideal-state > *{
    margin-bottom:20px; }
  .bp3-non-ideal-state:empty::before,
  .bp3-non-ideal-state > :last-child{
    margin-bottom:0; }
  .bp3-non-ideal-state > *{
    max-width:400px; }

.bp3-non-ideal-state-visual{
  color:rgba(92, 112, 128, 0.6);
  font-size:60px; }
  .bp3-dark .bp3-non-ideal-state-visual{
    color:rgba(167, 182, 194, 0.6); }

.bp3-overflow-list{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -ms-flex-wrap:nowrap;
      flex-wrap:nowrap;
  min-width:0; }

.bp3-overflow-list-spacer{
  -ms-flex-negative:1;
      flex-shrink:1;
  width:1px; }

body.bp3-overlay-open{
  overflow:hidden; }

.bp3-overlay{
  bottom:0;
  left:0;
  position:static;
  right:0;
  top:0;
  z-index:20; }
  .bp3-overlay:not(.bp3-overlay-open){
    pointer-events:none; }
  .bp3-overlay.bp3-overlay-container{
    overflow:hidden;
    position:fixed; }
    .bp3-overlay.bp3-overlay-container.bp3-overlay-inline{
      position:absolute; }
  .bp3-overlay.bp3-overlay-scroll-container{
    overflow:auto;
    position:fixed; }
    .bp3-overlay.bp3-overlay-scroll-container.bp3-overlay-inline{
      position:absolute; }
  .bp3-overlay.bp3-overlay-inline{
    display:inline;
    overflow:visible; }

.bp3-overlay-content{
  position:fixed;
  z-index:20; }
  .bp3-overlay-inline .bp3-overlay-content,
  .bp3-overlay-scroll-container .bp3-overlay-content{
    position:absolute; }

.bp3-overlay-backdrop{
  bottom:0;
  left:0;
  position:fixed;
  right:0;
  top:0;
  opacity:1;
  background-color:rgba(16, 22, 26, 0.7);
  overflow:auto;
  -webkit-user-select:none;
     -moz-user-select:none;
      -ms-user-select:none;
          user-select:none;
  z-index:20; }
  .bp3-overlay-backdrop.bp3-overlay-enter, .bp3-overlay-backdrop.bp3-overlay-appear{
    opacity:0; }
  .bp3-overlay-backdrop.bp3-overlay-enter-active, .bp3-overlay-backdrop.bp3-overlay-appear-active{
    opacity:1;
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:200ms;
            transition-duration:200ms;
    -webkit-transition-property:opacity;
    transition-property:opacity;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-overlay-backdrop.bp3-overlay-exit{
    opacity:1; }
  .bp3-overlay-backdrop.bp3-overlay-exit-active{
    opacity:0;
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:200ms;
            transition-duration:200ms;
    -webkit-transition-property:opacity;
    transition-property:opacity;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-overlay-backdrop:focus{
    outline:none; }
  .bp3-overlay-inline .bp3-overlay-backdrop{
    position:absolute; }
.bp3-panel-stack{
  overflow:hidden;
  position:relative; }

.bp3-panel-stack-header{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  -webkit-box-shadow:0 1px rgba(16, 22, 26, 0.15);
          box-shadow:0 1px rgba(16, 22, 26, 0.15);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -ms-flex-negative:0;
      flex-shrink:0;
  height:30px;
  z-index:1; }
  .bp3-dark .bp3-panel-stack-header{
    -webkit-box-shadow:0 1px rgba(255, 255, 255, 0.15);
            box-shadow:0 1px rgba(255, 255, 255, 0.15); }
  .bp3-panel-stack-header > span{
    -webkit-box-align:stretch;
        -ms-flex-align:stretch;
            align-items:stretch;
    display:-webkit-box;
    display:-ms-flexbox;
    display:flex;
    -webkit-box-flex:1;
        -ms-flex:1;
            flex:1; }
  .bp3-panel-stack-header .bp3-heading{
    margin:0 5px; }

.bp3-button.bp3-panel-stack-header-back{
  margin-left:5px;
  padding-left:0;
  white-space:nowrap; }
  .bp3-button.bp3-panel-stack-header-back .bp3-icon{
    margin:0 2px; }

.bp3-panel-stack-view{
  bottom:0;
  left:0;
  position:absolute;
  right:0;
  top:0;
  background-color:#ffffff;
  border-right:1px solid rgba(16, 22, 26, 0.15);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:vertical;
  -webkit-box-direction:normal;
      -ms-flex-direction:column;
          flex-direction:column;
  margin-right:-1px;
  overflow-y:auto;
  z-index:1; }
  .bp3-dark .bp3-panel-stack-view{
    background-color:#30404d; }
  .bp3-panel-stack-view:nth-last-child(n + 4){
    display:none; }

.bp3-panel-stack-push .bp3-panel-stack-enter, .bp3-panel-stack-push .bp3-panel-stack-appear{
  -webkit-transform:translateX(100%);
          transform:translateX(100%);
  opacity:0; }

.bp3-panel-stack-push .bp3-panel-stack-enter-active, .bp3-panel-stack-push .bp3-panel-stack-appear-active{
  -webkit-transform:translate(0%);
          transform:translate(0%);
  opacity:1;
  -webkit-transition-delay:0;
          transition-delay:0;
  -webkit-transition-duration:400ms;
          transition-duration:400ms;
  -webkit-transition-property:opacity, -webkit-transform;
  transition-property:opacity, -webkit-transform;
  transition-property:transform, opacity;
  transition-property:transform, opacity, -webkit-transform;
  -webkit-transition-timing-function:ease;
          transition-timing-function:ease; }

.bp3-panel-stack-push .bp3-panel-stack-exit{
  -webkit-transform:translate(0%);
          transform:translate(0%);
  opacity:1; }

.bp3-panel-stack-push .bp3-panel-stack-exit-active{
  -webkit-transform:translateX(-50%);
          transform:translateX(-50%);
  opacity:0;
  -webkit-transition-delay:0;
          transition-delay:0;
  -webkit-transition-duration:400ms;
          transition-duration:400ms;
  -webkit-transition-property:opacity, -webkit-transform;
  transition-property:opacity, -webkit-transform;
  transition-property:transform, opacity;
  transition-property:transform, opacity, -webkit-transform;
  -webkit-transition-timing-function:ease;
          transition-timing-function:ease; }

.bp3-panel-stack-pop .bp3-panel-stack-enter, .bp3-panel-stack-pop .bp3-panel-stack-appear{
  -webkit-transform:translateX(-50%);
          transform:translateX(-50%);
  opacity:0; }

.bp3-panel-stack-pop .bp3-panel-stack-enter-active, .bp3-panel-stack-pop .bp3-panel-stack-appear-active{
  -webkit-transform:translate(0%);
          transform:translate(0%);
  opacity:1;
  -webkit-transition-delay:0;
          transition-delay:0;
  -webkit-transition-duration:400ms;
          transition-duration:400ms;
  -webkit-transition-property:opacity, -webkit-transform;
  transition-property:opacity, -webkit-transform;
  transition-property:transform, opacity;
  transition-property:transform, opacity, -webkit-transform;
  -webkit-transition-timing-function:ease;
          transition-timing-function:ease; }

.bp3-panel-stack-pop .bp3-panel-stack-exit{
  -webkit-transform:translate(0%);
          transform:translate(0%);
  opacity:1; }

.bp3-panel-stack-pop .bp3-panel-stack-exit-active{
  -webkit-transform:translateX(100%);
          transform:translateX(100%);
  opacity:0;
  -webkit-transition-delay:0;
          transition-delay:0;
  -webkit-transition-duration:400ms;
          transition-duration:400ms;
  -webkit-transition-property:opacity, -webkit-transform;
  transition-property:opacity, -webkit-transform;
  transition-property:transform, opacity;
  transition-property:transform, opacity, -webkit-transform;
  -webkit-transition-timing-function:ease;
          transition-timing-function:ease; }
.bp3-panel-stack2{
  overflow:hidden;
  position:relative; }

.bp3-panel-stack2-header{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  -webkit-box-shadow:0 1px rgba(16, 22, 26, 0.15);
          box-shadow:0 1px rgba(16, 22, 26, 0.15);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -ms-flex-negative:0;
      flex-shrink:0;
  height:30px;
  z-index:1; }
  .bp3-dark .bp3-panel-stack2-header{
    -webkit-box-shadow:0 1px rgba(255, 255, 255, 0.15);
            box-shadow:0 1px rgba(255, 255, 255, 0.15); }
  .bp3-panel-stack2-header > span{
    -webkit-box-align:stretch;
        -ms-flex-align:stretch;
            align-items:stretch;
    display:-webkit-box;
    display:-ms-flexbox;
    display:flex;
    -webkit-box-flex:1;
        -ms-flex:1;
            flex:1; }
  .bp3-panel-stack2-header .bp3-heading{
    margin:0 5px; }

.bp3-button.bp3-panel-stack2-header-back{
  margin-left:5px;
  padding-left:0;
  white-space:nowrap; }
  .bp3-button.bp3-panel-stack2-header-back .bp3-icon{
    margin:0 2px; }

.bp3-panel-stack2-view{
  bottom:0;
  left:0;
  position:absolute;
  right:0;
  top:0;
  background-color:#ffffff;
  border-right:1px solid rgba(16, 22, 26, 0.15);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:vertical;
  -webkit-box-direction:normal;
      -ms-flex-direction:column;
          flex-direction:column;
  margin-right:-1px;
  overflow-y:auto;
  z-index:1; }
  .bp3-dark .bp3-panel-stack2-view{
    background-color:#30404d; }
  .bp3-panel-stack2-view:nth-last-child(n + 4){
    display:none; }

.bp3-panel-stack2-push .bp3-panel-stack2-enter, .bp3-panel-stack2-push .bp3-panel-stack2-appear{
  -webkit-transform:translateX(100%);
          transform:translateX(100%);
  opacity:0; }

.bp3-panel-stack2-push .bp3-panel-stack2-enter-active, .bp3-panel-stack2-push .bp3-panel-stack2-appear-active{
  -webkit-transform:translate(0%);
          transform:translate(0%);
  opacity:1;
  -webkit-transition-delay:0;
          transition-delay:0;
  -webkit-transition-duration:400ms;
          transition-duration:400ms;
  -webkit-transition-property:opacity, -webkit-transform;
  transition-property:opacity, -webkit-transform;
  transition-property:transform, opacity;
  transition-property:transform, opacity, -webkit-transform;
  -webkit-transition-timing-function:ease;
          transition-timing-function:ease; }

.bp3-panel-stack2-push .bp3-panel-stack2-exit{
  -webkit-transform:translate(0%);
          transform:translate(0%);
  opacity:1; }

.bp3-panel-stack2-push .bp3-panel-stack2-exit-active{
  -webkit-transform:translateX(-50%);
          transform:translateX(-50%);
  opacity:0;
  -webkit-transition-delay:0;
          transition-delay:0;
  -webkit-transition-duration:400ms;
          transition-duration:400ms;
  -webkit-transition-property:opacity, -webkit-transform;
  transition-property:opacity, -webkit-transform;
  transition-property:transform, opacity;
  transition-property:transform, opacity, -webkit-transform;
  -webkit-transition-timing-function:ease;
          transition-timing-function:ease; }

.bp3-panel-stack2-pop .bp3-panel-stack2-enter, .bp3-panel-stack2-pop .bp3-panel-stack2-appear{
  -webkit-transform:translateX(-50%);
          transform:translateX(-50%);
  opacity:0; }

.bp3-panel-stack2-pop .bp3-panel-stack2-enter-active, .bp3-panel-stack2-pop .bp3-panel-stack2-appear-active{
  -webkit-transform:translate(0%);
          transform:translate(0%);
  opacity:1;
  -webkit-transition-delay:0;
          transition-delay:0;
  -webkit-transition-duration:400ms;
          transition-duration:400ms;
  -webkit-transition-property:opacity, -webkit-transform;
  transition-property:opacity, -webkit-transform;
  transition-property:transform, opacity;
  transition-property:transform, opacity, -webkit-transform;
  -webkit-transition-timing-function:ease;
          transition-timing-function:ease; }

.bp3-panel-stack2-pop .bp3-panel-stack2-exit{
  -webkit-transform:translate(0%);
          transform:translate(0%);
  opacity:1; }

.bp3-panel-stack2-pop .bp3-panel-stack2-exit-active{
  -webkit-transform:translateX(100%);
          transform:translateX(100%);
  opacity:0;
  -webkit-transition-delay:0;
          transition-delay:0;
  -webkit-transition-duration:400ms;
          transition-duration:400ms;
  -webkit-transition-property:opacity, -webkit-transform;
  transition-property:opacity, -webkit-transform;
  transition-property:transform, opacity;
  transition-property:transform, opacity, -webkit-transform;
  -webkit-transition-timing-function:ease;
          transition-timing-function:ease; }
.bp3-popover{
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
  -webkit-transform:scale(1);
          transform:scale(1);
  border-radius:3px;
  display:inline-block;
  z-index:20; }
  .bp3-popover .bp3-popover-arrow{
    height:30px;
    position:absolute;
    width:30px; }
    .bp3-popover .bp3-popover-arrow::before{
      height:20px;
      margin:5px;
      width:20px; }
  .bp3-tether-element-attached-bottom.bp3-tether-target-attached-top > .bp3-popover{
    margin-bottom:17px;
    margin-top:-17px; }
    .bp3-tether-element-attached-bottom.bp3-tether-target-attached-top > .bp3-popover > .bp3-popover-arrow{
      bottom:-11px; }
      .bp3-tether-element-attached-bottom.bp3-tether-target-attached-top > .bp3-popover > .bp3-popover-arrow svg{
        -webkit-transform:rotate(-90deg);
                transform:rotate(-90deg); }
  .bp3-tether-element-attached-left.bp3-tether-target-attached-right > .bp3-popover{
    margin-left:17px; }
    .bp3-tether-element-attached-left.bp3-tether-target-attached-right > .bp3-popover > .bp3-popover-arrow{
      left:-11px; }
      .bp3-tether-element-attached-left.bp3-tether-target-attached-right > .bp3-popover > .bp3-popover-arrow svg{
        -webkit-transform:rotate(0);
                transform:rotate(0); }
  .bp3-tether-element-attached-top.bp3-tether-target-attached-bottom > .bp3-popover{
    margin-top:17px; }
    .bp3-tether-element-attached-top.bp3-tether-target-attached-bottom > .bp3-popover > .bp3-popover-arrow{
      top:-11px; }
      .bp3-tether-element-attached-top.bp3-tether-target-attached-bottom > .bp3-popover > .bp3-popover-arrow svg{
        -webkit-transform:rotate(90deg);
                transform:rotate(90deg); }
  .bp3-tether-element-attached-right.bp3-tether-target-attached-left > .bp3-popover{
    margin-left:-17px;
    margin-right:17px; }
    .bp3-tether-element-attached-right.bp3-tether-target-attached-left > .bp3-popover > .bp3-popover-arrow{
      right:-11px; }
      .bp3-tether-element-attached-right.bp3-tether-target-attached-left > .bp3-popover > .bp3-popover-arrow svg{
        -webkit-transform:rotate(180deg);
                transform:rotate(180deg); }
  .bp3-tether-element-attached-middle > .bp3-popover > .bp3-popover-arrow{
    top:50%;
    -webkit-transform:translateY(-50%);
            transform:translateY(-50%); }
  .bp3-tether-element-attached-center > .bp3-popover > .bp3-popover-arrow{
    right:50%;
    -webkit-transform:translateX(50%);
            transform:translateX(50%); }
  .bp3-tether-element-attached-top.bp3-tether-target-attached-top > .bp3-popover > .bp3-popover-arrow{
    top:-0.3934px; }
  .bp3-tether-element-attached-right.bp3-tether-target-attached-right > .bp3-popover > .bp3-popover-arrow{
    right:-0.3934px; }
  .bp3-tether-element-attached-left.bp3-tether-target-attached-left > .bp3-popover > .bp3-popover-arrow{
    left:-0.3934px; }
  .bp3-tether-element-attached-bottom.bp3-tether-target-attached-bottom > .bp3-popover > .bp3-popover-arrow{
    bottom:-0.3934px; }
  .bp3-tether-element-attached-top.bp3-tether-element-attached-left > .bp3-popover{
    -webkit-transform-origin:top left;
            transform-origin:top left; }
  .bp3-tether-element-attached-top.bp3-tether-element-attached-center > .bp3-popover{
    -webkit-transform-origin:top center;
            transform-origin:top center; }
  .bp3-tether-element-attached-top.bp3-tether-element-attached-right > .bp3-popover{
    -webkit-transform-origin:top right;
            transform-origin:top right; }
  .bp3-tether-element-attached-middle.bp3-tether-element-attached-left > .bp3-popover{
    -webkit-transform-origin:center left;
            transform-origin:center left; }
  .bp3-tether-element-attached-middle.bp3-tether-element-attached-center > .bp3-popover{
    -webkit-transform-origin:center center;
            transform-origin:center center; }
  .bp3-tether-element-attached-middle.bp3-tether-element-attached-right > .bp3-popover{
    -webkit-transform-origin:center right;
            transform-origin:center right; }
  .bp3-tether-element-attached-bottom.bp3-tether-element-attached-left > .bp3-popover{
    -webkit-transform-origin:bottom left;
            transform-origin:bottom left; }
  .bp3-tether-element-attached-bottom.bp3-tether-element-attached-center > .bp3-popover{
    -webkit-transform-origin:bottom center;
            transform-origin:bottom center; }
  .bp3-tether-element-attached-bottom.bp3-tether-element-attached-right > .bp3-popover{
    -webkit-transform-origin:bottom right;
            transform-origin:bottom right; }
  .bp3-popover .bp3-popover-content{
    background:#ffffff;
    color:inherit; }
  .bp3-popover .bp3-popover-arrow::before{
    -webkit-box-shadow:1px 1px 6px rgba(16, 22, 26, 0.2);
            box-shadow:1px 1px 6px rgba(16, 22, 26, 0.2); }
  .bp3-popover .bp3-popover-arrow-border{
    fill:#10161a;
    fill-opacity:0.1; }
  .bp3-popover .bp3-popover-arrow-fill{
    fill:#ffffff; }
  .bp3-popover-enter > .bp3-popover, .bp3-popover-appear > .bp3-popover{
    -webkit-transform:scale(0.3);
            transform:scale(0.3); }
  .bp3-popover-enter-active > .bp3-popover, .bp3-popover-appear-active > .bp3-popover{
    -webkit-transform:scale(1);
            transform:scale(1);
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:300ms;
            transition-duration:300ms;
    -webkit-transition-property:-webkit-transform;
    transition-property:-webkit-transform;
    transition-property:transform;
    transition-property:transform, -webkit-transform;
    -webkit-transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11);
            transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11); }
  .bp3-popover-exit > .bp3-popover{
    -webkit-transform:scale(1);
            transform:scale(1); }
  .bp3-popover-exit-active > .bp3-popover{
    -webkit-transform:scale(0.3);
            transform:scale(0.3);
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:300ms;
            transition-duration:300ms;
    -webkit-transition-property:-webkit-transform;
    transition-property:-webkit-transform;
    transition-property:transform;
    transition-property:transform, -webkit-transform;
    -webkit-transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11);
            transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11); }
  .bp3-popover .bp3-popover-content{
    border-radius:3px;
    position:relative; }
  .bp3-popover.bp3-popover-content-sizing .bp3-popover-content{
    max-width:350px;
    padding:20px; }
  .bp3-popover-target + .bp3-overlay .bp3-popover.bp3-popover-content-sizing{
    width:350px; }
  .bp3-popover.bp3-minimal{
    margin:0 !important; }
    .bp3-popover.bp3-minimal .bp3-popover-arrow{
      display:none; }
    .bp3-popover.bp3-minimal.bp3-popover{
      -webkit-transform:scale(1);
              transform:scale(1); }
      .bp3-popover-enter > .bp3-popover.bp3-minimal.bp3-popover, .bp3-popover-appear > .bp3-popover.bp3-minimal.bp3-popover{
        -webkit-transform:scale(1);
                transform:scale(1); }
      .bp3-popover-enter-active > .bp3-popover.bp3-minimal.bp3-popover, .bp3-popover-appear-active > .bp3-popover.bp3-minimal.bp3-popover{
        -webkit-transform:scale(1);
                transform:scale(1);
        -webkit-transition-delay:0;
                transition-delay:0;
        -webkit-transition-duration:100ms;
                transition-duration:100ms;
        -webkit-transition-property:-webkit-transform;
        transition-property:-webkit-transform;
        transition-property:transform;
        transition-property:transform, -webkit-transform;
        -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
                transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
      .bp3-popover-exit > .bp3-popover.bp3-minimal.bp3-popover{
        -webkit-transform:scale(1);
                transform:scale(1); }
      .bp3-popover-exit-active > .bp3-popover.bp3-minimal.bp3-popover{
        -webkit-transform:scale(1);
                transform:scale(1);
        -webkit-transition-delay:0;
                transition-delay:0;
        -webkit-transition-duration:100ms;
                transition-duration:100ms;
        -webkit-transition-property:-webkit-transform;
        transition-property:-webkit-transform;
        transition-property:transform;
        transition-property:transform, -webkit-transform;
        -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
                transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-popover.bp3-dark,
  .bp3-dark .bp3-popover{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4); }
    .bp3-popover.bp3-dark .bp3-popover-content,
    .bp3-dark .bp3-popover .bp3-popover-content{
      background:#30404d;
      color:inherit; }
    .bp3-popover.bp3-dark .bp3-popover-arrow::before,
    .bp3-dark .bp3-popover .bp3-popover-arrow::before{
      -webkit-box-shadow:1px 1px 6px rgba(16, 22, 26, 0.4);
              box-shadow:1px 1px 6px rgba(16, 22, 26, 0.4); }
    .bp3-popover.bp3-dark .bp3-popover-arrow-border,
    .bp3-dark .bp3-popover .bp3-popover-arrow-border{
      fill:#10161a;
      fill-opacity:0.2; }
    .bp3-popover.bp3-dark .bp3-popover-arrow-fill,
    .bp3-dark .bp3-popover .bp3-popover-arrow-fill{
      fill:#30404d; }

.bp3-popover-arrow::before{
  border-radius:2px;
  content:"";
  display:block;
  position:absolute;
  -webkit-transform:rotate(45deg);
          transform:rotate(45deg); }

.bp3-tether-pinned .bp3-popover-arrow{
  display:none; }

.bp3-popover-backdrop{
  background:rgba(255, 255, 255, 0); }

.bp3-transition-container{
  opacity:1;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  z-index:20; }
  .bp3-transition-container.bp3-popover-enter, .bp3-transition-container.bp3-popover-appear{
    opacity:0; }
  .bp3-transition-container.bp3-popover-enter-active, .bp3-transition-container.bp3-popover-appear-active{
    opacity:1;
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:100ms;
            transition-duration:100ms;
    -webkit-transition-property:opacity;
    transition-property:opacity;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-transition-container.bp3-popover-exit{
    opacity:1; }
  .bp3-transition-container.bp3-popover-exit-active{
    opacity:0;
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:100ms;
            transition-duration:100ms;
    -webkit-transition-property:opacity;
    transition-property:opacity;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-transition-container:focus{
    outline:none; }
  .bp3-transition-container.bp3-popover-leave .bp3-popover-content{
    pointer-events:none; }
  .bp3-transition-container[data-x-out-of-boundaries]{
    display:none; }

span.bp3-popover-target{
  display:inline-block; }

.bp3-popover-wrapper.bp3-fill{
  width:100%; }

.bp3-portal{
  left:0;
  position:absolute;
  right:0;
  top:0; }
@-webkit-keyframes linear-progress-bar-stripes{
  from{
    background-position:0 0; }
  to{
    background-position:30px 0; } }
@keyframes linear-progress-bar-stripes{
  from{
    background-position:0 0; }
  to{
    background-position:30px 0; } }

.bp3-progress-bar{
  background:rgba(92, 112, 128, 0.2);
  border-radius:40px;
  display:block;
  height:8px;
  overflow:hidden;
  position:relative;
  width:100%; }
  .bp3-progress-bar .bp3-progress-meter{
    background:linear-gradient(-45deg, rgba(255, 255, 255, 0.2) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.2) 50%, rgba(255, 255, 255, 0.2) 75%, transparent 75%);
    background-color:rgba(92, 112, 128, 0.8);
    background-size:30px 30px;
    border-radius:40px;
    height:100%;
    position:absolute;
    -webkit-transition:width 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
    transition:width 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
    width:100%; }
  .bp3-progress-bar:not(.bp3-no-animation):not(.bp3-no-stripes) .bp3-progress-meter{
    animation:linear-progress-bar-stripes 300ms linear infinite reverse; }
  .bp3-progress-bar.bp3-no-stripes .bp3-progress-meter{
    background-image:none; }

.bp3-dark .bp3-progress-bar{
  background:rgba(16, 22, 26, 0.5); }
  .bp3-dark .bp3-progress-bar .bp3-progress-meter{
    background-color:#8a9ba8; }

.bp3-progress-bar.bp3-intent-primary .bp3-progress-meter{
  background-color:#137cbd; }

.bp3-progress-bar.bp3-intent-success .bp3-progress-meter{
  background-color:#0f9960; }

.bp3-progress-bar.bp3-intent-warning .bp3-progress-meter{
  background-color:#d9822b; }

.bp3-progress-bar.bp3-intent-danger .bp3-progress-meter{
  background-color:#db3737; }
@-webkit-keyframes skeleton-glow{
  from{
    background:rgba(206, 217, 224, 0.2);
    border-color:rgba(206, 217, 224, 0.2); }
  to{
    background:rgba(92, 112, 128, 0.2);
    border-color:rgba(92, 112, 128, 0.2); } }
@keyframes skeleton-glow{
  from{
    background:rgba(206, 217, 224, 0.2);
    border-color:rgba(206, 217, 224, 0.2); }
  to{
    background:rgba(92, 112, 128, 0.2);
    border-color:rgba(92, 112, 128, 0.2); } }
.bp3-skeleton{
  -webkit-animation:1000ms linear infinite alternate skeleton-glow;
          animation:1000ms linear infinite alternate skeleton-glow;
  background:rgba(206, 217, 224, 0.2);
  background-clip:padding-box !important;
  border-color:rgba(206, 217, 224, 0.2) !important;
  border-radius:2px;
  -webkit-box-shadow:none !important;
          box-shadow:none !important;
  color:transparent !important;
  cursor:default;
  pointer-events:none;
  -webkit-user-select:none;
     -moz-user-select:none;
      -ms-user-select:none;
          user-select:none; }
  .bp3-skeleton::before, .bp3-skeleton::after,
  .bp3-skeleton *{
    visibility:hidden !important; }
.bp3-slider{
  height:40px;
  min-width:150px;
  width:100%;
  cursor:default;
  outline:none;
  position:relative;
  -webkit-user-select:none;
     -moz-user-select:none;
      -ms-user-select:none;
          user-select:none; }
  .bp3-slider:hover{
    cursor:pointer; }
  .bp3-slider:active{
    cursor:-webkit-grabbing;
    cursor:grabbing; }
  .bp3-slider.bp3-disabled{
    cursor:not-allowed;
    opacity:0.5; }
  .bp3-slider.bp3-slider-unlabeled{
    height:16px; }

.bp3-slider-track,
.bp3-slider-progress{
  height:6px;
  left:0;
  right:0;
  top:5px;
  position:absolute; }

.bp3-slider-track{
  border-radius:3px;
  overflow:hidden; }

.bp3-slider-progress{
  background:rgba(92, 112, 128, 0.2); }
  .bp3-dark .bp3-slider-progress{
    background:rgba(16, 22, 26, 0.5); }
  .bp3-slider-progress.bp3-intent-primary{
    background-color:#137cbd; }
  .bp3-slider-progress.bp3-intent-success{
    background-color:#0f9960; }
  .bp3-slider-progress.bp3-intent-warning{
    background-color:#d9822b; }
  .bp3-slider-progress.bp3-intent-danger{
    background-color:#db3737; }

.bp3-slider-handle{
  background-color:#f5f8fa;
  background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.8)), to(rgba(255, 255, 255, 0)));
  background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.8), rgba(255, 255, 255, 0));
  -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
          box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
  color:#182026;
  border-radius:3px;
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 1px 1px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 1px 1px rgba(16, 22, 26, 0.2);
  cursor:pointer;
  height:16px;
  left:0;
  position:absolute;
  top:0;
  width:16px; }
  .bp3-slider-handle:hover{
    background-clip:padding-box;
    background-color:#ebf1f5;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1); }
  .bp3-slider-handle:active, .bp3-slider-handle.bp3-active{
    background-color:#d8e1e8;
    background-image:none;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
  .bp3-slider-handle:disabled, .bp3-slider-handle.bp3-disabled{
    background-color:rgba(206, 217, 224, 0.5);
    background-image:none;
    -webkit-box-shadow:none;
            box-shadow:none;
    color:rgba(92, 112, 128, 0.6);
    cursor:not-allowed;
    outline:none; }
    .bp3-slider-handle:disabled.bp3-active, .bp3-slider-handle:disabled.bp3-active:hover, .bp3-slider-handle.bp3-disabled.bp3-active, .bp3-slider-handle.bp3-disabled.bp3-active:hover{
      background:rgba(206, 217, 224, 0.7); }
  .bp3-slider-handle:focus{
    z-index:1; }
  .bp3-slider-handle:hover{
    background-clip:padding-box;
    background-color:#ebf1f5;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 1px 1px rgba(16, 22, 26, 0.2);
    cursor:-webkit-grab;
    cursor:grab;
    z-index:2; }
  .bp3-slider-handle.bp3-active{
    background-color:#d8e1e8;
    background-image:none;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2);
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 1px rgba(16, 22, 26, 0.1);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 1px rgba(16, 22, 26, 0.1);
    cursor:-webkit-grabbing;
    cursor:grabbing; }
  .bp3-disabled .bp3-slider-handle{
    background:#bfccd6;
    -webkit-box-shadow:none;
            box-shadow:none;
    pointer-events:none; }
  .bp3-dark .bp3-slider-handle{
    background-color:#394b59;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.05)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.05), rgba(255, 255, 255, 0));
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
    color:#f5f8fa; }
    .bp3-dark .bp3-slider-handle:hover, .bp3-dark .bp3-slider-handle:active, .bp3-dark .bp3-slider-handle.bp3-active{
      color:#f5f8fa; }
    .bp3-dark .bp3-slider-handle:hover{
      background-color:#30404d;
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-slider-handle:active, .bp3-dark .bp3-slider-handle.bp3-active{
      background-color:#202b33;
      background-image:none;
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-dark .bp3-slider-handle:disabled, .bp3-dark .bp3-slider-handle.bp3-disabled{
      background-color:rgba(57, 75, 89, 0.5);
      background-image:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(167, 182, 194, 0.6); }
      .bp3-dark .bp3-slider-handle:disabled.bp3-active, .bp3-dark .bp3-slider-handle.bp3-disabled.bp3-active{
        background:rgba(57, 75, 89, 0.7); }
    .bp3-dark .bp3-slider-handle .bp3-button-spinner .bp3-spinner-head{
      background:rgba(16, 22, 26, 0.5);
      stroke:#8a9ba8; }
    .bp3-dark .bp3-slider-handle, .bp3-dark .bp3-slider-handle:hover{
      background-color:#394b59; }
    .bp3-dark .bp3-slider-handle.bp3-active{
      background-color:#293742; }
  .bp3-dark .bp3-disabled .bp3-slider-handle{
    background:#5c7080;
    border-color:#5c7080;
    -webkit-box-shadow:none;
            box-shadow:none; }
  .bp3-slider-handle .bp3-slider-label{
    background:#394b59;
    border-radius:3px;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
    color:#f5f8fa;
    margin-left:8px; }
    .bp3-dark .bp3-slider-handle .bp3-slider-label{
      background:#e1e8ed;
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4);
      color:#394b59; }
    .bp3-disabled .bp3-slider-handle .bp3-slider-label{
      -webkit-box-shadow:none;
              box-shadow:none; }
  .bp3-slider-handle.bp3-start, .bp3-slider-handle.bp3-end{
    width:8px; }
  .bp3-slider-handle.bp3-start{
    border-bottom-right-radius:0;
    border-top-right-radius:0; }
  .bp3-slider-handle.bp3-end{
    border-bottom-left-radius:0;
    border-top-left-radius:0;
    margin-left:8px; }
    .bp3-slider-handle.bp3-end .bp3-slider-label{
      margin-left:0; }

.bp3-slider-label{
  -webkit-transform:translate(-50%, 20px);
          transform:translate(-50%, 20px);
  display:inline-block;
  font-size:12px;
  line-height:1;
  padding:2px 5px;
  position:absolute;
  vertical-align:top; }

.bp3-slider.bp3-vertical{
  height:150px;
  min-width:40px;
  width:40px; }
  .bp3-slider.bp3-vertical .bp3-slider-track,
  .bp3-slider.bp3-vertical .bp3-slider-progress{
    bottom:0;
    height:auto;
    left:5px;
    top:0;
    width:6px; }
  .bp3-slider.bp3-vertical .bp3-slider-progress{
    top:auto; }
  .bp3-slider.bp3-vertical .bp3-slider-label{
    -webkit-transform:translate(20px, 50%);
            transform:translate(20px, 50%); }
  .bp3-slider.bp3-vertical .bp3-slider-handle{
    top:auto; }
    .bp3-slider.bp3-vertical .bp3-slider-handle .bp3-slider-label{
      margin-left:0;
      margin-top:-8px; }
    .bp3-slider.bp3-vertical .bp3-slider-handle.bp3-end, .bp3-slider.bp3-vertical .bp3-slider-handle.bp3-start{
      height:8px;
      margin-left:0;
      width:16px; }
    .bp3-slider.bp3-vertical .bp3-slider-handle.bp3-start{
      border-bottom-right-radius:3px;
      border-top-left-radius:0; }
      .bp3-slider.bp3-vertical .bp3-slider-handle.bp3-start .bp3-slider-label{
        -webkit-transform:translate(20px);
                transform:translate(20px); }
    .bp3-slider.bp3-vertical .bp3-slider-handle.bp3-end{
      border-bottom-left-radius:0;
      border-bottom-right-radius:0;
      border-top-left-radius:3px;
      margin-bottom:8px; }

@-webkit-keyframes pt-spinner-animation{
  from{
    -webkit-transform:rotate(0deg);
            transform:rotate(0deg); }
  to{
    -webkit-transform:rotate(360deg);
            transform:rotate(360deg); } }

@keyframes pt-spinner-animation{
  from{
    -webkit-transform:rotate(0deg);
            transform:rotate(0deg); }
  to{
    -webkit-transform:rotate(360deg);
            transform:rotate(360deg); } }

.bp3-spinner{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-pack:center;
      -ms-flex-pack:center;
          justify-content:center;
  overflow:visible;
  vertical-align:middle; }
  .bp3-spinner svg{
    display:block; }
  .bp3-spinner path{
    fill-opacity:0; }
  .bp3-spinner .bp3-spinner-head{
    stroke:rgba(92, 112, 128, 0.8);
    stroke-linecap:round;
    -webkit-transform-origin:center;
            transform-origin:center;
    -webkit-transition:stroke-dashoffset 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
    transition:stroke-dashoffset 200ms cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-spinner .bp3-spinner-track{
    stroke:rgba(92, 112, 128, 0.2); }

.bp3-spinner-animation{
  -webkit-animation:pt-spinner-animation 500ms linear infinite;
          animation:pt-spinner-animation 500ms linear infinite; }
  .bp3-no-spin > .bp3-spinner-animation{
    -webkit-animation:none;
            animation:none; }

.bp3-dark .bp3-spinner .bp3-spinner-head{
  stroke:#8a9ba8; }

.bp3-dark .bp3-spinner .bp3-spinner-track{
  stroke:rgba(16, 22, 26, 0.5); }

.bp3-spinner.bp3-intent-primary .bp3-spinner-head{
  stroke:#137cbd; }

.bp3-spinner.bp3-intent-success .bp3-spinner-head{
  stroke:#0f9960; }

.bp3-spinner.bp3-intent-warning .bp3-spinner-head{
  stroke:#d9822b; }

.bp3-spinner.bp3-intent-danger .bp3-spinner-head{
  stroke:#db3737; }
.bp3-tabs.bp3-vertical{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex; }
  .bp3-tabs.bp3-vertical > .bp3-tab-list{
    -webkit-box-align:start;
        -ms-flex-align:start;
            align-items:flex-start;
    -webkit-box-orient:vertical;
    -webkit-box-direction:normal;
        -ms-flex-direction:column;
            flex-direction:column; }
    .bp3-tabs.bp3-vertical > .bp3-tab-list .bp3-tab{
      border-radius:3px;
      padding:0 10px;
      width:100%; }
      .bp3-tabs.bp3-vertical > .bp3-tab-list .bp3-tab[aria-selected="true"]{
        background-color:rgba(19, 124, 189, 0.2);
        -webkit-box-shadow:none;
                box-shadow:none; }
    .bp3-tabs.bp3-vertical > .bp3-tab-list .bp3-tab-indicator-wrapper .bp3-tab-indicator{
      background-color:rgba(19, 124, 189, 0.2);
      border-radius:3px;
      bottom:0;
      height:auto;
      left:0;
      right:0;
      top:0; }
  .bp3-tabs.bp3-vertical > .bp3-tab-panel{
    margin-top:0;
    padding-left:20px; }

.bp3-tab-list{
  -webkit-box-align:end;
      -ms-flex-align:end;
          align-items:flex-end;
  border:none;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-flex:0;
      -ms-flex:0 0 auto;
          flex:0 0 auto;
  list-style:none;
  margin:0;
  padding:0;
  position:relative; }
  .bp3-tab-list > *:not(:last-child){
    margin-right:20px; }

.bp3-tab{
  overflow:hidden;
  text-overflow:ellipsis;
  white-space:nowrap;
  word-wrap:normal;
  color:#182026;
  cursor:pointer;
  -webkit-box-flex:0;
      -ms-flex:0 0 auto;
          flex:0 0 auto;
  font-size:14px;
  line-height:30px;
  max-width:100%;
  position:relative;
  vertical-align:top; }
  .bp3-tab a{
    color:inherit;
    display:block;
    text-decoration:none; }
  .bp3-tab-indicator-wrapper ~ .bp3-tab{
    background-color:transparent !important;
    -webkit-box-shadow:none !important;
            box-shadow:none !important; }
  .bp3-tab[aria-disabled="true"]{
    color:rgba(92, 112, 128, 0.6);
    cursor:not-allowed; }
  .bp3-tab[aria-selected="true"]{
    border-radius:0;
    -webkit-box-shadow:inset 0 -3px 0 #106ba3;
            box-shadow:inset 0 -3px 0 #106ba3; }
  .bp3-tab[aria-selected="true"], .bp3-tab:not([aria-disabled="true"]):hover{
    color:#106ba3; }
  .bp3-tab:focus{
    -moz-outline-radius:0; }
  .bp3-large > .bp3-tab{
    font-size:16px;
    line-height:40px; }

.bp3-tab-panel{
  margin-top:20px; }
  .bp3-tab-panel[aria-hidden="true"]{
    display:none; }

.bp3-tab-indicator-wrapper{
  left:0;
  pointer-events:none;
  position:absolute;
  top:0;
  -webkit-transform:translateX(0), translateY(0);
          transform:translateX(0), translateY(0);
  -webkit-transition:height, width, -webkit-transform;
  transition:height, width, -webkit-transform;
  transition:height, transform, width;
  transition:height, transform, width, -webkit-transform;
  -webkit-transition-duration:200ms;
          transition-duration:200ms;
  -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
          transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-tab-indicator-wrapper .bp3-tab-indicator{
    background-color:#106ba3;
    bottom:0;
    height:3px;
    left:0;
    position:absolute;
    right:0; }
  .bp3-tab-indicator-wrapper.bp3-no-animation{
    -webkit-transition:none;
    transition:none; }

.bp3-dark .bp3-tab{
  color:#f5f8fa; }
  .bp3-dark .bp3-tab[aria-disabled="true"]{
    color:rgba(167, 182, 194, 0.6); }
  .bp3-dark .bp3-tab[aria-selected="true"]{
    -webkit-box-shadow:inset 0 -3px 0 #48aff0;
            box-shadow:inset 0 -3px 0 #48aff0; }
  .bp3-dark .bp3-tab[aria-selected="true"], .bp3-dark .bp3-tab:not([aria-disabled="true"]):hover{
    color:#48aff0; }

.bp3-dark .bp3-tab-indicator{
  background-color:#48aff0; }

.bp3-flex-expander{
  -webkit-box-flex:1;
      -ms-flex:1 1;
          flex:1 1; }
.bp3-tag{
  display:-webkit-inline-box;
  display:-ms-inline-flexbox;
  display:inline-flex;
  -webkit-box-orient:horizontal;
  -webkit-box-direction:normal;
      -ms-flex-direction:row;
          flex-direction:row;
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  background-color:#5c7080;
  border:none;
  border-radius:3px;
  -webkit-box-shadow:none;
          box-shadow:none;
  color:#f5f8fa;
  font-size:12px;
  line-height:16px;
  max-width:100%;
  min-height:20px;
  min-width:20px;
  padding:2px 6px;
  position:relative; }
  .bp3-tag.bp3-interactive{
    cursor:pointer; }
    .bp3-tag.bp3-interactive:hover{
      background-color:rgba(92, 112, 128, 0.85); }
    .bp3-tag.bp3-interactive.bp3-active, .bp3-tag.bp3-interactive:active{
      background-color:rgba(92, 112, 128, 0.7); }
  .bp3-tag > *{
    -webkit-box-flex:0;
        -ms-flex-positive:0;
            flex-grow:0;
    -ms-flex-negative:0;
        flex-shrink:0; }
  .bp3-tag > .bp3-fill{
    -webkit-box-flex:1;
        -ms-flex-positive:1;
            flex-grow:1;
    -ms-flex-negative:1;
        flex-shrink:1; }
  .bp3-tag::before,
  .bp3-tag > *{
    margin-right:4px; }
  .bp3-tag:empty::before,
  .bp3-tag > :last-child{
    margin-right:0; }
  .bp3-tag:focus{
    outline:rgba(19, 124, 189, 0.6) auto 2px;
    outline-offset:0;
    -moz-outline-radius:6px; }
  .bp3-tag.bp3-round{
    border-radius:30px;
    padding-left:8px;
    padding-right:8px; }
  .bp3-dark .bp3-tag{
    background-color:#bfccd6;
    color:#182026; }
    .bp3-dark .bp3-tag.bp3-interactive{
      cursor:pointer; }
      .bp3-dark .bp3-tag.bp3-interactive:hover{
        background-color:rgba(191, 204, 214, 0.85); }
      .bp3-dark .bp3-tag.bp3-interactive.bp3-active, .bp3-dark .bp3-tag.bp3-interactive:active{
        background-color:rgba(191, 204, 214, 0.7); }
    .bp3-dark .bp3-tag > .bp3-icon, .bp3-dark .bp3-tag .bp3-icon-standard, .bp3-dark .bp3-tag .bp3-icon-large{
      fill:currentColor; }
  .bp3-tag > .bp3-icon, .bp3-tag .bp3-icon-standard, .bp3-tag .bp3-icon-large{
    fill:#ffffff; }
  .bp3-tag.bp3-large,
  .bp3-large .bp3-tag{
    font-size:14px;
    line-height:20px;
    min-height:30px;
    min-width:30px;
    padding:5px 10px; }
    .bp3-tag.bp3-large::before,
    .bp3-tag.bp3-large > *,
    .bp3-large .bp3-tag::before,
    .bp3-large .bp3-tag > *{
      margin-right:7px; }
    .bp3-tag.bp3-large:empty::before,
    .bp3-tag.bp3-large > :last-child,
    .bp3-large .bp3-tag:empty::before,
    .bp3-large .bp3-tag > :last-child{
      margin-right:0; }
    .bp3-tag.bp3-large.bp3-round,
    .bp3-large .bp3-tag.bp3-round{
      padding-left:12px;
      padding-right:12px; }
  .bp3-tag.bp3-intent-primary{
    background:#137cbd;
    color:#ffffff; }
    .bp3-tag.bp3-intent-primary.bp3-interactive{
      cursor:pointer; }
      .bp3-tag.bp3-intent-primary.bp3-interactive:hover{
        background-color:rgba(19, 124, 189, 0.85); }
      .bp3-tag.bp3-intent-primary.bp3-interactive.bp3-active, .bp3-tag.bp3-intent-primary.bp3-interactive:active{
        background-color:rgba(19, 124, 189, 0.7); }
  .bp3-tag.bp3-intent-success{
    background:#0f9960;
    color:#ffffff; }
    .bp3-tag.bp3-intent-success.bp3-interactive{
      cursor:pointer; }
      .bp3-tag.bp3-intent-success.bp3-interactive:hover{
        background-color:rgba(15, 153, 96, 0.85); }
      .bp3-tag.bp3-intent-success.bp3-interactive.bp3-active, .bp3-tag.bp3-intent-success.bp3-interactive:active{
        background-color:rgba(15, 153, 96, 0.7); }
  .bp3-tag.bp3-intent-warning{
    background:#d9822b;
    color:#ffffff; }
    .bp3-tag.bp3-intent-warning.bp3-interactive{
      cursor:pointer; }
      .bp3-tag.bp3-intent-warning.bp3-interactive:hover{
        background-color:rgba(217, 130, 43, 0.85); }
      .bp3-tag.bp3-intent-warning.bp3-interactive.bp3-active, .bp3-tag.bp3-intent-warning.bp3-interactive:active{
        background-color:rgba(217, 130, 43, 0.7); }
  .bp3-tag.bp3-intent-danger{
    background:#db3737;
    color:#ffffff; }
    .bp3-tag.bp3-intent-danger.bp3-interactive{
      cursor:pointer; }
      .bp3-tag.bp3-intent-danger.bp3-interactive:hover{
        background-color:rgba(219, 55, 55, 0.85); }
      .bp3-tag.bp3-intent-danger.bp3-interactive.bp3-active, .bp3-tag.bp3-intent-danger.bp3-interactive:active{
        background-color:rgba(219, 55, 55, 0.7); }
  .bp3-tag.bp3-fill{
    display:-webkit-box;
    display:-ms-flexbox;
    display:flex;
    width:100%; }
  .bp3-tag.bp3-minimal > .bp3-icon, .bp3-tag.bp3-minimal .bp3-icon-standard, .bp3-tag.bp3-minimal .bp3-icon-large{
    fill:#5c7080; }
  .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]){
    background-color:rgba(138, 155, 168, 0.2);
    color:#182026; }
    .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]).bp3-interactive{
      cursor:pointer; }
      .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]).bp3-interactive:hover{
        background-color:rgba(92, 112, 128, 0.3); }
      .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]).bp3-interactive.bp3-active, .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]).bp3-interactive:active{
        background-color:rgba(92, 112, 128, 0.4); }
    .bp3-dark .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]){
      color:#f5f8fa; }
      .bp3-dark .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]).bp3-interactive{
        cursor:pointer; }
        .bp3-dark .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]).bp3-interactive:hover{
          background-color:rgba(191, 204, 214, 0.3); }
        .bp3-dark .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]).bp3-interactive.bp3-active, .bp3-dark .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]).bp3-interactive:active{
          background-color:rgba(191, 204, 214, 0.4); }
      .bp3-dark .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]) > .bp3-icon, .bp3-dark .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]) .bp3-icon-standard, .bp3-dark .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]) .bp3-icon-large{
        fill:#a7b6c2; }
  .bp3-tag.bp3-minimal.bp3-intent-primary{
    background-color:rgba(19, 124, 189, 0.15);
    color:#106ba3; }
    .bp3-tag.bp3-minimal.bp3-intent-primary.bp3-interactive{
      cursor:pointer; }
      .bp3-tag.bp3-minimal.bp3-intent-primary.bp3-interactive:hover{
        background-color:rgba(19, 124, 189, 0.25); }
      .bp3-tag.bp3-minimal.bp3-intent-primary.bp3-interactive.bp3-active, .bp3-tag.bp3-minimal.bp3-intent-primary.bp3-interactive:active{
        background-color:rgba(19, 124, 189, 0.35); }
    .bp3-tag.bp3-minimal.bp3-intent-primary > .bp3-icon, .bp3-tag.bp3-minimal.bp3-intent-primary .bp3-icon-standard, .bp3-tag.bp3-minimal.bp3-intent-primary .bp3-icon-large{
      fill:#137cbd; }
    .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-primary{
      background-color:rgba(19, 124, 189, 0.25);
      color:#48aff0; }
      .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-primary.bp3-interactive{
        cursor:pointer; }
        .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-primary.bp3-interactive:hover{
          background-color:rgba(19, 124, 189, 0.35); }
        .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-primary.bp3-interactive.bp3-active, .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-primary.bp3-interactive:active{
          background-color:rgba(19, 124, 189, 0.45); }
  .bp3-tag.bp3-minimal.bp3-intent-success{
    background-color:rgba(15, 153, 96, 0.15);
    color:#0d8050; }
    .bp3-tag.bp3-minimal.bp3-intent-success.bp3-interactive{
      cursor:pointer; }
      .bp3-tag.bp3-minimal.bp3-intent-success.bp3-interactive:hover{
        background-color:rgba(15, 153, 96, 0.25); }
      .bp3-tag.bp3-minimal.bp3-intent-success.bp3-interactive.bp3-active, .bp3-tag.bp3-minimal.bp3-intent-success.bp3-interactive:active{
        background-color:rgba(15, 153, 96, 0.35); }
    .bp3-tag.bp3-minimal.bp3-intent-success > .bp3-icon, .bp3-tag.bp3-minimal.bp3-intent-success .bp3-icon-standard, .bp3-tag.bp3-minimal.bp3-intent-success .bp3-icon-large{
      fill:#0f9960; }
    .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-success{
      background-color:rgba(15, 153, 96, 0.25);
      color:#3dcc91; }
      .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-success.bp3-interactive{
        cursor:pointer; }
        .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-success.bp3-interactive:hover{
          background-color:rgba(15, 153, 96, 0.35); }
        .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-success.bp3-interactive.bp3-active, .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-success.bp3-interactive:active{
          background-color:rgba(15, 153, 96, 0.45); }
  .bp3-tag.bp3-minimal.bp3-intent-warning{
    background-color:rgba(217, 130, 43, 0.15);
    color:#bf7326; }
    .bp3-tag.bp3-minimal.bp3-intent-warning.bp3-interactive{
      cursor:pointer; }
      .bp3-tag.bp3-minimal.bp3-intent-warning.bp3-interactive:hover{
        background-color:rgba(217, 130, 43, 0.25); }
      .bp3-tag.bp3-minimal.bp3-intent-warning.bp3-interactive.bp3-active, .bp3-tag.bp3-minimal.bp3-intent-warning.bp3-interactive:active{
        background-color:rgba(217, 130, 43, 0.35); }
    .bp3-tag.bp3-minimal.bp3-intent-warning > .bp3-icon, .bp3-tag.bp3-minimal.bp3-intent-warning .bp3-icon-standard, .bp3-tag.bp3-minimal.bp3-intent-warning .bp3-icon-large{
      fill:#d9822b; }
    .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-warning{
      background-color:rgba(217, 130, 43, 0.25);
      color:#ffb366; }
      .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-warning.bp3-interactive{
        cursor:pointer; }
        .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-warning.bp3-interactive:hover{
          background-color:rgba(217, 130, 43, 0.35); }
        .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-warning.bp3-interactive.bp3-active, .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-warning.bp3-interactive:active{
          background-color:rgba(217, 130, 43, 0.45); }
  .bp3-tag.bp3-minimal.bp3-intent-danger{
    background-color:rgba(219, 55, 55, 0.15);
    color:#c23030; }
    .bp3-tag.bp3-minimal.bp3-intent-danger.bp3-interactive{
      cursor:pointer; }
      .bp3-tag.bp3-minimal.bp3-intent-danger.bp3-interactive:hover{
        background-color:rgba(219, 55, 55, 0.25); }
      .bp3-tag.bp3-minimal.bp3-intent-danger.bp3-interactive.bp3-active, .bp3-tag.bp3-minimal.bp3-intent-danger.bp3-interactive:active{
        background-color:rgba(219, 55, 55, 0.35); }
    .bp3-tag.bp3-minimal.bp3-intent-danger > .bp3-icon, .bp3-tag.bp3-minimal.bp3-intent-danger .bp3-icon-standard, .bp3-tag.bp3-minimal.bp3-intent-danger .bp3-icon-large{
      fill:#db3737; }
    .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-danger{
      background-color:rgba(219, 55, 55, 0.25);
      color:#ff7373; }
      .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-danger.bp3-interactive{
        cursor:pointer; }
        .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-danger.bp3-interactive:hover{
          background-color:rgba(219, 55, 55, 0.35); }
        .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-danger.bp3-interactive.bp3-active, .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-danger.bp3-interactive:active{
          background-color:rgba(219, 55, 55, 0.45); }

.bp3-tag-remove{
  background:none;
  border:none;
  color:inherit;
  cursor:pointer;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  margin-bottom:-2px;
  margin-right:-6px !important;
  margin-top:-2px;
  opacity:0.5;
  padding:2px;
  padding-left:0; }
  .bp3-tag-remove:hover{
    background:none;
    opacity:0.8;
    text-decoration:none; }
  .bp3-tag-remove:active{
    opacity:1; }
  .bp3-tag-remove:empty::before{
    font-family:"Icons16", sans-serif;
    font-size:16px;
    font-style:normal;
    font-weight:400;
    line-height:1;
    -moz-osx-font-smoothing:grayscale;
    -webkit-font-smoothing:antialiased;
    content:""; }
  .bp3-large .bp3-tag-remove{
    margin-right:-10px !important;
    padding:0 5px 0 0; }
    .bp3-large .bp3-tag-remove:empty::before{
      font-family:"Icons20", sans-serif;
      font-size:20px;
      font-style:normal;
      font-weight:400;
      line-height:1; }
.bp3-tag-input{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:horizontal;
  -webkit-box-direction:normal;
      -ms-flex-direction:row;
          flex-direction:row;
  -webkit-box-align:start;
      -ms-flex-align:start;
          align-items:flex-start;
  cursor:text;
  height:auto;
  line-height:inherit;
  min-height:30px;
  padding-left:5px;
  padding-right:0; }
  .bp3-tag-input > *{
    -webkit-box-flex:0;
        -ms-flex-positive:0;
            flex-grow:0;
    -ms-flex-negative:0;
        flex-shrink:0; }
  .bp3-tag-input > .bp3-tag-input-values{
    -webkit-box-flex:1;
        -ms-flex-positive:1;
            flex-grow:1;
    -ms-flex-negative:1;
        flex-shrink:1; }
  .bp3-tag-input .bp3-tag-input-icon{
    color:#5c7080;
    margin-left:2px;
    margin-right:7px;
    margin-top:7px; }
  .bp3-tag-input .bp3-tag-input-values{
    display:-webkit-box;
    display:-ms-flexbox;
    display:flex;
    -webkit-box-orient:horizontal;
    -webkit-box-direction:normal;
        -ms-flex-direction:row;
            flex-direction:row;
    -webkit-box-align:center;
        -ms-flex-align:center;
            align-items:center;
    -ms-flex-item-align:stretch;
        align-self:stretch;
    -ms-flex-wrap:wrap;
        flex-wrap:wrap;
    margin-right:7px;
    margin-top:5px;
    min-width:0; }
    .bp3-tag-input .bp3-tag-input-values > *{
      -webkit-box-flex:0;
          -ms-flex-positive:0;
              flex-grow:0;
      -ms-flex-negative:0;
          flex-shrink:0; }
    .bp3-tag-input .bp3-tag-input-values > .bp3-fill{
      -webkit-box-flex:1;
          -ms-flex-positive:1;
              flex-grow:1;
      -ms-flex-negative:1;
          flex-shrink:1; }
    .bp3-tag-input .bp3-tag-input-values::before,
    .bp3-tag-input .bp3-tag-input-values > *{
      margin-right:5px; }
    .bp3-tag-input .bp3-tag-input-values:empty::before,
    .bp3-tag-input .bp3-tag-input-values > :last-child{
      margin-right:0; }
    .bp3-tag-input .bp3-tag-input-values:first-child .bp3-input-ghost:first-child{
      padding-left:5px; }
    .bp3-tag-input .bp3-tag-input-values > *{
      margin-bottom:5px; }
  .bp3-tag-input .bp3-tag{
    overflow-wrap:break-word; }
    .bp3-tag-input .bp3-tag.bp3-active{
      outline:rgba(19, 124, 189, 0.6) auto 2px;
      outline-offset:0;
      -moz-outline-radius:6px; }
  .bp3-tag-input .bp3-input-ghost{
    -webkit-box-flex:1;
        -ms-flex:1 1 auto;
            flex:1 1 auto;
    line-height:20px;
    width:80px; }
    .bp3-tag-input .bp3-input-ghost:disabled, .bp3-tag-input .bp3-input-ghost.bp3-disabled{
      cursor:not-allowed; }
  .bp3-tag-input .bp3-button,
  .bp3-tag-input .bp3-spinner{
    margin:3px;
    margin-left:0; }
  .bp3-tag-input .bp3-button{
    min-height:24px;
    min-width:24px;
    padding:0 7px; }
  .bp3-tag-input.bp3-large{
    height:auto;
    min-height:40px; }
    .bp3-tag-input.bp3-large::before,
    .bp3-tag-input.bp3-large > *{
      margin-right:10px; }
    .bp3-tag-input.bp3-large:empty::before,
    .bp3-tag-input.bp3-large > :last-child{
      margin-right:0; }
    .bp3-tag-input.bp3-large .bp3-tag-input-icon{
      margin-left:5px;
      margin-top:10px; }
    .bp3-tag-input.bp3-large .bp3-input-ghost{
      line-height:30px; }
    .bp3-tag-input.bp3-large .bp3-button{
      min-height:30px;
      min-width:30px;
      padding:5px 10px;
      margin:5px;
      margin-left:0; }
    .bp3-tag-input.bp3-large .bp3-spinner{
      margin:8px;
      margin-left:0; }
  .bp3-tag-input.bp3-active{
    background-color:#ffffff;
    -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-tag-input.bp3-active.bp3-intent-primary{
      -webkit-box-shadow:0 0 0 1px #106ba3, 0 0 0 3px rgba(16, 107, 163, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #106ba3, 0 0 0 3px rgba(16, 107, 163, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-tag-input.bp3-active.bp3-intent-success{
      -webkit-box-shadow:0 0 0 1px #0d8050, 0 0 0 3px rgba(13, 128, 80, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #0d8050, 0 0 0 3px rgba(13, 128, 80, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-tag-input.bp3-active.bp3-intent-warning{
      -webkit-box-shadow:0 0 0 1px #bf7326, 0 0 0 3px rgba(191, 115, 38, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #bf7326, 0 0 0 3px rgba(191, 115, 38, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-tag-input.bp3-active.bp3-intent-danger{
      -webkit-box-shadow:0 0 0 1px #c23030, 0 0 0 3px rgba(194, 48, 48, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #c23030, 0 0 0 3px rgba(194, 48, 48, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
  .bp3-dark .bp3-tag-input .bp3-tag-input-icon, .bp3-tag-input.bp3-dark .bp3-tag-input-icon{
    color:#a7b6c2; }
  .bp3-dark .bp3-tag-input .bp3-input-ghost, .bp3-tag-input.bp3-dark .bp3-input-ghost{
    color:#f5f8fa; }
    .bp3-dark .bp3-tag-input .bp3-input-ghost::-webkit-input-placeholder, .bp3-tag-input.bp3-dark .bp3-input-ghost::-webkit-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-tag-input .bp3-input-ghost::-moz-placeholder, .bp3-tag-input.bp3-dark .bp3-input-ghost::-moz-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-tag-input .bp3-input-ghost:-ms-input-placeholder, .bp3-tag-input.bp3-dark .bp3-input-ghost:-ms-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-tag-input .bp3-input-ghost::-ms-input-placeholder, .bp3-tag-input.bp3-dark .bp3-input-ghost::-ms-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-tag-input .bp3-input-ghost::placeholder, .bp3-tag-input.bp3-dark .bp3-input-ghost::placeholder{
      color:rgba(167, 182, 194, 0.6); }
  .bp3-dark .bp3-tag-input.bp3-active, .bp3-tag-input.bp3-dark.bp3-active{
    background-color:rgba(16, 22, 26, 0.3);
    -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-tag-input.bp3-active.bp3-intent-primary, .bp3-tag-input.bp3-dark.bp3-active.bp3-intent-primary{
      -webkit-box-shadow:0 0 0 1px #106ba3, 0 0 0 3px rgba(16, 107, 163, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px #106ba3, 0 0 0 3px rgba(16, 107, 163, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-tag-input.bp3-active.bp3-intent-success, .bp3-tag-input.bp3-dark.bp3-active.bp3-intent-success{
      -webkit-box-shadow:0 0 0 1px #0d8050, 0 0 0 3px rgba(13, 128, 80, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px #0d8050, 0 0 0 3px rgba(13, 128, 80, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-tag-input.bp3-active.bp3-intent-warning, .bp3-tag-input.bp3-dark.bp3-active.bp3-intent-warning{
      -webkit-box-shadow:0 0 0 1px #bf7326, 0 0 0 3px rgba(191, 115, 38, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px #bf7326, 0 0 0 3px rgba(191, 115, 38, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-tag-input.bp3-active.bp3-intent-danger, .bp3-tag-input.bp3-dark.bp3-active.bp3-intent-danger{
      -webkit-box-shadow:0 0 0 1px #c23030, 0 0 0 3px rgba(194, 48, 48, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px #c23030, 0 0 0 3px rgba(194, 48, 48, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }

.bp3-input-ghost{
  background:none;
  border:none;
  -webkit-box-shadow:none;
          box-shadow:none;
  padding:0; }
  .bp3-input-ghost::-webkit-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input-ghost::-moz-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input-ghost:-ms-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input-ghost::-ms-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input-ghost::placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input-ghost:focus{
    outline:none !important; }
.bp3-toast{
  -webkit-box-align:start;
      -ms-flex-align:start;
          align-items:flex-start;
  background-color:#ffffff;
  border-radius:3px;
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  margin:20px 0 0;
  max-width:500px;
  min-width:300px;
  pointer-events:all;
  position:relative !important; }
  .bp3-toast.bp3-toast-enter, .bp3-toast.bp3-toast-appear{
    -webkit-transform:translateY(-40px);
            transform:translateY(-40px); }
  .bp3-toast.bp3-toast-enter-active, .bp3-toast.bp3-toast-appear-active{
    -webkit-transform:translateY(0);
            transform:translateY(0);
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:300ms;
            transition-duration:300ms;
    -webkit-transition-property:-webkit-transform;
    transition-property:-webkit-transform;
    transition-property:transform;
    transition-property:transform, -webkit-transform;
    -webkit-transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11);
            transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11); }
  .bp3-toast.bp3-toast-enter ~ .bp3-toast, .bp3-toast.bp3-toast-appear ~ .bp3-toast{
    -webkit-transform:translateY(-40px);
            transform:translateY(-40px); }
  .bp3-toast.bp3-toast-enter-active ~ .bp3-toast, .bp3-toast.bp3-toast-appear-active ~ .bp3-toast{
    -webkit-transform:translateY(0);
            transform:translateY(0);
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:300ms;
            transition-duration:300ms;
    -webkit-transition-property:-webkit-transform;
    transition-property:-webkit-transform;
    transition-property:transform;
    transition-property:transform, -webkit-transform;
    -webkit-transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11);
            transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11); }
  .bp3-toast.bp3-toast-exit{
    opacity:1;
    -webkit-filter:blur(0);
            filter:blur(0); }
  .bp3-toast.bp3-toast-exit-active{
    opacity:0;
    -webkit-filter:blur(10px);
            filter:blur(10px);
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:300ms;
            transition-duration:300ms;
    -webkit-transition-property:opacity, -webkit-filter;
    transition-property:opacity, -webkit-filter;
    transition-property:opacity, filter;
    transition-property:opacity, filter, -webkit-filter;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-toast.bp3-toast-exit ~ .bp3-toast{
    -webkit-transform:translateY(0);
            transform:translateY(0); }
  .bp3-toast.bp3-toast-exit-active ~ .bp3-toast{
    -webkit-transform:translateY(-40px);
            transform:translateY(-40px);
    -webkit-transition-delay:50ms;
            transition-delay:50ms;
    -webkit-transition-duration:100ms;
            transition-duration:100ms;
    -webkit-transition-property:-webkit-transform;
    transition-property:-webkit-transform;
    transition-property:transform;
    transition-property:transform, -webkit-transform;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-toast .bp3-button-group{
    -webkit-box-flex:0;
        -ms-flex:0 0 auto;
            flex:0 0 auto;
    padding:5px;
    padding-left:0; }
  .bp3-toast > .bp3-icon{
    color:#5c7080;
    margin:12px;
    margin-right:0; }
  .bp3-toast.bp3-dark,
  .bp3-dark .bp3-toast{
    background-color:#394b59;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4); }
    .bp3-toast.bp3-dark > .bp3-icon,
    .bp3-dark .bp3-toast > .bp3-icon{
      color:#a7b6c2; }
  .bp3-toast[class*="bp3-intent-"] a{
    color:rgba(255, 255, 255, 0.7); }
    .bp3-toast[class*="bp3-intent-"] a:hover{
      color:#ffffff; }
  .bp3-toast[class*="bp3-intent-"] > .bp3-icon{
    color:#ffffff; }
  .bp3-toast[class*="bp3-intent-"] .bp3-button, .bp3-toast[class*="bp3-intent-"] .bp3-button::before,
  .bp3-toast[class*="bp3-intent-"] .bp3-button .bp3-icon, .bp3-toast[class*="bp3-intent-"] .bp3-button:active{
    color:rgba(255, 255, 255, 0.7) !important; }
  .bp3-toast[class*="bp3-intent-"] .bp3-button:focus{
    outline-color:rgba(255, 255, 255, 0.5); }
  .bp3-toast[class*="bp3-intent-"] .bp3-button:hover{
    background-color:rgba(255, 255, 255, 0.15) !important;
    color:#ffffff !important; }
  .bp3-toast[class*="bp3-intent-"] .bp3-button:active{
    background-color:rgba(255, 255, 255, 0.3) !important;
    color:#ffffff !important; }
  .bp3-toast[class*="bp3-intent-"] .bp3-button::after{
    background:rgba(255, 255, 255, 0.3) !important; }
  .bp3-toast.bp3-intent-primary{
    background-color:#137cbd;
    color:#ffffff; }
  .bp3-toast.bp3-intent-success{
    background-color:#0f9960;
    color:#ffffff; }
  .bp3-toast.bp3-intent-warning{
    background-color:#d9822b;
    color:#ffffff; }
  .bp3-toast.bp3-intent-danger{
    background-color:#db3737;
    color:#ffffff; }

.bp3-toast-message{
  -webkit-box-flex:1;
      -ms-flex:1 1 auto;
          flex:1 1 auto;
  padding:11px;
  word-break:break-word; }

.bp3-toast-container{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  display:-webkit-box !important;
  display:-ms-flexbox !important;
  display:flex !important;
  -webkit-box-orient:vertical;
  -webkit-box-direction:normal;
      -ms-flex-direction:column;
          flex-direction:column;
  left:0;
  overflow:hidden;
  padding:0 20px 20px;
  pointer-events:none;
  right:0;
  z-index:40; }
  .bp3-toast-container.bp3-toast-container-in-portal{
    position:fixed; }
  .bp3-toast-container.bp3-toast-container-inline{
    position:absolute; }
  .bp3-toast-container.bp3-toast-container-top{
    top:0; }
  .bp3-toast-container.bp3-toast-container-bottom{
    bottom:0;
    -webkit-box-orient:vertical;
    -webkit-box-direction:reverse;
        -ms-flex-direction:column-reverse;
            flex-direction:column-reverse;
    top:auto; }
  .bp3-toast-container.bp3-toast-container-left{
    -webkit-box-align:start;
        -ms-flex-align:start;
            align-items:flex-start; }
  .bp3-toast-container.bp3-toast-container-right{
    -webkit-box-align:end;
        -ms-flex-align:end;
            align-items:flex-end; }

.bp3-toast-container-bottom .bp3-toast.bp3-toast-enter:not(.bp3-toast-enter-active),
.bp3-toast-container-bottom .bp3-toast.bp3-toast-enter:not(.bp3-toast-enter-active) ~ .bp3-toast, .bp3-toast-container-bottom .bp3-toast.bp3-toast-appear:not(.bp3-toast-appear-active),
.bp3-toast-container-bottom .bp3-toast.bp3-toast-appear:not(.bp3-toast-appear-active) ~ .bp3-toast,
.bp3-toast-container-bottom .bp3-toast.bp3-toast-exit-active ~ .bp3-toast,
.bp3-toast-container-bottom .bp3-toast.bp3-toast-leave-active ~ .bp3-toast{
  -webkit-transform:translateY(60px);
          transform:translateY(60px); }
.bp3-tooltip{
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
  -webkit-transform:scale(1);
          transform:scale(1); }
  .bp3-tooltip .bp3-popover-arrow{
    height:22px;
    position:absolute;
    width:22px; }
    .bp3-tooltip .bp3-popover-arrow::before{
      height:14px;
      margin:4px;
      width:14px; }
  .bp3-tether-element-attached-bottom.bp3-tether-target-attached-top > .bp3-tooltip{
    margin-bottom:11px;
    margin-top:-11px; }
    .bp3-tether-element-attached-bottom.bp3-tether-target-attached-top > .bp3-tooltip > .bp3-popover-arrow{
      bottom:-8px; }
      .bp3-tether-element-attached-bottom.bp3-tether-target-attached-top > .bp3-tooltip > .bp3-popover-arrow svg{
        -webkit-transform:rotate(-90deg);
                transform:rotate(-90deg); }
  .bp3-tether-element-attached-left.bp3-tether-target-attached-right > .bp3-tooltip{
    margin-left:11px; }
    .bp3-tether-element-attached-left.bp3-tether-target-attached-right > .bp3-tooltip > .bp3-popover-arrow{
      left:-8px; }
      .bp3-tether-element-attached-left.bp3-tether-target-attached-right > .bp3-tooltip > .bp3-popover-arrow svg{
        -webkit-transform:rotate(0);
                transform:rotate(0); }
  .bp3-tether-element-attached-top.bp3-tether-target-attached-bottom > .bp3-tooltip{
    margin-top:11px; }
    .bp3-tether-element-attached-top.bp3-tether-target-attached-bottom > .bp3-tooltip > .bp3-popover-arrow{
      top:-8px; }
      .bp3-tether-element-attached-top.bp3-tether-target-attached-bottom > .bp3-tooltip > .bp3-popover-arrow svg{
        -webkit-transform:rotate(90deg);
                transform:rotate(90deg); }
  .bp3-tether-element-attached-right.bp3-tether-target-attached-left > .bp3-tooltip{
    margin-left:-11px;
    margin-right:11px; }
    .bp3-tether-element-attached-right.bp3-tether-target-attached-left > .bp3-tooltip > .bp3-popover-arrow{
      right:-8px; }
      .bp3-tether-element-attached-right.bp3-tether-target-attached-left > .bp3-tooltip > .bp3-popover-arrow svg{
        -webkit-transform:rotate(180deg);
                transform:rotate(180deg); }
  .bp3-tether-element-attached-middle > .bp3-tooltip > .bp3-popover-arrow{
    top:50%;
    -webkit-transform:translateY(-50%);
            transform:translateY(-50%); }
  .bp3-tether-element-attached-center > .bp3-tooltip > .bp3-popover-arrow{
    right:50%;
    -webkit-transform:translateX(50%);
            transform:translateX(50%); }
  .bp3-tether-element-attached-top.bp3-tether-target-attached-top > .bp3-tooltip > .bp3-popover-arrow{
    top:-0.22183px; }
  .bp3-tether-element-attached-right.bp3-tether-target-attached-right > .bp3-tooltip > .bp3-popover-arrow{
    right:-0.22183px; }
  .bp3-tether-element-attached-left.bp3-tether-target-attached-left > .bp3-tooltip > .bp3-popover-arrow{
    left:-0.22183px; }
  .bp3-tether-element-attached-bottom.bp3-tether-target-attached-bottom > .bp3-tooltip > .bp3-popover-arrow{
    bottom:-0.22183px; }
  .bp3-tether-element-attached-top.bp3-tether-element-attached-left > .bp3-tooltip{
    -webkit-transform-origin:top left;
            transform-origin:top left; }
  .bp3-tether-element-attached-top.bp3-tether-element-attached-center > .bp3-tooltip{
    -webkit-transform-origin:top center;
            transform-origin:top center; }
  .bp3-tether-element-attached-top.bp3-tether-element-attached-right > .bp3-tooltip{
    -webkit-transform-origin:top right;
            transform-origin:top right; }
  .bp3-tether-element-attached-middle.bp3-tether-element-attached-left > .bp3-tooltip{
    -webkit-transform-origin:center left;
            transform-origin:center left; }
  .bp3-tether-element-attached-middle.bp3-tether-element-attached-center > .bp3-tooltip{
    -webkit-transform-origin:center center;
            transform-origin:center center; }
  .bp3-tether-element-attached-middle.bp3-tether-element-attached-right > .bp3-tooltip{
    -webkit-transform-origin:center right;
            transform-origin:center right; }
  .bp3-tether-element-attached-bottom.bp3-tether-element-attached-left > .bp3-tooltip{
    -webkit-transform-origin:bottom left;
            transform-origin:bottom left; }
  .bp3-tether-element-attached-bottom.bp3-tether-element-attached-center > .bp3-tooltip{
    -webkit-transform-origin:bottom center;
            transform-origin:bottom center; }
  .bp3-tether-element-attached-bottom.bp3-tether-element-attached-right > .bp3-tooltip{
    -webkit-transform-origin:bottom right;
            transform-origin:bottom right; }
  .bp3-tooltip .bp3-popover-content{
    background:#394b59;
    color:#f5f8fa; }
  .bp3-tooltip .bp3-popover-arrow::before{
    -webkit-box-shadow:1px 1px 6px rgba(16, 22, 26, 0.2);
            box-shadow:1px 1px 6px rgba(16, 22, 26, 0.2); }
  .bp3-tooltip .bp3-popover-arrow-border{
    fill:#10161a;
    fill-opacity:0.1; }
  .bp3-tooltip .bp3-popover-arrow-fill{
    fill:#394b59; }
  .bp3-popover-enter > .bp3-tooltip, .bp3-popover-appear > .bp3-tooltip{
    -webkit-transform:scale(0.8);
            transform:scale(0.8); }
  .bp3-popover-enter-active > .bp3-tooltip, .bp3-popover-appear-active > .bp3-tooltip{
    -webkit-transform:scale(1);
            transform:scale(1);
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:100ms;
            transition-duration:100ms;
    -webkit-transition-property:-webkit-transform;
    transition-property:-webkit-transform;
    transition-property:transform;
    transition-property:transform, -webkit-transform;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-popover-exit > .bp3-tooltip{
    -webkit-transform:scale(1);
            transform:scale(1); }
  .bp3-popover-exit-active > .bp3-tooltip{
    -webkit-transform:scale(0.8);
            transform:scale(0.8);
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:100ms;
            transition-duration:100ms;
    -webkit-transition-property:-webkit-transform;
    transition-property:-webkit-transform;
    transition-property:transform;
    transition-property:transform, -webkit-transform;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-tooltip .bp3-popover-content{
    padding:10px 12px; }
  .bp3-tooltip.bp3-dark,
  .bp3-dark .bp3-tooltip{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4); }
    .bp3-tooltip.bp3-dark .bp3-popover-content,
    .bp3-dark .bp3-tooltip .bp3-popover-content{
      background:#e1e8ed;
      color:#394b59; }
    .bp3-tooltip.bp3-dark .bp3-popover-arrow::before,
    .bp3-dark .bp3-tooltip .bp3-popover-arrow::before{
      -webkit-box-shadow:1px 1px 6px rgba(16, 22, 26, 0.4);
              box-shadow:1px 1px 6px rgba(16, 22, 26, 0.4); }
    .bp3-tooltip.bp3-dark .bp3-popover-arrow-border,
    .bp3-dark .bp3-tooltip .bp3-popover-arrow-border{
      fill:#10161a;
      fill-opacity:0.2; }
    .bp3-tooltip.bp3-dark .bp3-popover-arrow-fill,
    .bp3-dark .bp3-tooltip .bp3-popover-arrow-fill{
      fill:#e1e8ed; }
  .bp3-tooltip.bp3-intent-primary .bp3-popover-content{
    background:#137cbd;
    color:#ffffff; }
  .bp3-tooltip.bp3-intent-primary .bp3-popover-arrow-fill{
    fill:#137cbd; }
  .bp3-tooltip.bp3-intent-success .bp3-popover-content{
    background:#0f9960;
    color:#ffffff; }
  .bp3-tooltip.bp3-intent-success .bp3-popover-arrow-fill{
    fill:#0f9960; }
  .bp3-tooltip.bp3-intent-warning .bp3-popover-content{
    background:#d9822b;
    color:#ffffff; }
  .bp3-tooltip.bp3-intent-warning .bp3-popover-arrow-fill{
    fill:#d9822b; }
  .bp3-tooltip.bp3-intent-danger .bp3-popover-content{
    background:#db3737;
    color:#ffffff; }
  .bp3-tooltip.bp3-intent-danger .bp3-popover-arrow-fill{
    fill:#db3737; }

.bp3-tooltip-indicator{
  border-bottom:dotted 1px;
  cursor:help; }
.bp3-tree .bp3-icon, .bp3-tree .bp3-icon-standard, .bp3-tree .bp3-icon-large{
  color:#5c7080; }
  .bp3-tree .bp3-icon.bp3-intent-primary, .bp3-tree .bp3-icon-standard.bp3-intent-primary, .bp3-tree .bp3-icon-large.bp3-intent-primary{
    color:#137cbd; }
  .bp3-tree .bp3-icon.bp3-intent-success, .bp3-tree .bp3-icon-standard.bp3-intent-success, .bp3-tree .bp3-icon-large.bp3-intent-success{
    color:#0f9960; }
  .bp3-tree .bp3-icon.bp3-intent-warning, .bp3-tree .bp3-icon-standard.bp3-intent-warning, .bp3-tree .bp3-icon-large.bp3-intent-warning{
    color:#d9822b; }
  .bp3-tree .bp3-icon.bp3-intent-danger, .bp3-tree .bp3-icon-standard.bp3-intent-danger, .bp3-tree .bp3-icon-large.bp3-intent-danger{
    color:#db3737; }

.bp3-tree-node-list{
  list-style:none;
  margin:0;
  padding-left:0; }

.bp3-tree-root{
  background-color:transparent;
  cursor:default;
  padding-left:0;
  position:relative; }

.bp3-tree-node-content-0{
  padding-left:0px; }

.bp3-tree-node-content-1{
  padding-left:23px; }

.bp3-tree-node-content-2{
  padding-left:46px; }

.bp3-tree-node-content-3{
  padding-left:69px; }

.bp3-tree-node-content-4{
  padding-left:92px; }

.bp3-tree-node-content-5{
  padding-left:115px; }

.bp3-tree-node-content-6{
  padding-left:138px; }

.bp3-tree-node-content-7{
  padding-left:161px; }

.bp3-tree-node-content-8{
  padding-left:184px; }

.bp3-tree-node-content-9{
  padding-left:207px; }

.bp3-tree-node-content-10{
  padding-left:230px; }

.bp3-tree-node-content-11{
  padding-left:253px; }

.bp3-tree-node-content-12{
  padding-left:276px; }

.bp3-tree-node-content-13{
  padding-left:299px; }

.bp3-tree-node-content-14{
  padding-left:322px; }

.bp3-tree-node-content-15{
  padding-left:345px; }

.bp3-tree-node-content-16{
  padding-left:368px; }

.bp3-tree-node-content-17{
  padding-left:391px; }

.bp3-tree-node-content-18{
  padding-left:414px; }

.bp3-tree-node-content-19{
  padding-left:437px; }

.bp3-tree-node-content-20{
  padding-left:460px; }

.bp3-tree-node-content{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  height:30px;
  padding-right:5px;
  width:100%; }
  .bp3-tree-node-content:hover{
    background-color:rgba(191, 204, 214, 0.4); }

.bp3-tree-node-caret,
.bp3-tree-node-caret-none{
  min-width:30px; }

.bp3-tree-node-caret{
  color:#5c7080;
  cursor:pointer;
  padding:7px;
  -webkit-transform:rotate(0deg);
          transform:rotate(0deg);
  -webkit-transition:-webkit-transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:-webkit-transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-tree-node-caret:hover{
    color:#182026; }
  .bp3-dark .bp3-tree-node-caret{
    color:#a7b6c2; }
    .bp3-dark .bp3-tree-node-caret:hover{
      color:#f5f8fa; }
  .bp3-tree-node-caret.bp3-tree-node-caret-open{
    -webkit-transform:rotate(90deg);
            transform:rotate(90deg); }
  .bp3-tree-node-caret.bp3-icon-standard::before{
    content:""; }

.bp3-tree-node-icon{
  margin-right:7px;
  position:relative; }

.bp3-tree-node-label{
  overflow:hidden;
  text-overflow:ellipsis;
  white-space:nowrap;
  word-wrap:normal;
  -webkit-box-flex:1;
      -ms-flex:1 1 auto;
          flex:1 1 auto;
  position:relative;
  -webkit-user-select:none;
     -moz-user-select:none;
      -ms-user-select:none;
          user-select:none; }
  .bp3-tree-node-label span{
    display:inline; }

.bp3-tree-node-secondary-label{
  padding:0 5px;
  -webkit-user-select:none;
     -moz-user-select:none;
      -ms-user-select:none;
          user-select:none; }
  .bp3-tree-node-secondary-label .bp3-popover-wrapper,
  .bp3-tree-node-secondary-label .bp3-popover-target{
    -webkit-box-align:center;
        -ms-flex-align:center;
            align-items:center;
    display:-webkit-box;
    display:-ms-flexbox;
    display:flex; }

.bp3-tree-node.bp3-disabled .bp3-tree-node-content{
  background-color:inherit;
  color:rgba(92, 112, 128, 0.6);
  cursor:not-allowed; }

.bp3-tree-node.bp3-disabled .bp3-tree-node-caret,
.bp3-tree-node.bp3-disabled .bp3-tree-node-icon{
  color:rgba(92, 112, 128, 0.6);
  cursor:not-allowed; }

.bp3-tree-node.bp3-tree-node-selected > .bp3-tree-node-content{
  background-color:#137cbd; }
  .bp3-tree-node.bp3-tree-node-selected > .bp3-tree-node-content,
  .bp3-tree-node.bp3-tree-node-selected > .bp3-tree-node-content .bp3-icon, .bp3-tree-node.bp3-tree-node-selected > .bp3-tree-node-content .bp3-icon-standard, .bp3-tree-node.bp3-tree-node-selected > .bp3-tree-node-content .bp3-icon-large{
    color:#ffffff; }
  .bp3-tree-node.bp3-tree-node-selected > .bp3-tree-node-content .bp3-tree-node-caret::before{
    color:rgba(255, 255, 255, 0.7); }
  .bp3-tree-node.bp3-tree-node-selected > .bp3-tree-node-content .bp3-tree-node-caret:hover::before{
    color:#ffffff; }

.bp3-dark .bp3-tree-node-content:hover{
  background-color:rgba(92, 112, 128, 0.3); }

.bp3-dark .bp3-tree .bp3-icon, .bp3-dark .bp3-tree .bp3-icon-standard, .bp3-dark .bp3-tree .bp3-icon-large{
  color:#a7b6c2; }
  .bp3-dark .bp3-tree .bp3-icon.bp3-intent-primary, .bp3-dark .bp3-tree .bp3-icon-standard.bp3-intent-primary, .bp3-dark .bp3-tree .bp3-icon-large.bp3-intent-primary{
    color:#137cbd; }
  .bp3-dark .bp3-tree .bp3-icon.bp3-intent-success, .bp3-dark .bp3-tree .bp3-icon-standard.bp3-intent-success, .bp3-dark .bp3-tree .bp3-icon-large.bp3-intent-success{
    color:#0f9960; }
  .bp3-dark .bp3-tree .bp3-icon.bp3-intent-warning, .bp3-dark .bp3-tree .bp3-icon-standard.bp3-intent-warning, .bp3-dark .bp3-tree .bp3-icon-large.bp3-intent-warning{
    color:#d9822b; }
  .bp3-dark .bp3-tree .bp3-icon.bp3-intent-danger, .bp3-dark .bp3-tree .bp3-icon-standard.bp3-intent-danger, .bp3-dark .bp3-tree .bp3-icon-large.bp3-intent-danger{
    color:#db3737; }

.bp3-dark .bp3-tree-node.bp3-tree-node-selected > .bp3-tree-node-content{
  background-color:#137cbd; }
.bp3-omnibar{
  -webkit-filter:blur(0);
          filter:blur(0);
  opacity:1;
  background-color:#ffffff;
  border-radius:3px;
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 4px 8px rgba(16, 22, 26, 0.2), 0 18px 46px 6px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 4px 8px rgba(16, 22, 26, 0.2), 0 18px 46px 6px rgba(16, 22, 26, 0.2);
  left:calc(50% - 250px);
  top:20vh;
  width:500px;
  z-index:21; }
  .bp3-omnibar.bp3-overlay-enter, .bp3-omnibar.bp3-overlay-appear{
    -webkit-filter:blur(20px);
            filter:blur(20px);
    opacity:0.2; }
  .bp3-omnibar.bp3-overlay-enter-active, .bp3-omnibar.bp3-overlay-appear-active{
    -webkit-filter:blur(0);
            filter:blur(0);
    opacity:1;
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:200ms;
            transition-duration:200ms;
    -webkit-transition-property:opacity, -webkit-filter;
    transition-property:opacity, -webkit-filter;
    transition-property:filter, opacity;
    transition-property:filter, opacity, -webkit-filter;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-omnibar.bp3-overlay-exit{
    -webkit-filter:blur(0);
            filter:blur(0);
    opacity:1; }
  .bp3-omnibar.bp3-overlay-exit-active{
    -webkit-filter:blur(20px);
            filter:blur(20px);
    opacity:0.2;
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:200ms;
            transition-duration:200ms;
    -webkit-transition-property:opacity, -webkit-filter;
    transition-property:opacity, -webkit-filter;
    transition-property:filter, opacity;
    transition-property:filter, opacity, -webkit-filter;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-omnibar .bp3-input{
    background-color:transparent;
    border-radius:0; }
    .bp3-omnibar .bp3-input, .bp3-omnibar .bp3-input:focus{
      -webkit-box-shadow:none;
              box-shadow:none; }
  .bp3-omnibar .bp3-menu{
    background-color:transparent;
    border-radius:0;
    -webkit-box-shadow:inset 0 1px 0 rgba(16, 22, 26, 0.15);
            box-shadow:inset 0 1px 0 rgba(16, 22, 26, 0.15);
    max-height:calc(60vh - 40px);
    overflow:auto; }
    .bp3-omnibar .bp3-menu:empty{
      display:none; }
  .bp3-dark .bp3-omnibar, .bp3-omnibar.bp3-dark{
    background-color:#30404d;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 4px 8px rgba(16, 22, 26, 0.4), 0 18px 46px 6px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 4px 8px rgba(16, 22, 26, 0.4), 0 18px 46px 6px rgba(16, 22, 26, 0.4); }

.bp3-omnibar-overlay .bp3-overlay-backdrop{
  background-color:rgba(16, 22, 26, 0.2); }

.bp3-select-popover .bp3-popover-content{
  padding:5px; }

.bp3-select-popover .bp3-input-group{
  margin-bottom:0; }

.bp3-select-popover .bp3-menu{
  max-height:300px;
  max-width:400px;
  overflow:auto;
  padding:0; }
  .bp3-select-popover .bp3-menu:not(:first-child){
    padding-top:5px; }

.bp3-multi-select{
  min-width:150px; }

.bp3-multi-select-popover .bp3-menu{
  max-height:300px;
  max-width:400px;
  overflow:auto; }

.bp3-select-popover .bp3-popover-content{
  padding:5px; }

.bp3-select-popover .bp3-input-group{
  margin-bottom:0; }

.bp3-select-popover .bp3-menu{
  max-height:300px;
  max-width:400px;
  overflow:auto;
  padding:0; }
  .bp3-select-popover .bp3-menu:not(:first-child){
    padding-top:5px; }
/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/* This file was auto-generated by ensureUiComponents() in @jupyterlab/buildutils */

/**
 * (DEPRECATED) Support for consuming icons as CSS background images
 */

/* Icons urls */

:root {
  --jp-icon-add: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTE5IDEzaC02djZoLTJ2LTZINXYtMmg2VjVoMnY2aDZ2MnoiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-bug: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIj4KICAgIDxwYXRoIGQ9Ik0yMCA4aC0yLjgxYy0uNDUtLjc4LTEuMDctMS40NS0xLjgyLTEuOTZMMTcgNC40MSAxNS41OSAzbC0yLjE3IDIuMTdDMTIuOTYgNS4wNiAxMi40OSA1IDEyIDVjLS40OSAwLS45Ni4wNi0xLjQxLjE3TDguNDEgMyA3IDQuNDFsMS42MiAxLjYzQzcuODggNi41NSA3LjI2IDcuMjIgNi44MSA4SDR2MmgyLjA5Yy0uMDUuMzMtLjA5LjY2LS4wOSAxdjFINHYyaDJ2MWMwIC4zNC4wNC42Ny4wOSAxSDR2MmgyLjgxYzEuMDQgMS43OSAyLjk3IDMgNS4xOSAzczQuMTUtMS4yMSA1LjE5LTNIMjB2LTJoLTIuMDljLjA1LS4zMy4wOS0uNjYuMDktMXYtMWgydi0yaC0ydi0xYzAtLjM0LS4wNC0uNjctLjA5LTFIMjBWOHptLTYgOGgtNHYtMmg0djJ6bTAtNGgtNHYtMmg0djJ6Ii8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-build: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTE0LjkgMTcuNDVDMTYuMjUgMTcuNDUgMTcuMzUgMTYuMzUgMTcuMzUgMTVDMTcuMzUgMTMuNjUgMTYuMjUgMTIuNTUgMTQuOSAxMi41NUMxMy41NCAxMi41NSAxMi40NSAxMy42NSAxMi40NSAxNUMxMi40NSAxNi4zNSAxMy41NCAxNy40NSAxNC45IDE3LjQ1Wk0yMC4xIDE1LjY4TDIxLjU4IDE2Ljg0QzIxLjcxIDE2Ljk1IDIxLjc1IDE3LjEzIDIxLjY2IDE3LjI5TDIwLjI2IDE5LjcxQzIwLjE3IDE5Ljg2IDIwIDE5LjkyIDE5LjgzIDE5Ljg2TDE4LjA5IDE5LjE2QzE3LjczIDE5LjQ0IDE3LjMzIDE5LjY3IDE2LjkxIDE5Ljg1TDE2LjY0IDIxLjdDMTYuNjIgMjEuODcgMTYuNDcgMjIgMTYuMyAyMkgxMy41QzEzLjMyIDIyIDEzLjE4IDIxLjg3IDEzLjE1IDIxLjdMMTIuODkgMTkuODVDMTIuNDYgMTkuNjcgMTIuMDcgMTkuNDQgMTEuNzEgMTkuMTZMOS45NjAwMiAxOS44NkM5LjgxMDAyIDE5LjkyIDkuNjIwMDIgMTkuODYgOS41NDAwMiAxOS43MUw4LjE0MDAyIDE3LjI5QzguMDUwMDIgMTcuMTMgOC4wOTAwMiAxNi45NSA4LjIyMDAyIDE2Ljg0TDkuNzAwMDIgMTUuNjhMOS42NTAwMSAxNUw5LjcwMDAyIDE0LjMxTDguMjIwMDIgMTMuMTZDOC4wOTAwMiAxMy4wNSA4LjA1MDAyIDEyLjg2IDguMTQwMDIgMTIuNzFMOS41NDAwMiAxMC4yOUM5LjYyMDAyIDEwLjEzIDkuODEwMDIgMTAuMDcgOS45NjAwMiAxMC4xM0wxMS43MSAxMC44NEMxMi4wNyAxMC41NiAxMi40NiAxMC4zMiAxMi44OSAxMC4xNUwxMy4xNSA4LjI4OTk4QzEzLjE4IDguMTI5OTggMTMuMzIgNy45OTk5OCAxMy41IDcuOTk5OThIMTYuM0MxNi40NyA3Ljk5OTk4IDE2LjYyIDguMTI5OTggMTYuNjQgOC4yODk5OEwxNi45MSAxMC4xNUMxNy4zMyAxMC4zMiAxNy43MyAxMC41NiAxOC4wOSAxMC44NEwxOS44MyAxMC4xM0MyMCAxMC4wNyAyMC4xNyAxMC4xMyAyMC4yNiAxMC4yOUwyMS42NiAxMi43MUMyMS43NSAxMi44NiAyMS43MSAxMy4wNSAyMS41OCAxMy4xNkwyMC4xIDE0LjMxTDIwLjE1IDE1TDIwLjEgMTUuNjhaIi8+CiAgICA8cGF0aCBkPSJNNy4zMjk2NiA3LjQ0NDU0QzguMDgzMSA3LjAwOTU0IDguMzM5MzIgNi4wNTMzMiA3LjkwNDMyIDUuMjk5ODhDNy40NjkzMiA0LjU0NjQzIDYuNTA4MSA0LjI4MTU2IDUuNzU0NjYgNC43MTY1NkM1LjM5MTc2IDQuOTI2MDggNS4xMjY5NSA1LjI3MTE4IDUuMDE4NDkgNS42NzU5NEM0LjkxMDA0IDYuMDgwNzEgNC45NjY4MiA2LjUxMTk4IDUuMTc2MzQgNi44NzQ4OEM1LjYxMTM0IDcuNjI4MzIgNi41NzYyMiA3Ljg3OTU0IDcuMzI5NjYgNy40NDQ1NFpNOS42NTcxOCA0Ljc5NTkzTDEwLjg2NzIgNC45NTE3OUMxMC45NjI4IDQuOTc3NDEgMTEuMDQwMiA1LjA3MTMzIDExLjAzODIgNS4xODc5M0wxMS4wMzg4IDYuOTg4OTNDMTEuMDQ1NSA3LjEwMDU0IDEwLjk2MTYgNy4xOTUxOCAxMC44NTUgNy4yMTA1NEw5LjY2MDAxIDcuMzgwODNMOS4yMzkxNSA4LjEzMTg4TDkuNjY5NjEgOS4yNTc0NUM5LjcwNzI5IDkuMzYyNzEgOS42NjkzNCA5LjQ3Njk5IDkuNTc0MDggOS41MzE5OUw4LjAxNTIzIDEwLjQzMkM3LjkxMTMxIDEwLjQ5MiA3Ljc5MzM3IDEwLjQ2NzcgNy43MjEwNSAxMC4zODI0TDYuOTg3NDggOS40MzE4OEw2LjEwOTMxIDkuNDMwODNMNS4zNDcwNCAxMC4zOTA1QzUuMjg5MDkgMTAuNDcwMiA1LjE3MzgzIDEwLjQ5MDUgNS4wNzE4NyAxMC40MzM5TDMuNTEyNDUgOS41MzI5M0MzLjQxMDQ5IDkuNDc2MzMgMy4zNzY0NyA5LjM1NzQxIDMuNDEwNzUgOS4yNTY3OUwzLjg2MzQ3IDguMTQwOTNMMy42MTc0OSA3Ljc3NDg4TDMuNDIzNDcgNy4zNzg4M0wyLjIzMDc1IDcuMjEyOTdDMi4xMjY0NyA3LjE5MjM1IDIuMDQwNDkgNy4xMDM0MiAyLjA0MjQ1IDYuOTg2ODJMMi4wNDE4NyA1LjE4NTgyQzIuMDQzODMgNS4wNjkyMiAyLjExOTA5IDQuOTc5NTggMi4yMTcwNCA0Ljk2OTIyTDMuNDIwNjUgNC43OTM5M0wzLjg2NzQ5IDQuMDI3ODhMMy40MTEwNSAyLjkxNzMxQzMuMzczMzcgMi44MTIwNCAzLjQxMTMxIDIuNjk3NzYgMy41MTUyMyAyLjYzNzc2TDUuMDc0MDggMS43Mzc3NkM1LjE2OTM0IDEuNjgyNzYgNS4yODcyOSAxLjcwNzA0IDUuMzU5NjEgMS43OTIzMUw2LjExOTE1IDIuNzI3ODhMNi45ODAwMSAyLjczODkzTDcuNzI0OTYgMS43ODkyMkM3Ljc5MTU2IDEuNzA0NTggNy45MTU0OCAxLjY3OTIyIDguMDA4NzkgMS43NDA4Mkw5LjU2ODIxIDIuNjQxODJDOS42NzAxNyAyLjY5ODQyIDkuNzEyODUgMi44MTIzNCA5LjY4NzIzIDIuOTA3OTdMOS4yMTcxOCA0LjAzMzgzTDkuNDYzMTYgNC4zOTk4OEw5LjY1NzE4IDQuNzk1OTNaIi8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-caret-down-empty-thin: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIwIDIwIj4KCTxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSIgc2hhcGUtcmVuZGVyaW5nPSJnZW9tZXRyaWNQcmVjaXNpb24iPgoJCTxwb2x5Z29uIGNsYXNzPSJzdDEiIHBvaW50cz0iOS45LDEzLjYgMy42LDcuNCA0LjQsNi42IDkuOSwxMi4yIDE1LjQsNi43IDE2LjEsNy40ICIvPgoJPC9nPgo8L3N2Zz4K);
  --jp-icon-caret-down-empty: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDE4IDE4Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiIHNoYXBlLXJlbmRlcmluZz0iZ2VvbWV0cmljUHJlY2lzaW9uIj4KICAgIDxwYXRoIGQ9Ik01LjIsNS45TDksOS43bDMuOC0zLjhsMS4yLDEuMmwtNC45LDVsLTQuOS01TDUuMiw1Ljl6Ii8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-caret-down: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDE4IDE4Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiIHNoYXBlLXJlbmRlcmluZz0iZ2VvbWV0cmljUHJlY2lzaW9uIj4KICAgIDxwYXRoIGQ9Ik01LjIsNy41TDksMTEuMmwzLjgtMy44SDUuMnoiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-caret-left: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDE4IDE4Ij4KCTxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSIgc2hhcGUtcmVuZGVyaW5nPSJnZW9tZXRyaWNQcmVjaXNpb24iPgoJCTxwYXRoIGQ9Ik0xMC44LDEyLjhMNy4xLDlsMy44LTMuOGwwLDcuNkgxMC44eiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-caret-right: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDE4IDE4Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiIHNoYXBlLXJlbmRlcmluZz0iZ2VvbWV0cmljUHJlY2lzaW9uIj4KICAgIDxwYXRoIGQ9Ik03LjIsNS4yTDEwLjksOWwtMy44LDMuOFY1LjJINy4yeiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-caret-up-empty-thin: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIwIDIwIj4KCTxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSIgc2hhcGUtcmVuZGVyaW5nPSJnZW9tZXRyaWNQcmVjaXNpb24iPgoJCTxwb2x5Z29uIGNsYXNzPSJzdDEiIHBvaW50cz0iMTUuNCwxMy4zIDkuOSw3LjcgNC40LDEzLjIgMy42LDEyLjUgOS45LDYuMyAxNi4xLDEyLjYgIi8+Cgk8L2c+Cjwvc3ZnPgo=);
  --jp-icon-caret-up: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDE4IDE4Ij4KCTxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSIgc2hhcGUtcmVuZGVyaW5nPSJnZW9tZXRyaWNQcmVjaXNpb24iPgoJCTxwYXRoIGQ9Ik01LjIsMTAuNUw5LDYuOGwzLjgsMy44SDUuMnoiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-case-sensitive: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIwIDIwIj4KICA8ZyBjbGFzcz0ianAtaWNvbjIiIGZpbGw9IiM0MTQxNDEiPgogICAgPHJlY3QgeD0iMiIgeT0iMiIgd2lkdGg9IjE2IiBoZWlnaHQ9IjE2Ii8+CiAgPC9nPgogIDxnIGNsYXNzPSJqcC1pY29uLWFjY2VudDIiIGZpbGw9IiNGRkYiPgogICAgPHBhdGggZD0iTTcuNiw4aDAuOWwzLjUsOGgtMS4xTDEwLDE0SDZsLTAuOSwySDRMNy42LDh6IE04LDkuMUw2LjQsMTNoMy4yTDgsOS4xeiIvPgogICAgPHBhdGggZD0iTTE2LjYsOS44Yy0wLjIsMC4xLTAuNCwwLjEtMC43LDAuMWMtMC4yLDAtMC40LTAuMS0wLjYtMC4yYy0wLjEtMC4xLTAuMi0wLjQtMC4yLTAuNyBjLTAuMywwLjMtMC42LDAuNS0wLjksMC43Yy0wLjMsMC4xLTAuNywwLjItMS4xLDAuMmMtMC4zLDAtMC41LDAtMC43LTAuMWMtMC4yLTAuMS0wLjQtMC4yLTAuNi0wLjNjLTAuMi0wLjEtMC4zLTAuMy0wLjQtMC41IGMtMC4xLTAuMi0wLjEtMC40LTAuMS0wLjdjMC0wLjMsMC4xLTAuNiwwLjItMC44YzAuMS0wLjIsMC4zLTAuNCwwLjQtMC41QzEyLDcsMTIuMiw2LjksMTIuNSw2LjhjMC4yLTAuMSwwLjUtMC4xLDAuNy0wLjIgYzAuMy0wLjEsMC41LTAuMSwwLjctMC4xYzAuMiwwLDAuNC0wLjEsMC42LTAuMWMwLjIsMCwwLjMtMC4xLDAuNC0wLjJjMC4xLTAuMSwwLjItMC4yLDAuMi0wLjRjMC0xLTEuMS0xLTEuMy0xIGMtMC40LDAtMS40LDAtMS40LDEuMmgtMC45YzAtMC40LDAuMS0wLjcsMC4yLTFjMC4xLTAuMiwwLjMtMC40LDAuNS0wLjZjMC4yLTAuMiwwLjUtMC4zLDAuOC0wLjNDMTMuMyw0LDEzLjYsNCwxMy45LDQgYzAuMywwLDAuNSwwLDAuOCwwLjFjMC4zLDAsMC41LDAuMSwwLjcsMC4yYzAuMiwwLjEsMC40LDAuMywwLjUsMC41QzE2LDUsMTYsNS4yLDE2LDUuNnYyLjljMCwwLjIsMCwwLjQsMCwwLjUgYzAsMC4xLDAuMSwwLjIsMC4zLDAuMmMwLjEsMCwwLjIsMCwwLjMsMFY5Ljh6IE0xNS4yLDYuOWMtMS4yLDAuNi0zLjEsMC4yLTMuMSwxLjRjMCwxLjQsMy4xLDEsMy4xLTAuNVY2Ljl6Ii8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-check: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIj4KICAgIDxwYXRoIGQ9Ik05IDE2LjE3TDQuODMgMTJsLTEuNDIgMS40MUw5IDE5IDIxIDdsLTEuNDEtMS40MXoiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-circle-empty: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTEyIDJDNi40NyAyIDIgNi40NyAyIDEyczQuNDcgMTAgMTAgMTAgMTAtNC40NyAxMC0xMFMxNy41MyAyIDEyIDJ6bTAgMThjLTQuNDEgMC04LTMuNTktOC04czMuNTktOCA4LTggOCAzLjU5IDggOC0zLjU5IDgtOCA4eiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-circle: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMTggMTgiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPGNpcmNsZSBjeD0iOSIgY3k9IjkiIHI9IjgiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-clear: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8bWFzayBpZD0iZG9udXRIb2xlIj4KICAgIDxyZWN0IHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgZmlsbD0id2hpdGUiIC8+CiAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSI4IiBmaWxsPSJibGFjayIvPgogIDwvbWFzaz4KCiAgPGcgY2xhc3M9ImpwLWljb24zIiBmaWxsPSIjNjE2MTYxIj4KICAgIDxyZWN0IGhlaWdodD0iMTgiIHdpZHRoPSIyIiB4PSIxMSIgeT0iMyIgdHJhbnNmb3JtPSJyb3RhdGUoMzE1LCAxMiwgMTIpIi8+CiAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMCIgbWFzaz0idXJsKCNkb251dEhvbGUpIi8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-close: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbi1ub25lIGpwLWljb24tc2VsZWN0YWJsZS1pbnZlcnNlIGpwLWljb24zLWhvdmVyIiBmaWxsPSJub25lIj4KICAgIDxjaXJjbGUgY3g9IjEyIiBjeT0iMTIiIHI9IjExIi8+CiAgPC9nPgoKICA8ZyBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIGpwLWljb24tYWNjZW50Mi1ob3ZlciIgZmlsbD0iIzYxNjE2MSI+CiAgICA8cGF0aCBkPSJNMTkgNi40MUwxNy41OSA1IDEyIDEwLjU5IDYuNDEgNSA1IDYuNDEgMTAuNTkgMTIgNSAxNy41OSA2LjQxIDE5IDEyIDEzLjQxIDE3LjU5IDE5IDE5IDE3LjU5IDEzLjQxIDEyeiIvPgogIDwvZz4KCiAgPGcgY2xhc3M9ImpwLWljb24tbm9uZSBqcC1pY29uLWJ1c3kiIGZpbGw9Im5vbmUiPgogICAgPGNpcmNsZSBjeD0iMTIiIGN5PSIxMiIgcj0iNyIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-code: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjIiIGhlaWdodD0iMjIiIHZpZXdCb3g9IjAgMCAyOCAyOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KCTxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CgkJPHBhdGggZD0iTTExLjQgMTguNkw2LjggMTRMMTEuNCA5LjRMMTAgOEw0IDE0TDEwIDIwTDExLjQgMTguNlpNMTYuNiAxOC42TDIxLjIgMTRMMTYuNiA5LjRMMTggOEwyNCAxNEwxOCAyMEwxNi42IDE4LjZWMTguNloiLz4KCTwvZz4KPC9zdmc+Cg==);
  --jp-icon-console: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIwMCAyMDAiPgogIDxnIGNsYXNzPSJqcC1pY29uLWJyYW5kMSBqcC1pY29uLXNlbGVjdGFibGUiIGZpbGw9IiMwMjg4RDEiPgogICAgPHBhdGggZD0iTTIwIDE5LjhoMTYwdjE1OS45SDIweiIvPgogIDwvZz4KICA8ZyBjbGFzcz0ianAtaWNvbi1zZWxlY3RhYmxlLWludmVyc2UiIGZpbGw9IiNmZmYiPgogICAgPHBhdGggZD0iTTEwNSAxMjcuM2g0MHYxMi44aC00MHpNNTEuMSA3N0w3NCA5OS45bC0yMy4zIDIzLjMgMTAuNSAxMC41IDIzLjMtMjMuM0w5NSA5OS45IDg0LjUgODkuNCA2MS42IDY2LjV6Ii8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-copy: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMTggMTgiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTExLjksMUgzLjJDMi40LDEsMS43LDEuNywxLjcsMi41djEwLjJoMS41VjIuNWg4LjdWMXogTTE0LjEsMy45aC04Yy0wLjgsMC0xLjUsMC43LTEuNSwxLjV2MTAuMmMwLDAuOCwwLjcsMS41LDEuNSwxLjVoOCBjMC44LDAsMS41LTAuNywxLjUtMS41VjUuNEMxNS41LDQuNiwxNC45LDMuOSwxNC4xLDMuOXogTTE0LjEsMTUuNWgtOFY1LjRoOFYxNS41eiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-copyright: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDI0IDI0IiBoZWlnaHQ9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIyNCI+CiAgPGcgY2xhc3M9ImpwLWljb24zIiBmaWxsPSIjNjE2MTYxIj4KICAgIDxwYXRoIGQ9Ik0xMS44OCw5LjE0YzEuMjgsMC4wNiwxLjYxLDEuMTUsMS42MywxLjY2aDEuNzljLTAuMDgtMS45OC0xLjQ5LTMuMTktMy40NS0zLjE5QzkuNjQsNy42MSw4LDksOCwxMi4xNCBjMCwxLjk0LDAuOTMsNC4yNCwzLjg0LDQuMjRjMi4yMiwwLDMuNDEtMS42NSwzLjQ0LTIuOTVoLTEuNzljLTAuMDMsMC41OS0wLjQ1LDEuMzgtMS42MywxLjQ0QzEwLjU1LDE0LjgzLDEwLDEzLjgxLDEwLDEyLjE0IEMxMCw5LjI1LDExLjI4LDkuMTYsMTEuODgsOS4xNHogTTEyLDJDNi40OCwyLDIsNi40OCwyLDEyczQuNDgsMTAsMTAsMTBzMTAtNC40OCwxMC0xMFMxNy41MiwyLDEyLDJ6IE0xMiwyMGMtNC40MSwwLTgtMy41OS04LTggczMuNTktOCw4LThzOCwzLjU5LDgsOFMxNi40MSwyMCwxMiwyMHoiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-cut: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTkuNjQgNy42NGMuMjMtLjUuMzYtMS4wNS4zNi0xLjY0IDAtMi4yMS0xLjc5LTQtNC00UzIgMy43OSAyIDZzMS43OSA0IDQgNGMuNTkgMCAxLjE0LS4xMyAxLjY0LS4zNkwxMCAxMmwtMi4zNiAyLjM2QzcuMTQgMTQuMTMgNi41OSAxNCA2IDE0Yy0yLjIxIDAtNCAxLjc5LTQgNHMxLjc5IDQgNCA0IDQtMS43OSA0LTRjMC0uNTktLjEzLTEuMTQtLjM2LTEuNjRMMTIgMTRsNyA3aDN2LTFMOS42NCA3LjY0ek02IDhjLTEuMSAwLTItLjg5LTItMnMuOS0yIDItMiAyIC44OSAyIDItLjkgMi0yIDJ6bTAgMTJjLTEuMSAwLTItLjg5LTItMnMuOS0yIDItMiAyIC44OSAyIDItLjkgMi0yIDJ6bTYtNy41Yy0uMjggMC0uNS0uMjItLjUtLjVzLjIyLS41LjUtLjUuNS4yMi41LjUtLjIyLjUtLjUuNXpNMTkgM2wtNiA2IDIgMiA3LTdWM3oiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-download: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTE5IDloLTRWM0g5djZINWw3IDcgNy03ek01IDE4djJoMTR2LTJINXoiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-edit: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTMgMTcuMjVWMjFoMy43NUwxNy44MSA5Ljk0bC0zLjc1LTMuNzVMMyAxNy4yNXpNMjAuNzEgNy4wNGMuMzktLjM5LjM5LTEuMDIgMC0xLjQxbC0yLjM0LTIuMzRjLS4zOS0uMzktMS4wMi0uMzktMS40MSAwbC0xLjgzIDEuODMgMy43NSAzLjc1IDEuODMtMS44M3oiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-ellipses: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPGNpcmNsZSBjeD0iNSIgY3k9IjEyIiByPSIyIi8+CiAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIyIi8+CiAgICA8Y2lyY2xlIGN4PSIxOSIgY3k9IjEyIiByPSIyIi8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-extension: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTIwLjUgMTFIMTlWN2MwLTEuMS0uOS0yLTItMmgtNFYzLjVDMTMgMi4xMiAxMS44OCAxIDEwLjUgMVM4IDIuMTIgOCAzLjVWNUg0Yy0xLjEgMC0xLjk5LjktMS45OSAydjMuOEgzLjVjMS40OSAwIDIuNyAxLjIxIDIuNyAyLjdzLTEuMjEgMi43LTIuNyAyLjdIMlYyMGMwIDEuMS45IDIgMiAyaDMuOHYtMS41YzAtMS40OSAxLjIxLTIuNyAyLjctMi43IDEuNDkgMCAyLjcgMS4yMSAyLjcgMi43VjIySDE3YzEuMSAwIDItLjkgMi0ydi00aDEuNWMxLjM4IDAgMi41LTEuMTIgMi41LTIuNVMyMS44OCAxMSAyMC41IDExeiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-fast-forward: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CiAgICAgICAgPHBhdGggZD0iTTQgMThsOC41LTZMNCA2djEyem05LTEydjEybDguNS02TDEzIDZ6Ii8+CiAgICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-file-upload: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTkgMTZoNnYtNmg0bC03LTctNyA3aDR6bS00IDJoMTR2Mkg1eiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-file: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICA8cGF0aCBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIiBkPSJNMTkuMyA4LjJsLTUuNS01LjVjLS4zLS4zLS43LS41LTEuMi0uNUgzLjljLS44LjEtMS42LjktMS42IDEuOHYxNC4xYzAgLjkuNyAxLjYgMS42IDEuNmgxNC4yYy45IDAgMS42LS43IDEuNi0xLjZWOS40Yy4xLS41LS4xLS45LS40LTEuMnptLTUuOC0zLjNsMy40IDMuNmgtMy40VjQuOXptMy45IDEyLjdINC43Yy0uMSAwLS4yIDAtLjItLjJWNC43YzAtLjIuMS0uMy4yLS4zaDcuMnY0LjRzMCAuOC4zIDEuMWMuMy4zIDEuMS4zIDEuMS4zaDQuM3Y3LjJzLS4xLjItLjIuMnoiLz4KPC9zdmc+Cg==);
  --jp-icon-filter-list: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTEwIDE4aDR2LTJoLTR2MnpNMyA2djJoMThWNkgzem0zIDdoMTJ2LTJINnYyeiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-folder: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8cGF0aCBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIiBkPSJNMTAgNEg0Yy0xLjEgMC0xLjk5LjktMS45OSAyTDIgMThjMCAxLjEuOSAyIDIgMmgxNmMxLjEgMCAyLS45IDItMlY4YzAtMS4xLS45LTItMi0yaC04bC0yLTJ6Ii8+Cjwvc3ZnPgo=);
  --jp-icon-html5: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDUxMiA1MTIiPgogIDxwYXRoIGNsYXNzPSJqcC1pY29uMCBqcC1pY29uLXNlbGVjdGFibGUiIGZpbGw9IiMwMDAiIGQ9Ik0xMDguNCAwaDIzdjIyLjhoMjEuMlYwaDIzdjY5aC0yM1Y0NmgtMjF2MjNoLTIzLjJNMjA2IDIzaC0yMC4zVjBoNjMuN3YyM0gyMjl2NDZoLTIzbTUzLjUtNjloMjQuMWwxNC44IDI0LjNMMzEzLjIgMGgyNC4xdjY5aC0yM1YzNC44bC0xNi4xIDI0LjgtMTYuMS0yNC44VjY5aC0yMi42bTg5LjItNjloMjN2NDYuMmgzMi42VjY5aC01NS42Ii8+CiAgPHBhdGggY2xhc3M9ImpwLWljb24tc2VsZWN0YWJsZSIgZmlsbD0iI2U0NGQyNiIgZD0iTTEwNy42IDQ3MWwtMzMtMzcwLjRoMzYyLjhsLTMzIDM3MC4yTDI1NS43IDUxMiIvPgogIDxwYXRoIGNsYXNzPSJqcC1pY29uLXNlbGVjdGFibGUiIGZpbGw9IiNmMTY1MjkiIGQ9Ik0yNTYgNDgwLjVWMTMxaDE0OC4zTDM3NiA0NDciLz4KICA8cGF0aCBjbGFzcz0ianAtaWNvbi1zZWxlY3RhYmxlLWludmVyc2UiIGZpbGw9IiNlYmViZWIiIGQ9Ik0xNDIgMTc2LjNoMTE0djQ1LjRoLTY0LjJsNC4yIDQ2LjVoNjB2NDUuM0gxNTQuNG0yIDIyLjhIMjAybDMuMiAzNi4zIDUwLjggMTMuNnY0Ny40bC05My4yLTI2Ii8+CiAgPHBhdGggY2xhc3M9ImpwLWljb24tc2VsZWN0YWJsZS1pbnZlcnNlIiBmaWxsPSIjZmZmIiBkPSJNMzY5LjYgMTc2LjNIMjU1Ljh2NDUuNGgxMDkuNm0tNC4xIDQ2LjVIMjU1Ljh2NDUuNGg1NmwtNS4zIDU5LTUwLjcgMTMuNnY0Ny4ybDkzLTI1LjgiLz4KPC9zdmc+Cg==);
  --jp-icon-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICA8cGF0aCBjbGFzcz0ianAtaWNvbi1icmFuZDQganAtaWNvbi1zZWxlY3RhYmxlLWludmVyc2UiIGZpbGw9IiNGRkYiIGQ9Ik0yLjIgMi4yaDE3LjV2MTcuNUgyLjJ6Ii8+CiAgPHBhdGggY2xhc3M9ImpwLWljb24tYnJhbmQwIGpwLWljb24tc2VsZWN0YWJsZSIgZmlsbD0iIzNGNTFCNSIgZD0iTTIuMiAyLjJ2MTcuNWgxNy41bC4xLTE3LjVIMi4yem0xMi4xIDIuMmMxLjIgMCAyLjIgMSAyLjIgMi4ycy0xIDIuMi0yLjIgMi4yLTIuMi0xLTIuMi0yLjIgMS0yLjIgMi4yLTIuMnpNNC40IDE3LjZsMy4zLTguOCAzLjMgNi42IDIuMi0zLjIgNC40IDUuNEg0LjR6Ii8+Cjwvc3ZnPgo=);
  --jp-icon-inspector: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8cGF0aCBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIiBkPSJNMjAgNEg0Yy0xLjEgMC0xLjk5LjktMS45OSAyTDIgMThjMCAxLjEuOSAyIDIgMmgxNmMxLjEgMCAyLS45IDItMlY2YzAtMS4xLS45LTItMi0yem0tNSAxNEg0di00aDExdjR6bTAtNUg0VjloMTF2NHptNSA1aC00VjloNHY5eiIvPgo8L3N2Zz4K);
  --jp-icon-json: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICA8ZyBjbGFzcz0ianAtaWNvbi13YXJuMSBqcC1pY29uLXNlbGVjdGFibGUiIGZpbGw9IiNGOUE4MjUiPgogICAgPHBhdGggZD0iTTIwLjIgMTEuOGMtMS42IDAtMS43LjUtMS43IDEgMCAuNC4xLjkuMSAxLjMuMS41LjEuOS4xIDEuMyAwIDEuNy0xLjQgMi4zLTMuNSAyLjNoLS45di0xLjloLjVjMS4xIDAgMS40IDAgMS40LS44IDAtLjMgMC0uNi0uMS0xIDAtLjQtLjEtLjgtLjEtMS4yIDAtMS4zIDAtMS44IDEuMy0yLTEuMy0uMi0xLjMtLjctMS4zLTIgMC0uNC4xLS44LjEtMS4yLjEtLjQuMS0uNy4xLTEgMC0uOC0uNC0uNy0xLjQtLjhoLS41VjQuMWguOWMyLjIgMCAzLjUuNyAzLjUgMi4zIDAgLjQtLjEuOS0uMSAxLjMtLjEuNS0uMS45LS4xIDEuMyAwIC41LjIgMSAxLjcgMXYxLjh6TTEuOCAxMC4xYzEuNiAwIDEuNy0uNSAxLjctMSAwLS40LS4xLS45LS4xLTEuMy0uMS0uNS0uMS0uOS0uMS0xLjMgMC0xLjYgMS40LTIuMyAzLjUtMi4zaC45djEuOWgtLjVjLTEgMC0xLjQgMC0xLjQuOCAwIC4zIDAgLjYuMSAxIDAgLjIuMS42LjEgMSAwIDEuMyAwIDEuOC0xLjMgMkM2IDExLjIgNiAxMS43IDYgMTNjMCAuNC0uMS44LS4xIDEuMi0uMS4zLS4xLjctLjEgMSAwIC44LjMuOCAxLjQuOGguNXYxLjloLS45Yy0yLjEgMC0zLjUtLjYtMy41LTIuMyAwLS40LjEtLjkuMS0xLjMuMS0uNS4xLS45LjEtMS4zIDAtLjUtLjItMS0xLjctMXYtMS45eiIvPgogICAgPGNpcmNsZSBjeD0iMTEiIGN5PSIxMy44IiByPSIyLjEiLz4KICAgIDxjaXJjbGUgY3g9IjExIiBjeT0iOC4yIiByPSIyLjEiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-julia: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDMyNSAzMDAiPgogIDxnIGNsYXNzPSJqcC1icmFuZDAganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjY2IzYzMzIj4KICAgIDxwYXRoIGQ9Ik0gMTUwLjg5ODQzOCAyMjUgQyAxNTAuODk4NDM4IDI2Ni40MjE4NzUgMTE3LjMyMDMxMiAzMDAgNzUuODk4NDM4IDMwMCBDIDM0LjQ3NjU2MiAzMDAgMC44OTg0MzggMjY2LjQyMTg3NSAwLjg5ODQzOCAyMjUgQyAwLjg5ODQzOCAxODMuNTc4MTI1IDM0LjQ3NjU2MiAxNTAgNzUuODk4NDM4IDE1MCBDIDExNy4zMjAzMTIgMTUwIDE1MC44OTg0MzggMTgzLjU3ODEyNSAxNTAuODk4NDM4IDIyNSIvPgogIDwvZz4KICA8ZyBjbGFzcz0ianAtYnJhbmQwIGpwLWljb24tc2VsZWN0YWJsZSIgZmlsbD0iIzM4OTgyNiI+CiAgICA8cGF0aCBkPSJNIDIzNy41IDc1IEMgMjM3LjUgMTE2LjQyMTg3NSAyMDMuOTIxODc1IDE1MCAxNjIuNSAxNTAgQyAxMjEuMDc4MTI1IDE1MCA4Ny41IDExNi40MjE4NzUgODcuNSA3NSBDIDg3LjUgMzMuNTc4MTI1IDEyMS4wNzgxMjUgMCAxNjIuNSAwIEMgMjAzLjkyMTg3NSAwIDIzNy41IDMzLjU3ODEyNSAyMzcuNSA3NSIvPgogIDwvZz4KICA8ZyBjbGFzcz0ianAtYnJhbmQwIGpwLWljb24tc2VsZWN0YWJsZSIgZmlsbD0iIzk1NThiMiI+CiAgICA8cGF0aCBkPSJNIDMyNC4xMDE1NjIgMjI1IEMgMzI0LjEwMTU2MiAyNjYuNDIxODc1IDI5MC41MjM0MzggMzAwIDI0OS4xMDE1NjIgMzAwIEMgMjA3LjY3OTY4OCAzMDAgMTc0LjEwMTU2MiAyNjYuNDIxODc1IDE3NC4xMDE1NjIgMjI1IEMgMTc0LjEwMTU2MiAxODMuNTc4MTI1IDIwNy42Nzk2ODggMTUwIDI0OS4xMDE1NjIgMTUwIEMgMjkwLjUyMzQzOCAxNTAgMzI0LjEwMTU2MiAxODMuNTc4MTI1IDMyNC4xMDE1NjIgMjI1Ii8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-jupyter-favicon: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTUyIiBoZWlnaHQ9IjE2NSIgdmlld0JveD0iMCAwIDE1MiAxNjUiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbi13YXJuMCIgZmlsbD0iI0YzNzcyNiI+CiAgICA8cGF0aCB0cmFuc2Zvcm09InRyYW5zbGF0ZSgwLjA3ODk0NywgMTEwLjU4MjkyNykiIGQ9Ik03NS45NDIyODQyLDI5LjU4MDQ1NjEgQzQzLjMwMjM5NDcsMjkuNTgwNDU2MSAxNC43OTY3ODMyLDE3LjY1MzQ2MzQgMCwwIEM1LjUxMDgzMjExLDE1Ljg0MDY4MjkgMTUuNzgxNTM4OSwyOS41NjY3NzMyIDI5LjM5MDQ5NDcsMzkuMjc4NDE3MSBDNDIuOTk5Nyw0OC45ODk4NTM3IDU5LjI3MzcsNTQuMjA2NzgwNSA3NS45NjA1Nzg5LDU0LjIwNjc4MDUgQzkyLjY0NzQ1NzksNTQuMjA2NzgwNSAxMDguOTIxNDU4LDQ4Ljk4OTg1MzcgMTIyLjUzMDY2MywzOS4yNzg0MTcxIEMxMzYuMTM5NDUzLDI5LjU2Njc3MzIgMTQ2LjQxMDI4NCwxNS44NDA2ODI5IDE1MS45MjExNTgsMCBDMTM3LjA4Nzg2OCwxNy42NTM0NjM0IDEwOC41ODI1ODksMjkuNTgwNDU2MSA3NS45NDIyODQyLDI5LjU4MDQ1NjEgTDc1Ljk0MjI4NDIsMjkuNTgwNDU2MSBaIiAvPgogICAgPHBhdGggdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMC4wMzczNjgsIDAuNzA0ODc4KSIgZD0iTTc1Ljk3ODQ1NzksMjQuNjI2NDA3MyBDMTA4LjYxODc2MywyNC42MjY0MDczIDEzNy4xMjQ0NTgsMzYuNTUzNDQxNSAxNTEuOTIxMTU4LDU0LjIwNjc4MDUgQzE0Ni40MTAyODQsMzguMzY2MjIyIDEzNi4xMzk0NTMsMjQuNjQwMTMxNyAxMjIuNTMwNjYzLDE0LjkyODQ4NzggQzEwOC45MjE0NTgsNS4yMTY4NDM5IDkyLjY0NzQ1NzksMCA3NS45NjA1Nzg5LDAgQzU5LjI3MzcsMCA0Mi45OTk3LDUuMjE2ODQzOSAyOS4zOTA0OTQ3LDE0LjkyODQ4NzggQzE1Ljc4MTUzODksMjQuNjQwMTMxNyA1LjUxMDgzMjExLDM4LjM2NjIyMiAwLDU0LjIwNjc4MDUgQzE0LjgzMzA4MTYsMzYuNTg5OTI5MyA0My4zMzg1Njg0LDI0LjYyNjQwNzMgNzUuOTc4NDU3OSwyNC42MjY0MDczIEw3NS45Nzg0NTc5LDI0LjYyNjQwNzMgWiIgLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-jupyter: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzkiIGhlaWdodD0iNTEiIHZpZXdCb3g9IjAgMCAzOSA1MSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMTYzOCAtMjI4MSkiPgogICAgPGcgY2xhc3M9ImpwLWljb24td2FybjAiIGZpbGw9IiNGMzc3MjYiPgogICAgICA8cGF0aCB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxNjM5Ljc0IDIzMTEuOTgpIiBkPSJNIDE4LjI2NDYgNy4xMzQxMUMgMTAuNDE0NSA3LjEzNDExIDMuNTU4NzIgNC4yNTc2IDAgMEMgMS4zMjUzOSAzLjgyMDQgMy43OTU1NiA3LjEzMDgxIDcuMDY4NiA5LjQ3MzAzQyAxMC4zNDE3IDExLjgxNTIgMTQuMjU1NyAxMy4wNzM0IDE4LjI2OSAxMy4wNzM0QyAyMi4yODIzIDEzLjA3MzQgMjYuMTk2MyAxMS44MTUyIDI5LjQ2OTQgOS40NzMwM0MgMzIuNzQyNCA3LjEzMDgxIDM1LjIxMjYgMy44MjA0IDM2LjUzOCAwQyAzMi45NzA1IDQuMjU3NiAyNi4xMTQ4IDcuMTM0MTEgMTguMjY0NiA3LjEzNDExWiIvPgogICAgICA8cGF0aCB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxNjM5LjczIDIyODUuNDgpIiBkPSJNIDE4LjI3MzMgNS45MzkzMUMgMjYuMTIzNSA1LjkzOTMxIDMyLjk3OTMgOC44MTU4MyAzNi41MzggMTMuMDczNEMgMzUuMjEyNiA5LjI1MzAzIDMyLjc0MjQgNS45NDI2MiAyOS40Njk0IDMuNjAwNEMgMjYuMTk2MyAxLjI1ODE4IDIyLjI4MjMgMCAxOC4yNjkgMEMgMTQuMjU1NyAwIDEwLjM0MTcgMS4yNTgxOCA3LjA2ODYgMy42MDA0QyAzLjc5NTU2IDUuOTQyNjIgMS4zMjUzOSA5LjI1MzAzIDAgMTMuMDczNEMgMy41Njc0NSA4LjgyNDYzIDEwLjQyMzIgNS45MzkzMSAxOC4yNzMzIDUuOTM5MzFaIi8+CiAgICA8L2c+CiAgICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgICA8cGF0aCB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxNjY5LjMgMjI4MS4zMSkiIGQ9Ik0gNS44OTM1MyAyLjg0NEMgNS45MTg4OSAzLjQzMTY1IDUuNzcwODUgNC4wMTM2NyA1LjQ2ODE1IDQuNTE2NDVDIDUuMTY1NDUgNS4wMTkyMiA0LjcyMTY4IDUuNDIwMTUgNC4xOTI5OSA1LjY2ODUxQyAzLjY2NDMgNS45MTY4OCAzLjA3NDQ0IDYuMDAxNTEgMi40OTgwNSA1LjkxMTcxQyAxLjkyMTY2IDUuODIxOSAxLjM4NDYzIDUuNTYxNyAwLjk1NDg5OCA1LjE2NDAxQyAwLjUyNTE3IDQuNzY2MzMgMC4yMjIwNTYgNC4yNDkwMyAwLjA4MzkwMzcgMy42Nzc1N0MgLTAuMDU0MjQ4MyAzLjEwNjExIC0wLjAyMTIzIDIuNTA2MTcgMC4xNzg3ODEgMS45NTM2NEMgMC4zNzg3OTMgMS40MDExIDAuNzM2ODA5IDAuOTIwODE3IDEuMjA3NTQgMC41NzM1MzhDIDEuNjc4MjYgMC4yMjYyNTkgMi4yNDA1NSAwLjAyNzU5MTkgMi44MjMyNiAwLjAwMjY3MjI5QyAzLjYwMzg5IC0wLjAzMDcxMTUgNC4zNjU3MyAwLjI0OTc4OSA0Ljk0MTQyIDAuNzgyNTUxQyA1LjUxNzExIDEuMzE1MzEgNS44NTk1NiAyLjA1Njc2IDUuODkzNTMgMi44NDRaIi8+CiAgICAgIDxwYXRoIHRyYW5zZm9ybT0idHJhbnNsYXRlKDE2MzkuOCAyMzIzLjgxKSIgZD0iTSA3LjQyNzg5IDMuNTgzMzhDIDcuNDYwMDggNC4zMjQzIDcuMjczNTUgNS4wNTgxOSA2Ljg5MTkzIDUuNjkyMTNDIDYuNTEwMzEgNi4zMjYwNyA1Ljk1MDc1IDYuODMxNTYgNS4yODQxMSA3LjE0NDZDIDQuNjE3NDcgNy40NTc2MyAzLjg3MzcxIDcuNTY0MTQgMy4xNDcwMiA3LjQ1MDYzQyAyLjQyMDMyIDcuMzM3MTIgMS43NDMzNiA3LjAwODcgMS4yMDE4NCA2LjUwNjk1QyAwLjY2MDMyOCA2LjAwNTIgMC4yNzg2MSA1LjM1MjY4IDAuMTA1MDE3IDQuNjMyMDJDIC0wLjA2ODU3NTcgMy45MTEzNSAtMC4wMjYyMzYxIDMuMTU0OTQgMC4yMjY2NzUgMi40NTg1NkMgMC40Nzk1ODcgMS43NjIxNyAwLjkzMTY5NyAxLjE1NzEzIDEuNTI1NzYgMC43MjAwMzNDIDIuMTE5ODMgMC4yODI5MzUgMi44MjkxNCAwLjAzMzQzOTUgMy41NjM4OSAwLjAwMzEzMzQ0QyA0LjU0NjY3IC0wLjAzNzQwMzMgNS41MDUyOSAwLjMxNjcwNiA2LjIyOTYxIDAuOTg3ODM1QyA2Ljk1MzkzIDEuNjU4OTYgNy4zODQ4NCAyLjU5MjM1IDcuNDI3ODkgMy41ODMzOEwgNy40Mjc4OSAzLjU4MzM4WiIvPgogICAgICA8cGF0aCB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxNjM4LjM2IDIyODYuMDYpIiBkPSJNIDIuMjc0NzEgNC4zOTYyOUMgMS44NDM2MyA0LjQxNTA4IDEuNDE2NzEgNC4zMDQ0NSAxLjA0Nzk5IDQuMDc4NDNDIDAuNjc5MjY4IDMuODUyNCAwLjM4NTMyOCAzLjUyMTE0IDAuMjAzMzcxIDMuMTI2NTZDIDAuMDIxNDEzNiAyLjczMTk4IC0wLjA0MDM3OTggMi4yOTE4MyAwLjAyNTgxMTYgMS44NjE4MUMgMC4wOTIwMDMxIDEuNDMxOCAwLjI4MzIwNCAxLjAzMTI2IDAuNTc1MjEzIDAuNzEwODgzQyAwLjg2NzIyMiAwLjM5MDUxIDEuMjQ2OTEgMC4xNjQ3MDggMS42NjYyMiAwLjA2MjA1OTJDIDIuMDg1NTMgLTAuMDQwNTg5NyAyLjUyNTYxIC0wLjAxNTQ3MTQgMi45MzA3NiAwLjEzNDIzNUMgMy4zMzU5MSAwLjI4Mzk0MSAzLjY4NzkyIDAuNTUxNTA1IDMuOTQyMjIgMC45MDMwNkMgNC4xOTY1MiAxLjI1NDYyIDQuMzQxNjkgMS42NzQzNiA0LjM1OTM1IDIuMTA5MTZDIDQuMzgyOTkgMi42OTEwNyA0LjE3Njc4IDMuMjU4NjkgMy43ODU5NyAzLjY4NzQ2QyAzLjM5NTE2IDQuMTE2MjQgMi44NTE2NiA0LjM3MTE2IDIuMjc0NzEgNC4zOTYyOUwgMi4yNzQ3MSA0LjM5NjI5WiIvPgogICAgPC9nPgogIDwvZz4+Cjwvc3ZnPgo=);
  --jp-icon-jupyterlab-wordmark: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMDAiIHZpZXdCb3g9IjAgMCAxODYwLjggNDc1Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjIiIGZpbGw9IiM0RTRFNEUiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDQ4MC4xMzY0MDEsIDY0LjI3MTQ5MykiPgogICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMC4wMDAwMDAsIDU4Ljg3NTU2NikiPgogICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgwLjA4NzYwMywgMC4xNDAyOTQpIj4KICAgICAgICA8cGF0aCBkPSJNLTQyNi45LDE2OS44YzAsNDguNy0zLjcsNjQuNy0xMy42LDc2LjRjLTEwLjgsMTAtMjUsMTUuNS0zOS43LDE1LjVsMy43LDI5IGMyMi44LDAuMyw0NC44LTcuOSw2MS45LTIzLjFjMTcuOC0xOC41LDI0LTQ0LjEsMjQtODMuM1YwSC00Mjd2MTcwLjFMLTQyNi45LDE2OS44TC00MjYuOSwxNjkuOHoiLz4KICAgICAgPC9nPgogICAgPC9nPgogICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMTU1LjA0NTI5NiwgNTYuODM3MTA0KSI+CiAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDEuNTYyNDUzLCAxLjc5OTg0MikiPgogICAgICAgIDxwYXRoIGQ9Ik0tMzEyLDE0OGMwLDIxLDAsMzkuNSwxLjcsNTUuNGgtMzEuOGwtMi4xLTMzLjNoLTAuOGMtNi43LDExLjYtMTYuNCwyMS4zLTI4LDI3LjkgYy0xMS42LDYuNi0yNC44LDEwLTM4LjIsOS44Yy0zMS40LDAtNjktMTcuNy02OS04OVYwaDM2LjR2MTEyLjdjMCwzOC43LDExLjYsNjQuNyw0NC42LDY0LjdjMTAuMy0wLjIsMjAuNC0zLjUsMjguOS05LjQgYzguNS01LjksMTUuMS0xNC4zLDE4LjktMjMuOWMyLjItNi4xLDMuMy0xMi41LDMuMy0xOC45VjAuMmgzNi40VjE0OEgtMzEyTC0zMTIsMTQ4eiIvPgogICAgICA8L2c+CiAgICA8L2c+CiAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzOTAuMDEzMzIyLCA1My40Nzk2MzgpIj4KICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMS43MDY0NTgsIDAuMjMxNDI1KSI+CiAgICAgICAgPHBhdGggZD0iTS00NzguNiw3MS40YzAtMjYtMC44LTQ3LTEuNy02Ni43aDMyLjdsMS43LDM0LjhoMC44YzcuMS0xMi41LDE3LjUtMjIuOCwzMC4xLTI5LjcgYzEyLjUtNywyNi43LTEwLjMsNDEtOS44YzQ4LjMsMCw4NC43LDQxLjcsODQuNywxMDMuM2MwLDczLjEtNDMuNywxMDkuMi05MSwxMDkuMmMtMTIuMSwwLjUtMjQuMi0yLjItMzUtNy44IGMtMTAuOC01LjYtMTkuOS0xMy45LTI2LjYtMjQuMmgtMC44VjI5MWgtMzZ2LTIyMEwtNDc4LjYsNzEuNEwtNDc4LjYsNzEuNHogTS00NDIuNiwxMjUuNmMwLjEsNS4xLDAuNiwxMC4xLDEuNywxNS4xIGMzLDEyLjMsOS45LDIzLjMsMTkuOCwzMS4xYzkuOSw3LjgsMjIuMSwxMi4xLDM0LjcsMTIuMWMzOC41LDAsNjAuNy0zMS45LDYwLjctNzguNWMwLTQwLjctMjEuMS03NS42LTU5LjUtNzUuNiBjLTEyLjksMC40LTI1LjMsNS4xLTM1LjMsMTMuNGMtOS45LDguMy0xNi45LDE5LjctMTkuNiwzMi40Yy0xLjUsNC45LTIuMywxMC0yLjUsMTUuMVYxMjUuNkwtNDQyLjYsMTI1LjZMLTQ0Mi42LDEyNS42eiIvPgogICAgICA8L2c+CiAgICA8L2c+CiAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSg2MDYuNzQwNzI2LCA1Ni44MzcxMDQpIj4KICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMC43NTEyMjYsIDEuOTg5Mjk5KSI+CiAgICAgICAgPHBhdGggZD0iTS00NDAuOCwwbDQzLjcsMTIwLjFjNC41LDEzLjQsOS41LDI5LjQsMTIuOCw0MS43aDAuOGMzLjctMTIuMiw3LjktMjcuNywxMi44LTQyLjQgbDM5LjctMTE5LjJoMzguNUwtMzQ2LjksMTQ1Yy0yNiw2OS43LTQzLjcsMTA1LjQtNjguNiwxMjcuMmMtMTIuNSwxMS43LTI3LjksMjAtNDQuNiwyMy45bC05LjEtMzEuMSBjMTEuNy0zLjksMjIuNS0xMC4xLDMxLjgtMTguMWMxMy4yLTExLjEsMjMuNy0yNS4yLDMwLjYtNDEuMmMxLjUtMi44LDIuNS01LjcsMi45LTguOGMtMC4zLTMuMy0xLjItNi42LTIuNS05LjdMLTQ4MC4yLDAuMSBoMzkuN0wtNDQwLjgsMEwtNDQwLjgsMHoiLz4KICAgICAgPC9nPgogICAgPC9nPgogICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoODIyLjc0ODEwNCwgMC4wMDAwMDApIj4KICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMS40NjQwNTAsIDAuMzc4OTE0KSI+CiAgICAgICAgPHBhdGggZD0iTS00MTMuNywwdjU4LjNoNTJ2MjguMmgtNTJWMTk2YzAsMjUsNywzOS41LDI3LjMsMzkuNWM3LjEsMC4xLDE0LjItMC43LDIxLjEtMi41IGwxLjcsMjcuN2MtMTAuMywzLjctMjEuMyw1LjQtMzIuMiw1Yy03LjMsMC40LTE0LjYtMC43LTIxLjMtMy40Yy02LjgtMi43LTEyLjktNi44LTE3LjktMTIuMWMtMTAuMy0xMC45LTE0LjEtMjktMTQuMS01Mi45IFY4Ni41aC0zMVY1OC4zaDMxVjkuNkwtNDEzLjcsMEwtNDEzLjcsMHoiLz4KICAgICAgPC9nPgogICAgPC9nPgogICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoOTc0LjQzMzI4NiwgNTMuNDc5NjM4KSI+CiAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDAuOTkwMDM0LCAwLjYxMDMzOSkiPgogICAgICAgIDxwYXRoIGQ9Ik0tNDQ1LjgsMTEzYzAuOCw1MCwzMi4yLDcwLjYsNjguNiw3MC42YzE5LDAuNiwzNy45LTMsNTUuMy0xMC41bDYuMiwyNi40IGMtMjAuOSw4LjktNDMuNSwxMy4xLTY2LjIsMTIuNmMtNjEuNSwwLTk4LjMtNDEuMi05OC4zLTEwMi41Qy00ODAuMiw0OC4yLTQ0NC43LDAtMzg2LjUsMGM2NS4yLDAsODIuNyw1OC4zLDgyLjcsOTUuNyBjLTAuMSw1LjgtMC41LDExLjUtMS4yLDE3LjJoLTE0MC42SC00NDUuOEwtNDQ1LjgsMTEzeiBNLTMzOS4yLDg2LjZjMC40LTIzLjUtOS41LTYwLjEtNTAuNC02MC4xIGMtMzYuOCwwLTUyLjgsMzQuNC01NS43LDYwLjFILTMzOS4yTC0zMzkuMiw4Ni42TC0zMzkuMiw4Ni42eiIvPgogICAgICA8L2c+CiAgICA8L2c+CiAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxMjAxLjk2MTA1OCwgNTMuNDc5NjM4KSI+CiAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDEuMTc5NjQwLCAwLjcwNTA2OCkiPgogICAgICAgIDxwYXRoIGQ9Ik0tNDc4LjYsNjhjMC0yMy45LTAuNC00NC41LTEuNy02My40aDMxLjhsMS4yLDM5LjloMS43YzkuMS0yNy4zLDMxLTQ0LjUsNTUuMy00NC41IGMzLjUtMC4xLDcsMC40LDEwLjMsMS4ydjM0LjhjLTQuMS0wLjktOC4yLTEuMy0xMi40LTEuMmMtMjUuNiwwLTQzLjcsMTkuNy00OC43LDQ3LjRjLTEsNS43LTEuNiwxMS41LTEuNywxNy4ydjEwOC4zaC0zNlY2OCBMLTQ3OC42LDY4eiIvPgogICAgICA8L2c+CiAgICA8L2c+CiAgPC9nPgoKICA8ZyBjbGFzcz0ianAtaWNvbi13YXJuMCIgZmlsbD0iI0YzNzcyNiI+CiAgICA8cGF0aCBkPSJNMTM1Mi4zLDMyNi4yaDM3VjI4aC0zN1YzMjYuMnogTTE2MDQuOCwzMjYuMmMtMi41LTEzLjktMy40LTMxLjEtMy40LTQ4Ljd2LTc2IGMwLTQwLjctMTUuMS04My4xLTc3LjMtODMuMWMtMjUuNiwwLTUwLDcuMS02Ni44LDE4LjFsOC40LDI0LjRjMTQuMy05LjIsMzQtMTUuMSw1My0xNS4xYzQxLjYsMCw0Ni4yLDMwLjIsNDYuMiw0N3Y0LjIgYy03OC42LTAuNC0xMjIuMywyNi41LTEyMi4zLDc1LjZjMCwyOS40LDIxLDU4LjQsNjIuMiw1OC40YzI5LDAsNTAuOS0xNC4zLDYyLjItMzAuMmgxLjNsMi45LDI1LjZIMTYwNC44eiBNMTU2NS43LDI1Ny43IGMwLDMuOC0wLjgsOC0yLjEsMTEuOGMtNS45LDE3LjItMjIuNywzNC00OS4yLDM0Yy0xOC45LDAtMzQuOS0xMS4zLTM0LjktMzUuM2MwLTM5LjUsNDUuOC00Ni42LDg2LjItNDUuOFYyNTcuN3ogTTE2OTguNSwzMjYuMiBsMS43LTMzLjZoMS4zYzE1LjEsMjYuOSwzOC43LDM4LjIsNjguMSwzOC4yYzQ1LjQsMCw5MS4yLTM2LjEsOTEuMi0xMDguOGMwLjQtNjEuNy0zNS4zLTEwMy43LTg1LjctMTAzLjcgYy0zMi44LDAtNTYuMywxNC43LTY5LjMsMzcuNGgtMC44VjI4aC0zNi42djI0NS43YzAsMTguMS0wLjgsMzguNi0xLjcsNTIuNUgxNjk4LjV6IE0xNzA0LjgsMjA4LjJjMC01LjksMS4zLTEwLjksMi4xLTE1LjEgYzcuNi0yOC4xLDMxLjEtNDUuNCw1Ni4zLTQ1LjRjMzkuNSwwLDYwLjUsMzQuOSw2MC41LDc1LjZjMCw0Ni42LTIzLjEsNzguMS02MS44LDc4LjFjLTI2LjksMC00OC4zLTE3LjYtNTUuNS00My4zIGMtMC44LTQuMi0xLjctOC44LTEuNy0xMy40VjIwOC4yeiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-kernel: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGNsYXNzPSJqcC1pY29uMiIgZmlsbD0iIzYxNjE2MSIgZD0iTTE1IDlIOXY2aDZWOXptLTIgNGgtMnYtMmgydjJ6bTgtMlY5aC0yVjdjMC0xLjEtLjktMi0yLTJoLTJWM2gtMnYyaC0yVjNIOXYySDdjLTEuMSAwLTIgLjktMiAydjJIM3YyaDJ2MkgzdjJoMnYyYzAgMS4xLjkgMiAyIDJoMnYyaDJ2LTJoMnYyaDJ2LTJoMmMxLjEgMCAyLS45IDItMnYtMmgydi0yaC0ydi0yaDJ6bS00IDZIN1Y3aDEwdjEweiIvPgo8L3N2Zz4K);
  --jp-icon-keyboard: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8cGF0aCBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIiBkPSJNMjAgNUg0Yy0xLjEgMC0xLjk5LjktMS45OSAyTDIgMTdjMCAxLjEuOSAyIDIgMmgxNmMxLjEgMCAyLS45IDItMlY3YzAtMS4xLS45LTItMi0yem0tOSAzaDJ2MmgtMlY4em0wIDNoMnYyaC0ydi0yek04IDhoMnYySDhWOHptMCAzaDJ2Mkg4di0yem0tMSAySDV2LTJoMnYyem0wLTNINVY4aDJ2MnptOSA3SDh2LTJoOHYyem0wLTRoLTJ2LTJoMnYyem0wLTNoLTJWOGgydjJ6bTMgM2gtMnYtMmgydjJ6bTAtM2gtMlY4aDJ2MnoiLz4KPC9zdmc+Cg==);
  --jp-icon-launcher: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8cGF0aCBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIiBkPSJNMTkgMTlINVY1aDdWM0g1YTIgMiAwIDAwLTIgMnYxNGEyIDIgMCAwMDIgMmgxNGMxLjEgMCAyLS45IDItMnYtN2gtMnY3ek0xNCAzdjJoMy41OWwtOS44MyA5LjgzIDEuNDEgMS40MUwxOSA2LjQxVjEwaDJWM2gtN3oiLz4KPC9zdmc+Cg==);
  --jp-icon-line-form: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9IndoaXRlIiBkPSJNNS44OCA0LjEyTDEzLjc2IDEybC03Ljg4IDcuODhMOCAyMmwxMC0xMEw4IDJ6Ii8+Cjwvc3ZnPgo=);
  --jp-icon-link: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTMuOSAxMmMwLTEuNzEgMS4zOS0zLjEgMy4xLTMuMWg0VjdIN2MtMi43NiAwLTUgMi4yNC01IDVzMi4yNCA1IDUgNWg0di0xLjlIN2MtMS43MSAwLTMuMS0xLjM5LTMuMS0zLjF6TTggMTNoOHYtMkg4djJ6bTktNmgtNHYxLjloNGMxLjcxIDAgMy4xIDEuMzkgMy4xIDMuMXMtMS4zOSAzLjEtMy4xIDMuMWgtNFYxN2g0YzIuNzYgMCA1LTIuMjQgNS01cy0yLjI0LTUtNS01eiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-list: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGNsYXNzPSJqcC1pY29uMiBqcC1pY29uLXNlbGVjdGFibGUiIGZpbGw9IiM2MTYxNjEiIGQ9Ik0xOSA1djE0SDVWNWgxNG0xLjEtMkgzLjljLS41IDAtLjkuNC0uOS45djE2LjJjMCAuNC40LjkuOS45aDE2LjJjLjQgMCAuOS0uNS45LS45VjMuOWMwLS41LS41LS45LS45LS45ek0xMSA3aDZ2MmgtNlY3em0wIDRoNnYyaC02di0yem0wIDRoNnYyaC02ek03IDdoMnYySDd6bTAgNGgydjJIN3ptMCA0aDJ2Mkg3eiIvPgo8L3N2Zz4=);
  --jp-icon-listings-info: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA1MC45NzggNTAuOTc4IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCA1MC45NzggNTAuOTc4OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+Cgk8Zz4KCQk8cGF0aCBzdHlsZT0iZmlsbDojMDEwMDAyOyIgZD0iTTQzLjUyLDcuNDU4QzM4LjcxMSwyLjY0OCwzMi4zMDcsMCwyNS40ODksMEMxOC42NywwLDEyLjI2NiwyLjY0OCw3LjQ1OCw3LjQ1OAoJCQljLTkuOTQzLDkuOTQxLTkuOTQzLDI2LjExOSwwLDM2LjA2MmM0LjgwOSw0LjgwOSwxMS4yMTIsNy40NTYsMTguMDMxLDcuNDU4YzAsMCwwLjAwMSwwLDAuMDAyLDAKCQkJYzYuODE2LDAsMTMuMjIxLTIuNjQ4LDE4LjAyOS03LjQ1OGM0LjgwOS00LjgwOSw3LjQ1Ny0xMS4yMTIsNy40NTctMTguMDNDNTAuOTc3LDE4LjY3LDQ4LjMyOCwxMi4yNjYsNDMuNTIsNy40NTh6CgkJCSBNNDIuMTA2LDQyLjEwNWMtNC40MzIsNC40MzEtMTAuMzMyLDYuODcyLTE2LjYxNSw2Ljg3MmgtMC4wMDJjLTYuMjg1LTAuMDAxLTEyLjE4Ny0yLjQ0MS0xNi42MTctNi44NzIKCQkJYy05LjE2Mi05LjE2My05LjE2Mi0yNC4wNzEsMC0zMy4yMzNDMTMuMzAzLDQuNDQsMTkuMjA0LDIsMjUuNDg5LDJjNi4yODQsMCwxMi4xODYsMi40NCwxNi42MTcsNi44NzIKCQkJYzQuNDMxLDQuNDMxLDYuODcxLDEwLjMzMiw2Ljg3MSwxNi42MTdDNDguOTc3LDMxLjc3Miw0Ni41MzYsMzcuNjc1LDQyLjEwNiw0Mi4xMDV6Ii8+CgkJPHBhdGggc3R5bGU9ImZpbGw6IzAxMDAwMjsiIGQ9Ik0yMy41NzgsMzIuMjE4Yy0wLjAyMy0xLjczNCwwLjE0My0zLjA1OSwwLjQ5Ni0zLjk3MmMwLjM1My0wLjkxMywxLjExLTEuOTk3LDIuMjcyLTMuMjUzCgkJCWMwLjQ2OC0wLjUzNiwwLjkyMy0xLjA2MiwxLjM2Ny0xLjU3NWMwLjYyNi0wLjc1MywxLjEwNC0xLjQ3OCwxLjQzNi0yLjE3NWMwLjMzMS0wLjcwNywwLjQ5NS0xLjU0MSwwLjQ5NS0yLjUKCQkJYzAtMS4wOTYtMC4yNi0yLjA4OC0wLjc3OS0yLjk3OWMtMC41NjUtMC44NzktMS41MDEtMS4zMzYtMi44MDYtMS4zNjljLTEuODAyLDAuMDU3LTIuOTg1LDAuNjY3LTMuNTUsMS44MzIKCQkJYy0wLjMwMSwwLjUzNS0wLjUwMywxLjE0MS0wLjYwNywxLjgxNGMtMC4xMzksMC43MDctMC4yMDcsMS40MzItMC4yMDcsMi4xNzRoLTIuOTM3Yy0wLjA5MS0yLjIwOCwwLjQwNy00LjExNCwxLjQ5My01LjcxOQoJCQljMS4wNjItMS42NCwyLjg1NS0yLjQ4MSw1LjM3OC0yLjUyN2MyLjE2LDAuMDIzLDMuODc0LDAuNjA4LDUuMTQxLDEuNzU4YzEuMjc4LDEuMTYsMS45MjksMi43NjQsMS45NSw0LjgxMQoJCQljMCwxLjE0Mi0wLjEzNywyLjExMS0wLjQxLDIuOTExYy0wLjMwOSwwLjg0NS0wLjczMSwxLjU5My0xLjI2OCwyLjI0M2MtMC40OTIsMC42NS0xLjA2OCwxLjMxOC0xLjczLDIuMDAyCgkJCWMtMC42NSwwLjY5Ny0xLjMxMywxLjQ3OS0xLjk4NywyLjM0NmMtMC4yMzksMC4zNzctMC40MjksMC43NzctMC41NjUsMS4xOTljLTAuMTYsMC45NTktMC4yMTcsMS45NTEtMC4xNzEsMi45NzkKCQkJQzI2LjU4OSwzMi4yMTgsMjMuNTc4LDMyLjIxOCwyMy41NzgsMzIuMjE4eiBNMjMuNTc4LDM4LjIydi0zLjQ4NGgzLjA3NnYzLjQ4NEgyMy41Nzh6Ii8+Cgk8L2c+Cjwvc3ZnPgo=);
  --jp-icon-markdown: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICA8cGF0aCBjbGFzcz0ianAtaWNvbi1jb250cmFzdDAganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjN0IxRkEyIiBkPSJNNSAxNC45aDEybC02LjEgNnptOS40LTYuOGMwLTEuMy0uMS0yLjktLjEtNC41LS40IDEuNC0uOSAyLjktMS4zIDQuM2wtMS4zIDQuM2gtMkw4LjUgNy45Yy0uNC0xLjMtLjctMi45LTEtNC4zLS4xIDEuNi0uMSAzLjItLjIgNC42TDcgMTIuNEg0LjhsLjctMTFoMy4zTDEwIDVjLjQgMS4yLjcgMi43IDEgMy45LjMtMS4yLjctMi42IDEtMy45bDEuMi0zLjdoMy4zbC42IDExaC0yLjRsLS4zLTQuMnoiLz4KPC9zdmc+Cg==);
  --jp-icon-new-folder: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTIwIDZoLThsLTItMkg0Yy0xLjExIDAtMS45OS44OS0xLjk5IDJMMiAxOGMwIDEuMTEuODkgMiAyIDJoMTZjMS4xMSAwIDItLjg5IDItMlY4YzAtMS4xMS0uODktMi0yLTJ6bS0xIDhoLTN2M2gtMnYtM2gtM3YtMmgzVjloMnYzaDN2MnoiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-not-trusted: url(data:image/svg+xml;base64,PHN2ZyBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI1IDI1Ij4KICAgIDxwYXRoIGNsYXNzPSJqcC1pY29uMiIgc3Ryb2tlPSIjMzMzMzMzIiBzdHJva2Utd2lkdGg9IjIiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMgMykiIGQ9Ik0xLjg2MDk0IDExLjQ0MDlDMC44MjY0NDggOC43NzAyNyAwLjg2Mzc3OSA2LjA1NzY0IDEuMjQ5MDcgNC4xOTkzMkMyLjQ4MjA2IDMuOTMzNDcgNC4wODA2OCAzLjQwMzQ3IDUuNjAxMDIgMi44NDQ5QzcuMjM1NDkgMi4yNDQ0IDguODU2NjYgMS41ODE1IDkuOTg3NiAxLjA5NTM5QzExLjA1OTcgMS41ODM0MSAxMi42MDk0IDIuMjQ0NCAxNC4yMTggMi44NDMzOUMxNS43NTAzIDMuNDEzOTQgMTcuMzk5NSAzLjk1MjU4IDE4Ljc1MzkgNC4yMTM4NUMxOS4xMzY0IDYuMDcxNzcgMTkuMTcwOSA4Ljc3NzIyIDE4LjEzOSAxMS40NDA5QzE3LjAzMDMgMTQuMzAzMiAxNC42NjY4IDE3LjE4NDQgOS45OTk5OSAxOC45MzU0QzUuMzMzMTkgMTcuMTg0NCAyLjk2OTY4IDE0LjMwMzIgMS44NjA5NCAxMS40NDA5WiIvPgogICAgPHBhdGggY2xhc3M9ImpwLWljb24yIiBzdHJva2U9IiMzMzMzMzMiIHN0cm9rZS13aWR0aD0iMiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoOS4zMTU5MiA5LjMyMDMxKSIgZD0iTTcuMzY4NDIgMEwwIDcuMzY0NzkiLz4KICAgIDxwYXRoIGNsYXNzPSJqcC1pY29uMiIgc3Ryb2tlPSIjMzMzMzMzIiBzdHJva2Utd2lkdGg9IjIiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDkuMzE1OTIgMTYuNjgzNikgc2NhbGUoMSAtMSkiIGQ9Ik03LjM2ODQyIDBMMCA3LjM2NDc5Ii8+Cjwvc3ZnPgo=);
  --jp-icon-notebook: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICA8ZyBjbGFzcz0ianAtaWNvbi13YXJuMCBqcC1pY29uLXNlbGVjdGFibGUiIGZpbGw9IiNFRjZDMDAiPgogICAgPHBhdGggZD0iTTE4LjcgMy4zdjE1LjRIMy4zVjMuM2gxNS40bTEuNS0xLjVIMS44djE4LjNoMTguM2wuMS0xOC4zeiIvPgogICAgPHBhdGggZD0iTTE2LjUgMTYuNWwtNS40LTQuMy01LjYgNC4zdi0xMWgxMXoiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-numbering: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjIiIGhlaWdodD0iMjIiIHZpZXdCb3g9IjAgMCAyOCAyOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KCTxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CgkJPHBhdGggZD0iTTQgMTlINlYxOS41SDVWMjAuNUg2VjIxSDRWMjJIN1YxOEg0VjE5Wk01IDEwSDZWNkg0VjdINVYxMFpNNCAxM0g1LjhMNCAxNS4xVjE2SDdWMTVINS4yTDcgMTIuOVYxMkg0VjEzWk05IDdWOUgyM1Y3SDlaTTkgMjFIMjNWMTlIOVYyMVpNOSAxNUgyM1YxM0g5VjE1WiIvPgoJPC9nPgo8L3N2Zz4K);
  --jp-icon-offline-bolt: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCIgd2lkdGg9IjE2Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTEyIDIuMDJjLTUuNTEgMC05Ljk4IDQuNDctOS45OCA5Ljk4czQuNDcgOS45OCA5Ljk4IDkuOTggOS45OC00LjQ3IDkuOTgtOS45OFMxNy41MSAyLjAyIDEyIDIuMDJ6TTExLjQ4IDIwdi02LjI2SDhMMTMgNHY2LjI2aDMuMzVMMTEuNDggMjB6Ii8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-palette: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTE4IDEzVjIwSDRWNkg5LjAyQzkuMDcgNS4yOSA5LjI0IDQuNjIgOS41IDRINEMyLjkgNCAyIDQuOSAyIDZWMjBDMiAyMS4xIDIuOSAyMiA0IDIySDE4QzE5LjEgMjIgMjAgMjEuMSAyMCAyMFYxNUwxOCAxM1pNMTkuMyA4Ljg5QzE5Ljc0IDguMTkgMjAgNy4zOCAyMCA2LjVDMjAgNC4wMSAxNy45OSAyIDE1LjUgMkMxMy4wMSAyIDExIDQuMDEgMTEgNi41QzExIDguOTkgMTMuMDEgMTEgMTUuNDkgMTFDMTYuMzcgMTEgMTcuMTkgMTAuNzQgMTcuODggMTAuM0wyMSAxMy40MkwyMi40MiAxMkwxOS4zIDguODlaTTE1LjUgOUMxNC4xMiA5IDEzIDcuODggMTMgNi41QzEzIDUuMTIgMTQuMTIgNCAxNS41IDRDMTYuODggNCAxOCA1LjEyIDE4IDYuNUMxOCA3Ljg4IDE2Ljg4IDkgMTUuNSA5WiIvPgogICAgPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik00IDZIOS4wMTg5NEM5LjAwNjM5IDYuMTY1MDIgOSA2LjMzMTc2IDkgNi41QzkgOC44MTU3NyAxMC4yMTEgMTAuODQ4NyAxMi4wMzQzIDEySDlWMTRIMTZWMTIuOTgxMUMxNi41NzAzIDEyLjkzNzcgMTcuMTIgMTIuODIwNyAxNy42Mzk2IDEyLjYzOTZMMTggMTNWMjBINFY2Wk04IDhINlYxMEg4VjhaTTYgMTJIOFYxNEg2VjEyWk04IDE2SDZWMThIOFYxNlpNOSAxNkgxNlYxOEg5VjE2WiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-paste: url(data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CiAgICAgICAgPHBhdGggZD0iTTE5IDJoLTQuMThDMTQuNC44NCAxMy4zIDAgMTIgMGMtMS4zIDAtMi40Ljg0LTIuODIgMkg1Yy0xLjEgMC0yIC45LTIgMnYxNmMwIDEuMS45IDIgMiAyaDE0YzEuMSAwIDItLjkgMi0yVjRjMC0xLjEtLjktMi0yLTJ6bS03IDBjLjU1IDAgMSAuNDUgMSAxcy0uNDUgMS0xIDEtMS0uNDUtMS0xIC40NS0xIDEtMXptNyAxOEg1VjRoMnYzaDEwVjRoMnYxNnoiLz4KICAgIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-pdf: url(data:image/svg+xml;base64,PHN2ZwogICB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyMiAyMiIgd2lkdGg9IjE2Ij4KICAgIDxwYXRoIHRyYW5zZm9ybT0icm90YXRlKDQ1KSIgY2xhc3M9ImpwLWljb24tc2VsZWN0YWJsZSIgZmlsbD0iI0ZGMkEyQSIKICAgICAgIGQ9Im0gMjIuMzQ0MzY5LC0zLjAxNjM2NDIgaCA1LjYzODYwNCB2IDEuNTc5MjQzMyBoIC0zLjU0OTIyNyB2IDEuNTA4NjkyOTkgaCAzLjMzNzU3NiBWIDEuNjUwODE1NCBoIC0zLjMzNzU3NiB2IDMuNDM1MjYxMyBoIC0yLjA4OTM3NyB6IG0gLTcuMTM2NDQ0LDEuNTc5MjQzMyB2IDQuOTQzOTU0MyBoIDAuNzQ4OTIgcSAxLjI4MDc2MSwwIDEuOTUzNzAzLC0wLjYzNDk1MzUgMC42NzgzNjksLTAuNjM0OTUzNSAwLjY3ODM2OSwtMS44NDUxNjQxIDAsLTEuMjA0NzgzNTUgLTAuNjcyOTQyLC0xLjgzNDMxMDExIC0wLjY3Mjk0MiwtMC42Mjk1MjY1OSAtMS45NTkxMywtMC42Mjk1MjY1OSB6IG0gLTIuMDg5Mzc3LC0xLjU3OTI0MzMgaCAyLjIwMzM0MyBxIDEuODQ1MTY0LDAgMi43NDYwMzksMC4yNjU5MjA3IDAuOTA2MzAxLDAuMjYwNDkzNyAxLjU1MjEwOCwwLjg5MDAyMDMgMC41Njk4MywwLjU0ODEyMjMgMC44NDY2MDUsMS4yNjQ0ODAwNiAwLjI3Njc3NCwwLjcxNjM1NzgxIDAuMjc2Nzc0LDEuNjIyNjU4OTQgMCwwLjkxNzE1NTEgLTAuMjc2Nzc0LDEuNjM4OTM5OSAtMC4yNzY3NzUsMC43MTYzNTc4IC0wLjg0NjYwNSwxLjI2NDQ4IC0wLjY1MTIzNCwwLjYyOTUyNjYgLTEuNTYyOTYyLDAuODk1NDQ3MyAtMC45MTE3MjgsMC4yNjA0OTM3IC0yLjczNTE4NSwwLjI2MDQ5MzcgaCAtMi4yMDMzNDMgeiBtIC04LjE0NTg1NjUsMCBoIDMuNDY3ODIzIHEgMS41NDY2ODE2LDAgMi4zNzE1Nzg1LDAuNjg5MjIzIDAuODMwMzI0LDAuNjgzNzk2MSAwLjgzMDMyNCwxLjk1MzcwMzE0IDAsMS4yNzUzMzM5NyAtMC44MzAzMjQsMS45NjQ1NTcwNiBRIDkuOTg3MTk2MSwyLjI3NDkxNSA4LjQ0MDUxNDUsMi4yNzQ5MTUgSCA3LjA2MjA2ODQgViA1LjA4NjA3NjcgSCA0Ljk3MjY5MTUgWiBtIDIuMDg5Mzc2OSwxLjUxNDExOTkgdiAyLjI2MzAzOTQzIGggMS4xNTU5NDEgcSAwLjYwNzgxODgsMCAwLjkzODg2MjksLTAuMjkzMDU1NDcgMC4zMzEwNDQxLC0wLjI5ODQ4MjQxIDAuMzMxMDQ0MSwtMC44NDExNzc3MiAwLC0wLjU0MjY5NTMxIC0wLjMzMTA0NDEsLTAuODM1NzUwNzQgLTAuMzMxMDQ0MSwtMC4yOTMwNTU1IC0wLjkzODg2MjksLTAuMjkzMDU1NSB6IgovPgo8L3N2Zz4K);
  --jp-icon-python: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICA8ZyBjbGFzcz0ianAtaWNvbi1icmFuZDAganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjMEQ0N0ExIj4KICAgIDxwYXRoIGQ9Ik0xMS4xIDYuOVY1LjhINi45YzAtLjUgMC0xLjMuMi0xLjYuNC0uNy44LTEuMSAxLjctMS40IDEuNy0uMyAyLjUtLjMgMy45LS4xIDEgLjEgMS45LjkgMS45IDEuOXY0LjJjMCAuNS0uOSAxLjYtMiAxLjZIOC44Yy0xLjUgMC0yLjQgMS40LTIuNCAyLjh2Mi4ySDQuN0MzLjUgMTUuMSAzIDE0IDMgMTMuMVY5Yy0uMS0xIC42LTIgMS44LTIgMS41LS4xIDYuMy0uMSA2LjMtLjF6Ii8+CiAgICA8cGF0aCBkPSJNMTAuOSAxNS4xdjEuMWg0LjJjMCAuNSAwIDEuMy0uMiAxLjYtLjQuNy0uOCAxLjEtMS43IDEuNC0xLjcuMy0yLjUuMy0zLjkuMS0xLS4xLTEuOS0uOS0xLjktMS45di00LjJjMC0uNS45LTEuNiAyLTEuNmgzLjhjMS41IDAgMi40LTEuNCAyLjQtMi44VjYuNmgxLjdDMTguNSA2LjkgMTkgOCAxOSA4LjlWMTNjMCAxLS43IDIuMS0xLjkgMi4xaC02LjJ6Ii8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-r-kernel: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICA8cGF0aCBjbGFzcz0ianAtaWNvbi1jb250cmFzdDMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjMjE5NkYzIiBkPSJNNC40IDIuNWMxLjItLjEgMi45LS4zIDQuOS0uMyAyLjUgMCA0LjEuNCA1LjIgMS4zIDEgLjcgMS41IDEuOSAxLjUgMy41IDAgMi0xLjQgMy41LTIuOSA0LjEgMS4yLjQgMS43IDEuNiAyLjIgMyAuNiAxLjkgMSAzLjkgMS4zIDQuNmgtMy44Yy0uMy0uNC0uOC0xLjctMS4yLTMuN3MtMS4yLTIuNi0yLjYtMi42aC0uOXY2LjRINC40VjIuNXptMy43IDYuOWgxLjRjMS45IDAgMi45LS45IDIuOS0yLjNzLTEtMi4zLTIuOC0yLjNjLS43IDAtMS4zIDAtMS42LjJ2NC41aC4xdi0uMXoiLz4KPC9zdmc+Cg==);
  --jp-icon-react: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMTUwIDE1MCA1NDEuOSAyOTUuMyI+CiAgPGcgY2xhc3M9ImpwLWljb24tYnJhbmQyIGpwLWljb24tc2VsZWN0YWJsZSIgZmlsbD0iIzYxREFGQiI+CiAgICA8cGF0aCBkPSJNNjY2LjMgMjk2LjVjMC0zMi41LTQwLjctNjMuMy0xMDMuMS04Mi40IDE0LjQtNjMuNiA4LTExNC4yLTIwLjItMTMwLjQtNi41LTMuOC0xNC4xLTUuNi0yMi40LTUuNnYyMi4zYzQuNiAwIDguMy45IDExLjQgMi42IDEzLjYgNy44IDE5LjUgMzcuNSAxNC45IDc1LjctMS4xIDkuNC0yLjkgMTkuMy01LjEgMjkuNC0xOS42LTQuOC00MS04LjUtNjMuNS0xMC45LTEzLjUtMTguNS0yNy41LTM1LjMtNDEuNi01MCAzMi42LTMwLjMgNjMuMi00Ni45IDg0LTQ2LjlWNzhjLTI3LjUgMC02My41IDE5LjYtOTkuOSA1My42LTM2LjQtMzMuOC03Mi40LTUzLjItOTkuOS01My4ydjIyLjNjMjAuNyAwIDUxLjQgMTYuNSA4NCA0Ni42LTE0IDE0LjctMjggMzEuNC00MS4zIDQ5LjktMjIuNiAyLjQtNDQgNi4xLTYzLjYgMTEtMi4zLTEwLTQtMTkuNy01LjItMjktNC43LTM4LjIgMS4xLTY3LjkgMTQuNi03NS44IDMtMS44IDYuOS0yLjYgMTEuNS0yLjZWNzguNWMtOC40IDAtMTYgMS44LTIyLjYgNS42LTI4LjEgMTYuMi0zNC40IDY2LjctMTkuOSAxMzAuMS02Mi4yIDE5LjItMTAyLjcgNDkuOS0xMDIuNyA4Mi4zIDAgMzIuNSA0MC43IDYzLjMgMTAzLjEgODIuNC0xNC40IDYzLjYtOCAxMTQuMiAyMC4yIDEzMC40IDYuNSAzLjggMTQuMSA1LjYgMjIuNSA1LjYgMjcuNSAwIDYzLjUtMTkuNiA5OS45LTUzLjYgMzYuNCAzMy44IDcyLjQgNTMuMiA5OS45IDUzLjIgOC40IDAgMTYtMS44IDIyLjYtNS42IDI4LjEtMTYuMiAzNC40LTY2LjcgMTkuOS0xMzAuMSA2Mi0xOS4xIDEwMi41LTQ5LjkgMTAyLjUtODIuM3ptLTEzMC4yLTY2LjdjLTMuNyAxMi45LTguMyAyNi4yLTEzLjUgMzkuNS00LjEtOC04LjQtMTYtMTMuMS0yNC00LjYtOC05LjUtMTUuOC0xNC40LTIzLjQgMTQuMiAyLjEgMjcuOSA0LjcgNDEgNy45em0tNDUuOCAxMDYuNWMtNy44IDEzLjUtMTUuOCAyNi4zLTI0LjEgMzguMi0xNC45IDEuMy0zMCAyLTQ1LjIgMi0xNS4xIDAtMzAuMi0uNy00NS0xLjktOC4zLTExLjktMTYuNC0yNC42LTI0LjItMzgtNy42LTEzLjEtMTQuNS0yNi40LTIwLjgtMzkuOCA2LjItMTMuNCAxMy4yLTI2LjggMjAuNy0zOS45IDcuOC0xMy41IDE1LjgtMjYuMyAyNC4xLTM4LjIgMTQuOS0xLjMgMzAtMiA0NS4yLTIgMTUuMSAwIDMwLjIuNyA0NSAxLjkgOC4zIDExLjkgMTYuNCAyNC42IDI0LjIgMzggNy42IDEzLjEgMTQuNSAyNi40IDIwLjggMzkuOC02LjMgMTMuNC0xMy4yIDI2LjgtMjAuNyAzOS45em0zMi4zLTEzYzUuNCAxMy40IDEwIDI2LjggMTMuOCAzOS44LTEzLjEgMy4yLTI2LjkgNS45LTQxLjIgOCA0LjktNy43IDkuOC0xNS42IDE0LjQtMjMuNyA0LjYtOCA4LjktMTYuMSAxMy0yNC4xek00MjEuMiA0MzBjLTkuMy05LjYtMTguNi0yMC4zLTI3LjgtMzIgOSAuNCAxOC4yLjcgMjcuNS43IDkuNCAwIDE4LjctLjIgMjcuOC0uNy05IDExLjctMTguMyAyMi40LTI3LjUgMzJ6bS03NC40LTU4LjljLTE0LjItMi4xLTI3LjktNC43LTQxLTcuOSAzLjctMTIuOSA4LjMtMjYuMiAxMy41LTM5LjUgNC4xIDggOC40IDE2IDEzLjEgMjQgNC43IDggOS41IDE1LjggMTQuNCAyMy40ek00MjAuNyAxNjNjOS4zIDkuNiAxOC42IDIwLjMgMjcuOCAzMi05LS40LTE4LjItLjctMjcuNS0uNy05LjQgMC0xOC43LjItMjcuOC43IDktMTEuNyAxOC4zLTIyLjQgMjcuNS0zMnptLTc0IDU4LjljLTQuOSA3LjctOS44IDE1LjYtMTQuNCAyMy43LTQuNiA4LTguOSAxNi0xMyAyNC01LjQtMTMuNC0xMC0yNi44LTEzLjgtMzkuOCAxMy4xLTMuMSAyNi45LTUuOCA0MS4yLTcuOXptLTkwLjUgMTI1LjJjLTM1LjQtMTUuMS01OC4zLTM0LjktNTguMy01MC42IDAtMTUuNyAyMi45LTM1LjYgNTguMy01MC42IDguNi0zLjcgMTgtNyAyNy43LTEwLjEgNS43IDE5LjYgMTMuMiA0MCAyMi41IDYwLjktOS4yIDIwLjgtMTYuNiA0MS4xLTIyLjIgNjAuNi05LjktMy4xLTE5LjMtNi41LTI4LTEwLjJ6TTMxMCA0OTBjLTEzLjYtNy44LTE5LjUtMzcuNS0xNC45LTc1LjcgMS4xLTkuNCAyLjktMTkuMyA1LjEtMjkuNCAxOS42IDQuOCA0MSA4LjUgNjMuNSAxMC45IDEzLjUgMTguNSAyNy41IDM1LjMgNDEuNiA1MC0zMi42IDMwLjMtNjMuMiA0Ni45LTg0IDQ2LjktNC41LS4xLTguMy0xLTExLjMtMi43em0yMzcuMi03Ni4yYzQuNyAzOC4yLTEuMSA2Ny45LTE0LjYgNzUuOC0zIDEuOC02LjkgMi42LTExLjUgMi42LTIwLjcgMC01MS40LTE2LjUtODQtNDYuNiAxNC0xNC43IDI4LTMxLjQgNDEuMy00OS45IDIyLjYtMi40IDQ0LTYuMSA2My42LTExIDIuMyAxMC4xIDQuMSAxOS44IDUuMiAyOS4xem0zOC41LTY2LjdjLTguNiAzLjctMTggNy0yNy43IDEwLjEtNS43LTE5LjYtMTMuMi00MC0yMi41LTYwLjkgOS4yLTIwLjggMTYuNi00MS4xIDIyLjItNjAuNiA5LjkgMy4xIDE5LjMgNi41IDI4LjEgMTAuMiAzNS40IDE1LjEgNTguMyAzNC45IDU4LjMgNTAuNi0uMSAxNS43LTIzIDM1LjYtNTguNCA1MC42ek0zMjAuOCA3OC40eiIvPgogICAgPGNpcmNsZSBjeD0iNDIwLjkiIGN5PSIyOTYuNSIgcj0iNDUuNyIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-redo: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgd2lkdGg9IjE2Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgICA8cGF0aCBkPSJNMCAwaDI0djI0SDB6IiBmaWxsPSJub25lIi8+PHBhdGggZD0iTTE4LjQgMTAuNkMxNi41NSA4Ljk5IDE0LjE1IDggMTEuNSA4Yy00LjY1IDAtOC41OCAzLjAzLTkuOTYgNy4yMkwzLjkgMTZjMS4wNS0zLjE5IDQuMDUtNS41IDcuNi01LjUgMS45NSAwIDMuNzMuNzIgNS4xMiAxLjg4TDEzIDE2aDlWN2wtMy42IDMuNnoiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-refresh: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDE4IDE4Ij4KICAgIDxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CiAgICAgICAgPHBhdGggZD0iTTkgMTMuNWMtMi40OSAwLTQuNS0yLjAxLTQuNS00LjVTNi41MSA0LjUgOSA0LjVjMS4yNCAwIDIuMzYuNTIgMy4xNyAxLjMzTDEwIDhoNVYzbC0xLjc2IDEuNzZDMTIuMTUgMy42OCAxMC42NiAzIDkgMyA1LjY5IDMgMy4wMSA1LjY5IDMuMDEgOVM1LjY5IDE1IDkgMTVjMi45NyAwIDUuNDMtMi4xNiA1LjktNWgtMS41MmMtLjQ2IDItMi4yNCAzLjUtNC4zOCAzLjV6Ii8+CiAgICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-regex: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIwIDIwIj4KICA8ZyBjbGFzcz0ianAtaWNvbjIiIGZpbGw9IiM0MTQxNDEiPgogICAgPHJlY3QgeD0iMiIgeT0iMiIgd2lkdGg9IjE2IiBoZWlnaHQ9IjE2Ii8+CiAgPC9nPgoKICA8ZyBjbGFzcz0ianAtaWNvbi1hY2NlbnQyIiBmaWxsPSIjRkZGIj4KICAgIDxjaXJjbGUgY2xhc3M9InN0MiIgY3g9IjUuNSIgY3k9IjE0LjUiIHI9IjEuNSIvPgogICAgPHJlY3QgeD0iMTIiIHk9IjQiIGNsYXNzPSJzdDIiIHdpZHRoPSIxIiBoZWlnaHQ9IjgiLz4KICAgIDxyZWN0IHg9IjguNSIgeT0iNy41IiB0cmFuc2Zvcm09Im1hdHJpeCgwLjg2NiAtMC41IDAuNSAwLjg2NiAtMi4zMjU1IDcuMzIxOSkiIGNsYXNzPSJzdDIiIHdpZHRoPSI4IiBoZWlnaHQ9IjEiLz4KICAgIDxyZWN0IHg9IjEyIiB5PSI0IiB0cmFuc2Zvcm09Im1hdHJpeCgwLjUgLTAuODY2IDAuODY2IDAuNSAtMC42Nzc5IDE0LjgyNTIpIiBjbGFzcz0ic3QyIiB3aWR0aD0iMSIgaGVpZ2h0PSI4Ii8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-run: url(data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CiAgICAgICAgPHBhdGggZD0iTTggNXYxNGwxMS03eiIvPgogICAgPC9nPgo8L3N2Zz4K);
  --jp-icon-running: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDUxMiA1MTIiPgogIDxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CiAgICA8cGF0aCBkPSJNMjU2IDhDMTE5IDggOCAxMTkgOCAyNTZzMTExIDI0OCAyNDggMjQ4IDI0OC0xMTEgMjQ4LTI0OFMzOTMgOCAyNTYgOHptOTYgMzI4YzAgOC44LTcuMiAxNi0xNiAxNkgxNzZjLTguOCAwLTE2LTcuMi0xNi0xNlYxNzZjMC04LjggNy4yLTE2IDE2LTE2aDE2MGM4LjggMCAxNiA3LjIgMTYgMTZ2MTYweiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-save: url(data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CiAgICAgICAgPHBhdGggZD0iTTE3IDNINWMtMS4xMSAwLTIgLjktMiAydjE0YzAgMS4xLjg5IDIgMiAyaDE0YzEuMSAwIDItLjkgMi0yVjdsLTQtNHptLTUgMTZjLTEuNjYgMC0zLTEuMzQtMy0zczEuMzQtMyAzLTMgMyAxLjM0IDMgMy0xLjM0IDMtMyAzem0zLTEwSDVWNWgxMHY0eiIvPgogICAgPC9nPgo8L3N2Zz4K);
  --jp-icon-search: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMTggMTgiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTEyLjEsMTAuOWgtMC43bC0wLjItMC4yYzAuOC0wLjksMS4zLTIuMiwxLjMtMy41YzAtMy0yLjQtNS40LTUuNC01LjRTMS44LDQuMiwxLjgsNy4xczIuNCw1LjQsNS40LDUuNCBjMS4zLDAsMi41LTAuNSwzLjUtMS4zbDAuMiwwLjJ2MC43bDQuMSw0LjFsMS4yLTEuMkwxMi4xLDEwLjl6IE03LjEsMTAuOWMtMi4xLDAtMy43LTEuNy0zLjctMy43czEuNy0zLjcsMy43LTMuN3MzLjcsMS43LDMuNywzLjcgUzkuMiwxMC45LDcuMSwxMC45eiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-settings: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8cGF0aCBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIiBkPSJNMTkuNDMgMTIuOThjLjA0LS4zMi4wNy0uNjQuMDctLjk4cy0uMDMtLjY2LS4wNy0uOThsMi4xMS0xLjY1Yy4xOS0uMTUuMjQtLjQyLjEyLS42NGwtMi0zLjQ2Yy0uMTItLjIyLS4zOS0uMy0uNjEtLjIybC0yLjQ5IDFjLS41Mi0uNC0xLjA4LS43My0xLjY5LS45OGwtLjM4LTIuNjVBLjQ4OC40ODggMCAwMDE0IDJoLTRjLS4yNSAwLS40Ni4xOC0uNDkuNDJsLS4zOCAyLjY1Yy0uNjEuMjUtMS4xNy41OS0xLjY5Ljk4bC0yLjQ5LTFjLS4yMy0uMDktLjQ5IDAtLjYxLjIybC0yIDMuNDZjLS4xMy4yMi0uMDcuNDkuMTIuNjRsMi4xMSAxLjY1Yy0uMDQuMzItLjA3LjY1LS4wNy45OHMuMDMuNjYuMDcuOThsLTIuMTEgMS42NWMtLjE5LjE1LS4yNC40Mi0uMTIuNjRsMiAzLjQ2Yy4xMi4yMi4zOS4zLjYxLjIybDIuNDktMWMuNTIuNCAxLjA4LjczIDEuNjkuOThsLjM4IDIuNjVjLjAzLjI0LjI0LjQyLjQ5LjQyaDRjLjI1IDAgLjQ2LS4xOC40OS0uNDJsLjM4LTIuNjVjLjYxLS4yNSAxLjE3LS41OSAxLjY5LS45OGwyLjQ5IDFjLjIzLjA5LjQ5IDAgLjYxLS4yMmwyLTMuNDZjLjEyLS4yMi4wNy0uNDktLjEyLS42NGwtMi4xMS0xLjY1ek0xMiAxNS41Yy0xLjkzIDAtMy41LTEuNTctMy41LTMuNXMxLjU3LTMuNSAzLjUtMy41IDMuNSAxLjU3IDMuNSAzLjUtMS41NyAzLjUtMy41IDMuNXoiLz4KPC9zdmc+Cg==);
  --jp-icon-spreadsheet: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICA8cGF0aCBjbGFzcz0ianAtaWNvbi1jb250cmFzdDEganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNENBRjUwIiBkPSJNMi4yIDIuMnYxNy42aDE3LjZWMi4ySDIuMnptMTUuNCA3LjdoLTUuNVY0LjRoNS41djUuNXpNOS45IDQuNHY1LjVINC40VjQuNGg1LjV6bS01LjUgNy43aDUuNXY1LjVINC40di01LjV6bTcuNyA1LjV2LTUuNWg1LjV2NS41aC01LjV6Ii8+Cjwvc3ZnPgo=);
  --jp-icon-stop: url(data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIgZmlsbD0ibm9uZSIvPgogICAgICAgIDxwYXRoIGQ9Ik02IDZoMTJ2MTJINnoiLz4KICAgIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-tab: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTIxIDNIM2MtMS4xIDAtMiAuOS0yIDJ2MTRjMCAxLjEuOSAyIDIgMmgxOGMxLjEgMCAyLS45IDItMlY1YzAtMS4xLS45LTItMi0yem0wIDE2SDNWNWgxMHY0aDh2MTB6Ii8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-table-rows: url(data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIgZmlsbD0ibm9uZSIvPgogICAgICAgIDxwYXRoIGQ9Ik0yMSw4SDNWNGgxOFY4eiBNMjEsMTBIM3Y0aDE4VjEweiBNMjEsMTZIM3Y0aDE4VjE2eiIvPgogICAgPC9nPgo8L3N2Zz4=);
  --jp-icon-tag: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjgiIGhlaWdodD0iMjgiIHZpZXdCb3g9IjAgMCA0MyAyOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KCTxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CgkJPHBhdGggZD0iTTI4LjgzMzIgMTIuMzM0TDMyLjk5OTggMTYuNTAwN0wzNy4xNjY1IDEyLjMzNEgyOC44MzMyWiIvPgoJCTxwYXRoIGQ9Ik0xNi4yMDk1IDIxLjYxMDRDMTUuNjg3MyAyMi4xMjk5IDE0Ljg0NDMgMjIuMTI5OSAxNC4zMjQ4IDIxLjYxMDRMNi45ODI5IDE0LjcyNDVDNi41NzI0IDE0LjMzOTQgNi4wODMxMyAxMy42MDk4IDYuMDQ3ODYgMTMuMDQ4MkM1Ljk1MzQ3IDExLjUyODggNi4wMjAwMiA4LjYxOTQ0IDYuMDY2MjEgNy4wNzY5NUM2LjA4MjgxIDYuNTE0NzcgNi41NTU0OCA2LjA0MzQ3IDcuMTE4MDQgNi4wMzA1NUM5LjA4ODYzIDUuOTg0NzMgMTMuMjYzOCA1LjkzNTc5IDEzLjY1MTggNi4zMjQyNUwyMS43MzY5IDEzLjYzOUMyMi4yNTYgMTQuMTU4NSAyMS43ODUxIDE1LjQ3MjQgMjEuMjYyIDE1Ljk5NDZMMTYuMjA5NSAyMS42MTA0Wk05Ljc3NTg1IDguMjY1QzkuMzM1NTEgNy44MjU2NiA4LjYyMzUxIDcuODI1NjYgOC4xODI4IDguMjY1QzcuNzQzNDYgOC43MDU3MSA3Ljc0MzQ2IDkuNDE3MzMgOC4xODI4IDkuODU2NjdDOC42MjM4MiAxMC4yOTY0IDkuMzM1ODIgMTAuMjk2NCA5Ljc3NTg1IDkuODU2NjdDMTAuMjE1NiA5LjQxNzMzIDEwLjIxNTYgOC43MDUzMyA5Ljc3NTg1IDguMjY1WiIvPgoJPC9nPgo8L3N2Zz4K);
  --jp-icon-terminal: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0IiA+CiAgICA8cmVjdCBjbGFzcz0ianAtaWNvbjIganAtaWNvbi1zZWxlY3RhYmxlIiB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDIgMikiIGZpbGw9IiMzMzMzMzMiLz4KICAgIDxwYXRoIGNsYXNzPSJqcC1pY29uLWFjY2VudDIganAtaWNvbi1zZWxlY3RhYmxlLWludmVyc2UiIGQ9Ik01LjA1NjY0IDguNzYxNzJDNS4wNTY2NCA4LjU5NzY2IDUuMDMxMjUgOC40NTMxMiA0Ljk4MDQ3IDguMzI4MTJDNC45MzM1OSA4LjE5OTIyIDQuODU1NDcgOC4wODIwMyA0Ljc0NjA5IDcuOTc2NTZDNC42NDA2MiA3Ljg3MTA5IDQuNSA3Ljc3NTM5IDQuMzI0MjIgNy42ODk0NUM0LjE1MjM0IDcuNTk5NjEgMy45NDMzNiA3LjUxMTcyIDMuNjk3MjcgNy40MjU3OEMzLjMwMjczIDcuMjg1MTYgMi45NDMzNiA3LjEzNjcyIDIuNjE5MTQgNi45ODA0N0MyLjI5NDkyIDYuODI0MjIgMi4wMTc1OCA2LjY0MjU4IDEuNzg3MTEgNi40MzU1NUMxLjU2MDU1IDYuMjI4NTIgMS4zODQ3NyA1Ljk4ODI4IDEuMjU5NzcgNS43MTQ4NEMxLjEzNDc3IDUuNDM3NSAxLjA3MjI3IDUuMTA5MzggMS4wNzIyNyA0LjczMDQ3QzEuMDcyMjcgNC4zOTg0NCAxLjEyODkxIDQuMDk1NyAxLjI0MjE5IDMuODIyMjdDMS4zNTU0NyAzLjU0NDkyIDEuNTE1NjIgMy4zMDQ2OSAxLjcyMjY2IDMuMTAxNTZDMS45Mjk2OSAyLjg5ODQ0IDIuMTc5NjkgMi43MzQzNyAyLjQ3MjY2IDIuNjA5MzhDMi43NjU2MiAyLjQ4NDM4IDMuMDkxOCAyLjQwNDMgMy40NTExNyAyLjM2OTE0VjEuMTA5MzhINC4zODg2N1YyLjM4MDg2QzQuNzQwMjMgMi40Mjc3MyA1LjA1NjY0IDIuNTIzNDQgNS4zMzc4OSAyLjY2Nzk3QzUuNjE5MTQgMi44MTI1IDUuODU3NDIgMy4wMDE5NSA2LjA1MjczIDMuMjM2MzNDNi4yNTE5NSAzLjQ2NjggNi40MDQzIDMuNzQwMjMgNi41MDk3NyA0LjA1NjY0QzYuNjE5MTQgNC4zNjkxNCA2LjY3MzgzIDQuNzIwNyA2LjY3MzgzIDUuMTExMzNINS4wNDQ5MkM1LjA0NDkyIDQuNjM4NjcgNC45Mzc1IDQuMjgxMjUgNC43MjI2NiA0LjAzOTA2QzQuNTA3ODEgMy43OTI5NyA0LjIxNjggMy42Njk5MiAzLjg0OTYxIDMuNjY5OTJDMy42NTAzOSAzLjY2OTkyIDMuNDc2NTYgMy42OTcyNyAzLjMyODEyIDMuNzUxOTVDMy4xODM1OSAzLjgwMjczIDMuMDY0NDUgMy44NzY5NSAyLjk3MDcgMy45NzQ2MUMyLjg3Njk1IDQuMDY4MzYgMi44MDY2NCA0LjE3OTY5IDIuNzU5NzcgNC4zMDg1OUMyLjcxNjggNC40Mzc1IDIuNjk1MzEgNC41NzgxMiAyLjY5NTMxIDQuNzMwNDdDMi42OTUzMSA0Ljg4MjgxIDIuNzE2OCA1LjAxOTUzIDIuNzU5NzcgNS4xNDA2MkMyLjgwNjY0IDUuMjU3ODEgMi44ODI4MSA1LjM2NzE5IDIuOTg4MjggNS40Njg3NUMzLjA5NzY2IDUuNTcwMzEgMy4yNDAyMyA1LjY2Nzk3IDMuNDE2MDIgNS43NjE3MkMzLjU5MTggNS44NTE1NiAzLjgxMDU1IDUuOTQzMzYgNC4wNzIyNyA2LjAzNzExQzQuNDY2OCA2LjE4NTU1IDQuODI0MjIgNi4zMzk4NCA1LjE0NDUzIDYuNUM1LjQ2NDg0IDYuNjU2MjUgNS43MzgyOCA2LjgzOTg0IDUuOTY0ODQgNy4wNTA3OEM2LjE5NTMxIDcuMjU3ODEgNi4zNzEwOSA3LjUgNi40OTIxOSA3Ljc3NzM0QzYuNjE3MTkgOC4wNTA3OCA2LjY3OTY5IDguMzc1IDYuNjc5NjkgOC43NUM2LjY3OTY5IDkuMDkzNzUgNi42MjMwNSA5LjQwNDMgNi41MDk3NyA5LjY4MTY0QzYuMzk2NDggOS45NTUwOCA2LjIzNDM4IDEwLjE5MTQgNi4wMjM0NCAxMC4zOTA2QzUuODEyNSAxMC41ODk4IDUuNTU4NTkgMTAuNzUgNS4yNjE3MiAxMC44NzExQzQuOTY0ODQgMTAuOTg4MyA0LjYzMjgxIDExLjA2NDUgNC4yNjU2MiAxMS4wOTk2VjEyLjI0OEgzLjMzMzk4VjExLjA5OTZDMy4wMDE5NSAxMS4wNjg0IDIuNjc5NjkgMTAuOTk2MSAyLjM2NzE5IDEwLjg4MjhDMi4wNTQ2OSAxMC43NjU2IDEuNzc3MzQgMTAuNTk3NyAxLjUzNTE2IDEwLjM3ODlDMS4yOTY4OCAxMC4xNjAyIDEuMTA1NDcgOS44ODQ3NyAwLjk2MDkzOCA5LjU1MjczQzAuODE2NDA2IDkuMjE2OCAwLjc0NDE0MSA4LjgxNDQ1IDAuNzQ0MTQxIDguMzQ1N0gyLjM3ODkxQzIuMzc4OTEgOC42MjY5NSAyLjQxOTkyIDguODYzMjggMi41MDE5NSA5LjA1NDY5QzIuNTgzOTggOS4yNDIxOSAyLjY4OTQ1IDkuMzkyNTggMi44MTgzNiA5LjUwNTg2QzIuOTUxMTcgOS42MTUyMyAzLjEwMTU2IDkuNjkzMzYgMy4yNjk1MyA5Ljc0MDIzQzMuNDM3NSA5Ljc4NzExIDMuNjA5MzggOS44MTA1NSAzLjc4NTE2IDkuODEwNTVDNC4yMDMxMiA5LjgxMDU1IDQuNTE5NTMgOS43MTI4OSA0LjczNDM4IDkuNTE3NThDNC45NDkyMiA5LjMyMjI3IDUuMDU2NjQgOS4wNzAzMSA1LjA1NjY0IDguNzYxNzJaTTEzLjQxOCAxMi4yNzE1SDguMDc0MjJWMTFIMTMuNDE4VjEyLjI3MTVaIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzLjk1MjY0IDYpIiBmaWxsPSJ3aGl0ZSIvPgo8L3N2Zz4K);
  --jp-icon-text-editor: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8cGF0aCBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIiBkPSJNMTUgMTVIM3YyaDEydi0yem0wLThIM3YyaDEyVjd6TTMgMTNoMTh2LTJIM3Yyem0wIDhoMTh2LTJIM3Yyek0zIDN2MmgxOFYzSDN6Ii8+Cjwvc3ZnPgo=);
  --jp-icon-toc: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIj4KICAgIDxwYXRoIGQ9Ik03LDVIMjFWN0g3VjVNNywxM1YxMUgyMVYxM0g3TTQsNC41QTEuNSwxLjUgMCAwLDEgNS41LDZBMS41LDEuNSAwIDAsMSA0LDcuNUExLjUsMS41IDAgMCwxIDIuNSw2QTEuNSwxLjUgMCAwLDEgNCw0LjVNNCwxMC41QTEuNSwxLjUgMCAwLDEgNS41LDEyQTEuNSwxLjUgMCAwLDEgNCwxMy41QTEuNSwxLjUgMCAwLDEgMi41LDEyQTEuNSwxLjUgMCAwLDEgNCwxMC41TTcsMTlWMTdIMjFWMTlIN000LDE2LjVBMS41LDEuNSAwIDAsMSA1LjUsMThBMS41LDEuNSAwIDAsMSA0LDE5LjVBMS41LDEuNSAwIDAsMSAyLjUsMThBMS41LDEuNSAwIDAsMSA0LDE2LjVaIiAvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-tree-view: url(data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIgZmlsbD0ibm9uZSIvPgogICAgICAgIDxwYXRoIGQ9Ik0yMiAxMVYzaC03djNIOVYzSDJ2OGg3VjhoMnYxMGg0djNoN3YtOGgtN3YzaC0yVjhoMnYzeiIvPgogICAgPC9nPgo8L3N2Zz4=);
  --jp-icon-trusted: url(data:image/svg+xml;base64,PHN2ZyBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI1Ij4KICAgIDxwYXRoIGNsYXNzPSJqcC1pY29uMiIgc3Ryb2tlPSIjMzMzMzMzIiBzdHJva2Utd2lkdGg9IjIiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDIgMykiIGQ9Ik0xLjg2MDk0IDExLjQ0MDlDMC44MjY0NDggOC43NzAyNyAwLjg2Mzc3OSA2LjA1NzY0IDEuMjQ5MDcgNC4xOTkzMkMyLjQ4MjA2IDMuOTMzNDcgNC4wODA2OCAzLjQwMzQ3IDUuNjAxMDIgMi44NDQ5QzcuMjM1NDkgMi4yNDQ0IDguODU2NjYgMS41ODE1IDkuOTg3NiAxLjA5NTM5QzExLjA1OTcgMS41ODM0MSAxMi42MDk0IDIuMjQ0NCAxNC4yMTggMi44NDMzOUMxNS43NTAzIDMuNDEzOTQgMTcuMzk5NSAzLjk1MjU4IDE4Ljc1MzkgNC4yMTM4NUMxOS4xMzY0IDYuMDcxNzcgMTkuMTcwOSA4Ljc3NzIyIDE4LjEzOSAxMS40NDA5QzE3LjAzMDMgMTQuMzAzMiAxNC42NjY4IDE3LjE4NDQgOS45OTk5OSAxOC45MzU0QzUuMzMzMiAxNy4xODQ0IDIuOTY5NjggMTQuMzAzMiAxLjg2MDk0IDExLjQ0MDlaIi8+CiAgICA8cGF0aCBjbGFzcz0ianAtaWNvbjIiIGZpbGw9IiMzMzMzMzMiIHN0cm9rZT0iIzMzMzMzMyIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoOCA5Ljg2NzE5KSIgZD0iTTIuODYwMTUgNC44NjUzNUwwLjcyNjU0OSAyLjk5OTU5TDAgMy42MzA0NUwyLjg2MDE1IDYuMTMxNTdMOCAwLjYzMDg3Mkw3LjI3ODU3IDBMMi44NjAxNSA0Ljg2NTM1WiIvPgo8L3N2Zz4K);
  --jp-icon-undo: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTEyLjUgOGMtMi42NSAwLTUuMDUuOTktNi45IDIuNkwyIDd2OWg5bC0zLjYyLTMuNjJjMS4zOS0xLjE2IDMuMTYtMS44OCA1LjEyLTEuODggMy41NCAwIDYuNTUgMi4zMSA3LjYgNS41bDIuMzctLjc4QzIxLjA4IDExLjAzIDE3LjE1IDggMTIuNSA4eiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-vega: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICA8ZyBjbGFzcz0ianAtaWNvbjEganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjMjEyMTIxIj4KICAgIDxwYXRoIGQ9Ik0xMC42IDUuNGwyLjItMy4ySDIuMnY3LjNsNC02LjZ6Ii8+CiAgICA8cGF0aCBkPSJNMTUuOCAyLjJsLTQuNCA2LjZMNyA2LjNsLTQuOCA4djUuNWgxNy42VjIuMmgtNHptLTcgMTUuNEg1LjV2LTQuNGgzLjN2NC40em00LjQgMEg5LjhWOS44aDMuNHY3Ljh6bTQuNCAwaC0zLjRWNi41aDMuNHYxMS4xeiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-yaml: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICA8ZyBjbGFzcz0ianAtaWNvbi1jb250cmFzdDIganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjRDgxQjYwIj4KICAgIDxwYXRoIGQ9Ik03LjIgMTguNnYtNS40TDMgNS42aDMuM2wxLjQgMy4xYy4zLjkuNiAxLjYgMSAyLjUuMy0uOC42LTEuNiAxLTIuNWwxLjQtMy4xaDMuNGwtNC40IDcuNnY1LjVsLTIuOS0uMXoiLz4KICAgIDxjaXJjbGUgY2xhc3M9InN0MCIgY3g9IjE3LjYiIGN5PSIxNi41IiByPSIyLjEiLz4KICAgIDxjaXJjbGUgY2xhc3M9InN0MCIgY3g9IjE3LjYiIGN5PSIxMSIgcj0iMi4xIi8+CiAgPC9nPgo8L3N2Zz4K);
}

/* Icon CSS class declarations */

.jp-AddIcon {
  background-image: var(--jp-icon-add);
}
.jp-BugIcon {
  background-image: var(--jp-icon-bug);
}
.jp-BuildIcon {
  background-image: var(--jp-icon-build);
}
.jp-CaretDownEmptyIcon {
  background-image: var(--jp-icon-caret-down-empty);
}
.jp-CaretDownEmptyThinIcon {
  background-image: var(--jp-icon-caret-down-empty-thin);
}
.jp-CaretDownIcon {
  background-image: var(--jp-icon-caret-down);
}
.jp-CaretLeftIcon {
  background-image: var(--jp-icon-caret-left);
}
.jp-CaretRightIcon {
  background-image: var(--jp-icon-caret-right);
}
.jp-CaretUpEmptyThinIcon {
  background-image: var(--jp-icon-caret-up-empty-thin);
}
.jp-CaretUpIcon {
  background-image: var(--jp-icon-caret-up);
}
.jp-CaseSensitiveIcon {
  background-image: var(--jp-icon-case-sensitive);
}
.jp-CheckIcon {
  background-image: var(--jp-icon-check);
}
.jp-CircleEmptyIcon {
  background-image: var(--jp-icon-circle-empty);
}
.jp-CircleIcon {
  background-image: var(--jp-icon-circle);
}
.jp-ClearIcon {
  background-image: var(--jp-icon-clear);
}
.jp-CloseIcon {
  background-image: var(--jp-icon-close);
}
.jp-CodeIcon {
  background-image: var(--jp-icon-code);
}
.jp-ConsoleIcon {
  background-image: var(--jp-icon-console);
}
.jp-CopyIcon {
  background-image: var(--jp-icon-copy);
}
.jp-CopyrightIcon {
  background-image: var(--jp-icon-copyright);
}
.jp-CutIcon {
  background-image: var(--jp-icon-cut);
}
.jp-DownloadIcon {
  background-image: var(--jp-icon-download);
}
.jp-EditIcon {
  background-image: var(--jp-icon-edit);
}
.jp-EllipsesIcon {
  background-image: var(--jp-icon-ellipses);
}
.jp-ExtensionIcon {
  background-image: var(--jp-icon-extension);
}
.jp-FastForwardIcon {
  background-image: var(--jp-icon-fast-forward);
}
.jp-FileIcon {
  background-image: var(--jp-icon-file);
}
.jp-FileUploadIcon {
  background-image: var(--jp-icon-file-upload);
}
.jp-FilterListIcon {
  background-image: var(--jp-icon-filter-list);
}
.jp-FolderIcon {
  background-image: var(--jp-icon-folder);
}
.jp-Html5Icon {
  background-image: var(--jp-icon-html5);
}
.jp-ImageIcon {
  background-image: var(--jp-icon-image);
}
.jp-InspectorIcon {
  background-image: var(--jp-icon-inspector);
}
.jp-JsonIcon {
  background-image: var(--jp-icon-json);
}
.jp-JuliaIcon {
  background-image: var(--jp-icon-julia);
}
.jp-JupyterFaviconIcon {
  background-image: var(--jp-icon-jupyter-favicon);
}
.jp-JupyterIcon {
  background-image: var(--jp-icon-jupyter);
}
.jp-JupyterlabWordmarkIcon {
  background-image: var(--jp-icon-jupyterlab-wordmark);
}
.jp-KernelIcon {
  background-image: var(--jp-icon-kernel);
}
.jp-KeyboardIcon {
  background-image: var(--jp-icon-keyboard);
}
.jp-LauncherIcon {
  background-image: var(--jp-icon-launcher);
}
.jp-LineFormIcon {
  background-image: var(--jp-icon-line-form);
}
.jp-LinkIcon {
  background-image: var(--jp-icon-link);
}
.jp-ListIcon {
  background-image: var(--jp-icon-list);
}
.jp-ListingsInfoIcon {
  background-image: var(--jp-icon-listings-info);
}
.jp-MarkdownIcon {
  background-image: var(--jp-icon-markdown);
}
.jp-NewFolderIcon {
  background-image: var(--jp-icon-new-folder);
}
.jp-NotTrustedIcon {
  background-image: var(--jp-icon-not-trusted);
}
.jp-NotebookIcon {
  background-image: var(--jp-icon-notebook);
}
.jp-NumberingIcon {
  background-image: var(--jp-icon-numbering);
}
.jp-OfflineBoltIcon {
  background-image: var(--jp-icon-offline-bolt);
}
.jp-PaletteIcon {
  background-image: var(--jp-icon-palette);
}
.jp-PasteIcon {
  background-image: var(--jp-icon-paste);
}
.jp-PdfIcon {
  background-image: var(--jp-icon-pdf);
}
.jp-PythonIcon {
  background-image: var(--jp-icon-python);
}
.jp-RKernelIcon {
  background-image: var(--jp-icon-r-kernel);
}
.jp-ReactIcon {
  background-image: var(--jp-icon-react);
}
.jp-RedoIcon {
  background-image: var(--jp-icon-redo);
}
.jp-RefreshIcon {
  background-image: var(--jp-icon-refresh);
}
.jp-RegexIcon {
  background-image: var(--jp-icon-regex);
}
.jp-RunIcon {
  background-image: var(--jp-icon-run);
}
.jp-RunningIcon {
  background-image: var(--jp-icon-running);
}
.jp-SaveIcon {
  background-image: var(--jp-icon-save);
}
.jp-SearchIcon {
  background-image: var(--jp-icon-search);
}
.jp-SettingsIcon {
  background-image: var(--jp-icon-settings);
}
.jp-SpreadsheetIcon {
  background-image: var(--jp-icon-spreadsheet);
}
.jp-StopIcon {
  background-image: var(--jp-icon-stop);
}
.jp-TabIcon {
  background-image: var(--jp-icon-tab);
}
.jp-TableRowsIcon {
  background-image: var(--jp-icon-table-rows);
}
.jp-TagIcon {
  background-image: var(--jp-icon-tag);
}
.jp-TerminalIcon {
  background-image: var(--jp-icon-terminal);
}
.jp-TextEditorIcon {
  background-image: var(--jp-icon-text-editor);
}
.jp-TocIcon {
  background-image: var(--jp-icon-toc);
}
.jp-TreeViewIcon {
  background-image: var(--jp-icon-tree-view);
}
.jp-TrustedIcon {
  background-image: var(--jp-icon-trusted);
}
.jp-UndoIcon {
  background-image: var(--jp-icon-undo);
}
.jp-VegaIcon {
  background-image: var(--jp-icon-vega);
}
.jp-YamlIcon {
  background-image: var(--jp-icon-yaml);
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/**
 * (DEPRECATED) Support for consuming icons as CSS background images
 */

.jp-Icon,
.jp-MaterialIcon {
  background-position: center;
  background-repeat: no-repeat;
  background-size: 16px;
  min-width: 16px;
  min-height: 16px;
}

.jp-Icon-cover {
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

/**
 * (DEPRECATED) Support for specific CSS icon sizes
 */

.jp-Icon-16 {
  background-size: 16px;
  min-width: 16px;
  min-height: 16px;
}

.jp-Icon-18 {
  background-size: 18px;
  min-width: 18px;
  min-height: 18px;
}

.jp-Icon-20 {
  background-size: 20px;
  min-width: 20px;
  min-height: 20px;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/**
 * Support for icons as inline SVG HTMLElements
 */

/* recolor the primary elements of an icon */
.jp-icon0[fill] {
  fill: var(--jp-inverse-layout-color0);
}
.jp-icon1[fill] {
  fill: var(--jp-inverse-layout-color1);
}
.jp-icon2[fill] {
  fill: var(--jp-inverse-layout-color2);
}
.jp-icon3[fill] {
  fill: var(--jp-inverse-layout-color3);
}
.jp-icon4[fill] {
  fill: var(--jp-inverse-layout-color4);
}

.jp-icon0[stroke] {
  stroke: var(--jp-inverse-layout-color0);
}
.jp-icon1[stroke] {
  stroke: var(--jp-inverse-layout-color1);
}
.jp-icon2[stroke] {
  stroke: var(--jp-inverse-layout-color2);
}
.jp-icon3[stroke] {
  stroke: var(--jp-inverse-layout-color3);
}
.jp-icon4[stroke] {
  stroke: var(--jp-inverse-layout-color4);
}
/* recolor the accent elements of an icon */
.jp-icon-accent0[fill] {
  fill: var(--jp-layout-color0);
}
.jp-icon-accent1[fill] {
  fill: var(--jp-layout-color1);
}
.jp-icon-accent2[fill] {
  fill: var(--jp-layout-color2);
}
.jp-icon-accent3[fill] {
  fill: var(--jp-layout-color3);
}
.jp-icon-accent4[fill] {
  fill: var(--jp-layout-color4);
}

.jp-icon-accent0[stroke] {
  stroke: var(--jp-layout-color0);
}
.jp-icon-accent1[stroke] {
  stroke: var(--jp-layout-color1);
}
.jp-icon-accent2[stroke] {
  stroke: var(--jp-layout-color2);
}
.jp-icon-accent3[stroke] {
  stroke: var(--jp-layout-color3);
}
.jp-icon-accent4[stroke] {
  stroke: var(--jp-layout-color4);
}
/* set the color of an icon to transparent */
.jp-icon-none[fill] {
  fill: none;
}

.jp-icon-none[stroke] {
  stroke: none;
}
/* brand icon colors. Same for light and dark */
.jp-icon-brand0[fill] {
  fill: var(--jp-brand-color0);
}
.jp-icon-brand1[fill] {
  fill: var(--jp-brand-color1);
}
.jp-icon-brand2[fill] {
  fill: var(--jp-brand-color2);
}
.jp-icon-brand3[fill] {
  fill: var(--jp-brand-color3);
}
.jp-icon-brand4[fill] {
  fill: var(--jp-brand-color4);
}

.jp-icon-brand0[stroke] {
  stroke: var(--jp-brand-color0);
}
.jp-icon-brand1[stroke] {
  stroke: var(--jp-brand-color1);
}
.jp-icon-brand2[stroke] {
  stroke: var(--jp-brand-color2);
}
.jp-icon-brand3[stroke] {
  stroke: var(--jp-brand-color3);
}
.jp-icon-brand4[stroke] {
  stroke: var(--jp-brand-color4);
}
/* warn icon colors. Same for light and dark */
.jp-icon-warn0[fill] {
  fill: var(--jp-warn-color0);
}
.jp-icon-warn1[fill] {
  fill: var(--jp-warn-color1);
}
.jp-icon-warn2[fill] {
  fill: var(--jp-warn-color2);
}
.jp-icon-warn3[fill] {
  fill: var(--jp-warn-color3);
}

.jp-icon-warn0[stroke] {
  stroke: var(--jp-warn-color0);
}
.jp-icon-warn1[stroke] {
  stroke: var(--jp-warn-color1);
}
.jp-icon-warn2[stroke] {
  stroke: var(--jp-warn-color2);
}
.jp-icon-warn3[stroke] {
  stroke: var(--jp-warn-color3);
}
/* icon colors that contrast well with each other and most backgrounds */
.jp-icon-contrast0[fill] {
  fill: var(--jp-icon-contrast-color0);
}
.jp-icon-contrast1[fill] {
  fill: var(--jp-icon-contrast-color1);
}
.jp-icon-contrast2[fill] {
  fill: var(--jp-icon-contrast-color2);
}
.jp-icon-contrast3[fill] {
  fill: var(--jp-icon-contrast-color3);
}

.jp-icon-contrast0[stroke] {
  stroke: var(--jp-icon-contrast-color0);
}
.jp-icon-contrast1[stroke] {
  stroke: var(--jp-icon-contrast-color1);
}
.jp-icon-contrast2[stroke] {
  stroke: var(--jp-icon-contrast-color2);
}
.jp-icon-contrast3[stroke] {
  stroke: var(--jp-icon-contrast-color3);
}

/* CSS for icons in selected items in the settings editor */
#setting-editor .jp-PluginList .jp-mod-selected .jp-icon-selectable[fill] {
  fill: #fff;
}
#setting-editor
  .jp-PluginList
  .jp-mod-selected
  .jp-icon-selectable-inverse[fill] {
  fill: var(--jp-brand-color1);
}

/* CSS for icons in selected filebrowser listing items */
.jp-DirListing-item.jp-mod-selected .jp-icon-selectable[fill] {
  fill: #fff;
}
.jp-DirListing-item.jp-mod-selected .jp-icon-selectable-inverse[fill] {
  fill: var(--jp-brand-color1);
}

/* CSS for icons in selected tabs in the sidebar tab manager */
#tab-manager .lm-TabBar-tab.jp-mod-active .jp-icon-selectable[fill] {
  fill: #fff;
}

#tab-manager .lm-TabBar-tab.jp-mod-active .jp-icon-selectable-inverse[fill] {
  fill: var(--jp-brand-color1);
}
#tab-manager
  .lm-TabBar-tab.jp-mod-active
  .jp-icon-hover
  :hover
  .jp-icon-selectable[fill] {
  fill: var(--jp-brand-color1);
}

#tab-manager
  .lm-TabBar-tab.jp-mod-active
  .jp-icon-hover
  :hover
  .jp-icon-selectable-inverse[fill] {
  fill: #fff;
}

/**
 * TODO: come up with non css-hack solution for showing the busy icon on top
 *  of the close icon
 * CSS for complex behavior of close icon of tabs in the sidebar tab manager
 */
#tab-manager
  .lm-TabBar-tab.jp-mod-dirty
  > .lm-TabBar-tabCloseIcon
  > :not(:hover)
  > .jp-icon3[fill] {
  fill: none;
}
#tab-manager
  .lm-TabBar-tab.jp-mod-dirty
  > .lm-TabBar-tabCloseIcon
  > :not(:hover)
  > .jp-icon-busy[fill] {
  fill: var(--jp-inverse-layout-color3);
}

#tab-manager
  .lm-TabBar-tab.jp-mod-dirty.jp-mod-active
  > .lm-TabBar-tabCloseIcon
  > :not(:hover)
  > .jp-icon-busy[fill] {
  fill: #fff;
}

/**
* TODO: come up with non css-hack solution for showing the busy icon on top
*  of the close icon
* CSS for complex behavior of close icon of tabs in the main area tabbar
*/
.lm-DockPanel-tabBar
  .lm-TabBar-tab.lm-mod-closable.jp-mod-dirty
  > .lm-TabBar-tabCloseIcon
  > :not(:hover)
  > .jp-icon3[fill] {
  fill: none;
}
.lm-DockPanel-tabBar
  .lm-TabBar-tab.lm-mod-closable.jp-mod-dirty
  > .lm-TabBar-tabCloseIcon
  > :not(:hover)
  > .jp-icon-busy[fill] {
  fill: var(--jp-inverse-layout-color3);
}

/* CSS for icons in status bar */
#jp-main-statusbar .jp-mod-selected .jp-icon-selectable[fill] {
  fill: #fff;
}

#jp-main-statusbar .jp-mod-selected .jp-icon-selectable-inverse[fill] {
  fill: var(--jp-brand-color1);
}
/* special handling for splash icon CSS. While the theme CSS reloads during
   splash, the splash icon can loose theming. To prevent that, we set a
   default for its color variable */
:root {
  --jp-warn-color0: var(--md-orange-700);
}

/* not sure what to do with this one, used in filebrowser listing */
.jp-DragIcon {
  margin-right: 4px;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/**
 * Support for alt colors for icons as inline SVG HTMLElements
 */

/* alt recolor the primary elements of an icon */
.jp-icon-alt .jp-icon0[fill] {
  fill: var(--jp-layout-color0);
}
.jp-icon-alt .jp-icon1[fill] {
  fill: var(--jp-layout-color1);
}
.jp-icon-alt .jp-icon2[fill] {
  fill: var(--jp-layout-color2);
}
.jp-icon-alt .jp-icon3[fill] {
  fill: var(--jp-layout-color3);
}
.jp-icon-alt .jp-icon4[fill] {
  fill: var(--jp-layout-color4);
}

.jp-icon-alt .jp-icon0[stroke] {
  stroke: var(--jp-layout-color0);
}
.jp-icon-alt .jp-icon1[stroke] {
  stroke: var(--jp-layout-color1);
}
.jp-icon-alt .jp-icon2[stroke] {
  stroke: var(--jp-layout-color2);
}
.jp-icon-alt .jp-icon3[stroke] {
  stroke: var(--jp-layout-color3);
}
.jp-icon-alt .jp-icon4[stroke] {
  stroke: var(--jp-layout-color4);
}

/* alt recolor the accent elements of an icon */
.jp-icon-alt .jp-icon-accent0[fill] {
  fill: var(--jp-inverse-layout-color0);
}
.jp-icon-alt .jp-icon-accent1[fill] {
  fill: var(--jp-inverse-layout-color1);
}
.jp-icon-alt .jp-icon-accent2[fill] {
  fill: var(--jp-inverse-layout-color2);
}
.jp-icon-alt .jp-icon-accent3[fill] {
  fill: var(--jp-inverse-layout-color3);
}
.jp-icon-alt .jp-icon-accent4[fill] {
  fill: var(--jp-inverse-layout-color4);
}

.jp-icon-alt .jp-icon-accent0[stroke] {
  stroke: var(--jp-inverse-layout-color0);
}
.jp-icon-alt .jp-icon-accent1[stroke] {
  stroke: var(--jp-inverse-layout-color1);
}
.jp-icon-alt .jp-icon-accent2[stroke] {
  stroke: var(--jp-inverse-layout-color2);
}
.jp-icon-alt .jp-icon-accent3[stroke] {
  stroke: var(--jp-inverse-layout-color3);
}
.jp-icon-alt .jp-icon-accent4[stroke] {
  stroke: var(--jp-inverse-layout-color4);
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-icon-hoverShow:not(:hover) svg {
  display: none !important;
}

/**
 * Support for hover colors for icons as inline SVG HTMLElements
 */

/**
 * regular colors
 */

/* recolor the primary elements of an icon */
.jp-icon-hover :hover .jp-icon0-hover[fill] {
  fill: var(--jp-inverse-layout-color0);
}
.jp-icon-hover :hover .jp-icon1-hover[fill] {
  fill: var(--jp-inverse-layout-color1);
}
.jp-icon-hover :hover .jp-icon2-hover[fill] {
  fill: var(--jp-inverse-layout-color2);
}
.jp-icon-hover :hover .jp-icon3-hover[fill] {
  fill: var(--jp-inverse-layout-color3);
}
.jp-icon-hover :hover .jp-icon4-hover[fill] {
  fill: var(--jp-inverse-layout-color4);
}

.jp-icon-hover :hover .jp-icon0-hover[stroke] {
  stroke: var(--jp-inverse-layout-color0);
}
.jp-icon-hover :hover .jp-icon1-hover[stroke] {
  stroke: var(--jp-inverse-layout-color1);
}
.jp-icon-hover :hover .jp-icon2-hover[stroke] {
  stroke: var(--jp-inverse-layout-color2);
}
.jp-icon-hover :hover .jp-icon3-hover[stroke] {
  stroke: var(--jp-inverse-layout-color3);
}
.jp-icon-hover :hover .jp-icon4-hover[stroke] {
  stroke: var(--jp-inverse-layout-color4);
}

/* recolor the accent elements of an icon */
.jp-icon-hover :hover .jp-icon-accent0-hover[fill] {
  fill: var(--jp-layout-color0);
}
.jp-icon-hover :hover .jp-icon-accent1-hover[fill] {
  fill: var(--jp-layout-color1);
}
.jp-icon-hover :hover .jp-icon-accent2-hover[fill] {
  fill: var(--jp-layout-color2);
}
.jp-icon-hover :hover .jp-icon-accent3-hover[fill] {
  fill: var(--jp-layout-color3);
}
.jp-icon-hover :hover .jp-icon-accent4-hover[fill] {
  fill: var(--jp-layout-color4);
}

.jp-icon-hover :hover .jp-icon-accent0-hover[stroke] {
  stroke: var(--jp-layout-color0);
}
.jp-icon-hover :hover .jp-icon-accent1-hover[stroke] {
  stroke: var(--jp-layout-color1);
}
.jp-icon-hover :hover .jp-icon-accent2-hover[stroke] {
  stroke: var(--jp-layout-color2);
}
.jp-icon-hover :hover .jp-icon-accent3-hover[stroke] {
  stroke: var(--jp-layout-color3);
}
.jp-icon-hover :hover .jp-icon-accent4-hover[stroke] {
  stroke: var(--jp-layout-color4);
}

/* set the color of an icon to transparent */
.jp-icon-hover :hover .jp-icon-none-hover[fill] {
  fill: none;
}

.jp-icon-hover :hover .jp-icon-none-hover[stroke] {
  stroke: none;
}

/**
 * inverse colors
 */

/* inverse recolor the primary elements of an icon */
.jp-icon-hover.jp-icon-alt :hover .jp-icon0-hover[fill] {
  fill: var(--jp-layout-color0);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon1-hover[fill] {
  fill: var(--jp-layout-color1);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon2-hover[fill] {
  fill: var(--jp-layout-color2);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon3-hover[fill] {
  fill: var(--jp-layout-color3);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon4-hover[fill] {
  fill: var(--jp-layout-color4);
}

.jp-icon-hover.jp-icon-alt :hover .jp-icon0-hover[stroke] {
  stroke: var(--jp-layout-color0);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon1-hover[stroke] {
  stroke: var(--jp-layout-color1);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon2-hover[stroke] {
  stroke: var(--jp-layout-color2);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon3-hover[stroke] {
  stroke: var(--jp-layout-color3);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon4-hover[stroke] {
  stroke: var(--jp-layout-color4);
}

/* inverse recolor the accent elements of an icon */
.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent0-hover[fill] {
  fill: var(--jp-inverse-layout-color0);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent1-hover[fill] {
  fill: var(--jp-inverse-layout-color1);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent2-hover[fill] {
  fill: var(--jp-inverse-layout-color2);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent3-hover[fill] {
  fill: var(--jp-inverse-layout-color3);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent4-hover[fill] {
  fill: var(--jp-inverse-layout-color4);
}

.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent0-hover[stroke] {
  stroke: var(--jp-inverse-layout-color0);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent1-hover[stroke] {
  stroke: var(--jp-inverse-layout-color1);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent2-hover[stroke] {
  stroke: var(--jp-inverse-layout-color2);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent3-hover[stroke] {
  stroke: var(--jp-inverse-layout-color3);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent4-hover[stroke] {
  stroke: var(--jp-inverse-layout-color4);
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-switch {
  display: flex;
  align-items: center;
  padding-left: 4px;
  padding-right: 4px;
  font-size: var(--jp-ui-font-size1);
  background-color: transparent;
  color: var(--jp-ui-font-color1);
  border: none;
  height: 20px;
}

.jp-switch:hover {
  background-color: var(--jp-layout-color2);
}

.jp-switch-label {
  margin-right: 5px;
}

.jp-switch-track {
  cursor: pointer;
  background-color: var(--jp-border-color1);
  -webkit-transition: 0.4s;
  transition: 0.4s;
  border-radius: 34px;
  height: 16px;
  width: 35px;
  position: relative;
}

.jp-switch-track::before {
  content: '';
  position: absolute;
  height: 10px;
  width: 10px;
  margin: 3px;
  left: 0px;
  background-color: var(--jp-ui-inverse-font-color1);
  -webkit-transition: 0.4s;
  transition: 0.4s;
  border-radius: 50%;
}

.jp-switch[aria-checked='true'] .jp-switch-track {
  background-color: var(--jp-warn-color0);
}

.jp-switch[aria-checked='true'] .jp-switch-track::before {
  /* track width (35) - margins (3 + 3) - thumb width (10) */
  left: 19px;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/* Sibling imports */

/* Override Blueprint's _reset.scss styles */
html {
  box-sizing: unset;
}

*,
*::before,
*::after {
  box-sizing: unset;
}

body {
  color: unset;
  font-family: var(--jp-ui-font-family);
}

p {
  margin-top: unset;
  margin-bottom: unset;
}

small {
  font-size: unset;
}

strong {
  font-weight: unset;
}

/* Override Blueprint's _typography.scss styles */
a {
  text-decoration: unset;
  color: unset;
}
a:hover {
  text-decoration: unset;
  color: unset;
}

/* Override Blueprint's _accessibility.scss styles */
:focus {
  outline: unset;
  outline-offset: unset;
  -moz-outline-radius: unset;
}

/* Styles for ui-components */
.jp-Button {
  border-radius: var(--jp-border-radius);
  padding: 0px 12px;
  font-size: var(--jp-ui-font-size1);
}

/* Use our own theme for hover styles */
button.jp-Button.bp3-button.bp3-minimal:hover {
  background-color: var(--jp-layout-color2);
}
.jp-Button.minimal {
  color: unset !important;
}

.jp-Button.jp-ToolbarButtonComponent {
  text-transform: none;
}

.jp-InputGroup input {
  box-sizing: border-box;
  border-radius: 0;
  background-color: transparent;
  color: var(--jp-ui-font-color0);
  box-shadow: inset 0 0 0 var(--jp-border-width) var(--jp-input-border-color);
}

.jp-InputGroup input:focus {
  box-shadow: inset 0 0 0 var(--jp-border-width)
      var(--jp-input-active-box-shadow-color),
    inset 0 0 0 3px var(--jp-input-active-box-shadow-color);
}

.jp-InputGroup input::placeholder,
input::placeholder {
  color: var(--jp-ui-font-color3);
}

.jp-BPIcon {
  display: inline-block;
  vertical-align: middle;
  margin: auto;
}

/* Stop blueprint futzing with our icon fills */
.bp3-icon.jp-BPIcon > svg:not([fill]) {
  fill: var(--jp-inverse-layout-color3);
}

.jp-InputGroupAction {
  padding: 6px;
}

.jp-HTMLSelect.jp-DefaultStyle select {
  background-color: initial;
  border: none;
  border-radius: 0;
  box-shadow: none;
  color: var(--jp-ui-font-color0);
  display: block;
  font-size: var(--jp-ui-font-size1);
  height: 24px;
  line-height: 14px;
  padding: 0 25px 0 10px;
  text-align: left;
  -moz-appearance: none;
  -webkit-appearance: none;
}

/* Use our own theme for hover and option styles */
.jp-HTMLSelect.jp-DefaultStyle select:hover,
.jp-HTMLSelect.jp-DefaultStyle select > option {
  background-color: var(--jp-layout-color2);
  color: var(--jp-ui-font-color0);
}
select {
  box-sizing: border-box;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-Collapse {
  display: flex;
  flex-direction: column;
  align-items: stretch;
  border-top: 1px solid var(--jp-border-color2);
  border-bottom: 1px solid var(--jp-border-color2);
}

.jp-Collapse-header {
  padding: 1px 12px;
  color: var(--jp-ui-font-color1);
  background-color: var(--jp-layout-color1);
  font-size: var(--jp-ui-font-size2);
}

.jp-Collapse-header:hover {
  background-color: var(--jp-layout-color2);
}

.jp-Collapse-contents {
  padding: 0px 12px 0px 12px;
  background-color: var(--jp-layout-color1);
  color: var(--jp-ui-font-color1);
  overflow: auto;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Variables
|----------------------------------------------------------------------------*/

:root {
  --jp-private-commandpalette-search-height: 28px;
}

/*-----------------------------------------------------------------------------
| Overall styles
|----------------------------------------------------------------------------*/

.lm-CommandPalette {
  padding-bottom: 0px;
  color: var(--jp-ui-font-color1);
  background: var(--jp-layout-color1);
  /* This is needed so that all font sizing of children done in ems is
   * relative to this base size */
  font-size: var(--jp-ui-font-size1);
}

/*-----------------------------------------------------------------------------
| Modal variant
|----------------------------------------------------------------------------*/

.jp-ModalCommandPalette {
  position: absolute;
  z-index: 10000;
  top: 38px;
  left: 30%;
  margin: 0;
  padding: 4px;
  width: 40%;
  box-shadow: var(--jp-elevation-z4);
  border-radius: 4px;
  background: var(--jp-layout-color0);
}

.jp-ModalCommandPalette .lm-CommandPalette {
  max-height: 40vh;
}

.jp-ModalCommandPalette .lm-CommandPalette .lm-close-icon::after {
  display: none;
}

.jp-ModalCommandPalette .lm-CommandPalette .lm-CommandPalette-header {
  display: none;
}

.jp-ModalCommandPalette .lm-CommandPalette .lm-CommandPalette-item {
  margin-left: 4px;
  margin-right: 4px;
}

.jp-ModalCommandPalette
  .lm-CommandPalette
  .lm-CommandPalette-item.lm-mod-disabled {
  display: none;
}

/*-----------------------------------------------------------------------------
| Search
|----------------------------------------------------------------------------*/

.lm-CommandPalette-search {
  padding: 4px;
  background-color: var(--jp-layout-color1);
  z-index: 2;
}

.lm-CommandPalette-wrapper {
  overflow: overlay;
  padding: 0px 9px;
  background-color: var(--jp-input-active-background);
  height: 30px;
  box-shadow: inset 0 0 0 var(--jp-border-width) var(--jp-input-border-color);
}

.lm-CommandPalette.lm-mod-focused .lm-CommandPalette-wrapper {
  box-shadow: inset 0 0 0 1px var(--jp-input-active-box-shadow-color),
    inset 0 0 0 3px var(--jp-input-active-box-shadow-color);
}

.jp-SearchIconGroup {
  color: white;
  background-color: var(--jp-brand-color1);
  position: absolute;
  top: 4px;
  right: 4px;
  padding: 5px 5px 1px 5px;
}

.jp-SearchIconGroup svg {
  height: 20px;
  width: 20px;
}

.jp-SearchIconGroup .jp-icon3[fill] {
  fill: var(--jp-layout-color0);
}

.lm-CommandPalette-input {
  background: transparent;
  width: calc(100% - 18px);
  float: left;
  border: none;
  outline: none;
  font-size: var(--jp-ui-font-size1);
  color: var(--jp-ui-font-color0);
  line-height: var(--jp-private-commandpalette-search-height);
}

.lm-CommandPalette-input::-webkit-input-placeholder,
.lm-CommandPalette-input::-moz-placeholder,
.lm-CommandPalette-input:-ms-input-placeholder {
  color: var(--jp-ui-font-color2);
  font-size: var(--jp-ui-font-size1);
}

/*-----------------------------------------------------------------------------
| Results
|----------------------------------------------------------------------------*/

.lm-CommandPalette-header:first-child {
  margin-top: 0px;
}

.lm-CommandPalette-header {
  border-bottom: solid var(--jp-border-width) var(--jp-border-color2);
  color: var(--jp-ui-font-color1);
  cursor: pointer;
  display: flex;
  font-size: var(--jp-ui-font-size0);
  font-weight: 600;
  letter-spacing: 1px;
  margin-top: 8px;
  padding: 8px 0 8px 12px;
  text-transform: uppercase;
}

.lm-CommandPalette-header.lm-mod-active {
  background: var(--jp-layout-color2);
}

.lm-CommandPalette-header > mark {
  background-color: transparent;
  font-weight: bold;
  color: var(--jp-ui-font-color1);
}

.lm-CommandPalette-item {
  padding: 4px 12px 4px 4px;
  color: var(--jp-ui-font-color1);
  font-size: var(--jp-ui-font-size1);
  font-weight: 400;
  display: flex;
}

.lm-CommandPalette-item.lm-mod-disabled {
  color: var(--jp-ui-font-color2);
}

.lm-CommandPalette-item.lm-mod-active {
  color: var(--jp-ui-inverse-font-color1);
  background: var(--jp-brand-color1);
}

.lm-CommandPalette-item.lm-mod-active .lm-CommandPalette-itemLabel > mark {
  color: var(--jp-ui-inverse-font-color0);
}

.lm-CommandPalette-item.lm-mod-active .jp-icon-selectable[fill] {
  fill: var(--jp-layout-color0);
}

.lm-CommandPalette-item.lm-mod-active .lm-CommandPalette-itemLabel > mark {
  color: var(--jp-ui-inverse-font-color0);
}

.lm-CommandPalette-item.lm-mod-active:hover:not(.lm-mod-disabled) {
  color: var(--jp-ui-inverse-font-color1);
  background: var(--jp-brand-color1);
}

.lm-CommandPalette-item:hover:not(.lm-mod-active):not(.lm-mod-disabled) {
  background: var(--jp-layout-color2);
}

.lm-CommandPalette-itemContent {
  overflow: hidden;
}

.lm-CommandPalette-itemLabel > mark {
  color: var(--jp-ui-font-color0);
  background-color: transparent;
  font-weight: bold;
}

.lm-CommandPalette-item.lm-mod-disabled mark {
  color: var(--jp-ui-font-color2);
}

.lm-CommandPalette-item .lm-CommandPalette-itemIcon {
  margin: 0 4px 0 0;
  position: relative;
  width: 16px;
  top: 2px;
  flex: 0 0 auto;
}

.lm-CommandPalette-item.lm-mod-disabled .lm-CommandPalette-itemIcon {
  opacity: 0.6;
}

.lm-CommandPalette-item .lm-CommandPalette-itemShortcut {
  flex: 0 0 auto;
}

.lm-CommandPalette-itemCaption {
  display: none;
}

.lm-CommandPalette-content {
  background-color: var(--jp-layout-color1);
}

.lm-CommandPalette-content:empty:after {
  content: 'No results';
  margin: auto;
  margin-top: 20px;
  width: 100px;
  display: block;
  font-size: var(--jp-ui-font-size2);
  font-family: var(--jp-ui-font-family);
  font-weight: lighter;
}

.lm-CommandPalette-emptyMessage {
  text-align: center;
  margin-top: 24px;
  line-height: 1.32;
  padding: 0px 8px;
  color: var(--jp-content-font-color3);
}

/*-----------------------------------------------------------------------------
| Copyright (c) 2014-2017, Jupyter Development Team.
|
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-Dialog {
  position: absolute;
  z-index: 10000;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  top: 0px;
  left: 0px;
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  background: var(--jp-dialog-background);
}

.jp-Dialog-content {
  display: flex;
  flex-direction: column;
  margin-left: auto;
  margin-right: auto;
  background: var(--jp-layout-color1);
  padding: 24px;
  padding-bottom: 12px;
  min-width: 300px;
  min-height: 150px;
  max-width: 1000px;
  max-height: 500px;
  box-sizing: border-box;
  box-shadow: var(--jp-elevation-z20);
  word-wrap: break-word;
  border-radius: var(--jp-border-radius);
  /* This is needed so that all font sizing of children done in ems is
   * relative to this base size */
  font-size: var(--jp-ui-font-size1);
  color: var(--jp-ui-font-color1);
  resize: both;
}

.jp-Dialog-button {
  overflow: visible;
}

button.jp-Dialog-button:focus {
  outline: 1px solid var(--jp-brand-color1);
  outline-offset: 4px;
  -moz-outline-radius: 0px;
}

button.jp-Dialog-button:focus::-moz-focus-inner {
  border: 0;
}

button.jp-Dialog-close-button {
  padding: 0;
  height: 100%;
  min-width: unset;
  min-height: unset;
}

.jp-Dialog-header {
  display: flex;
  justify-content: space-between;
  flex: 0 0 auto;
  padding-bottom: 12px;
  font-size: var(--jp-ui-font-size3);
  font-weight: 400;
  color: var(--jp-ui-font-color0);
}

.jp-Dialog-body {
  display: flex;
  flex-direction: column;
  flex: 1 1 auto;
  font-size: var(--jp-ui-font-size1);
  background: var(--jp-layout-color1);
  overflow: auto;
}

.jp-Dialog-footer {
  display: flex;
  flex-direction: row;
  justify-content: flex-end;
  flex: 0 0 auto;
  margin-left: -12px;
  margin-right: -12px;
  padding: 12px;
}

.jp-Dialog-title {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.jp-Dialog-body > .jp-select-wrapper {
  width: 100%;
}

.jp-Dialog-body > button {
  padding: 0px 16px;
}

.jp-Dialog-body > label {
  line-height: 1.4;
  color: var(--jp-ui-font-color0);
}

.jp-Dialog-button.jp-mod-styled:not(:last-child) {
  margin-right: 12px;
}

/*-----------------------------------------------------------------------------
| Copyright (c) 2014-2016, Jupyter Development Team.
|
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-HoverBox {
  position: fixed;
}

.jp-HoverBox.jp-mod-outofview {
  display: none;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-IFrame {
  width: 100%;
  height: 100%;
}

.jp-IFrame > iframe {
  border: none;
}

/*
When drag events occur, `p-mod-override-cursor` is added to the body.
Because iframes steal all cursor events, the following two rules are necessary
to suppress pointer events while resize drags are occurring. There may be a
better solution to this problem.
*/
body.lm-mod-override-cursor .jp-IFrame {
  position: relative;
}

body.lm-mod-override-cursor .jp-IFrame:before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: transparent;
}

.jp-Input-Boolean-Dialog {
  flex-direction: row-reverse;
  align-items: end;
  width: 100%;
}

.jp-Input-Boolean-Dialog > label {
  flex: 1 1 auto;
}

/*-----------------------------------------------------------------------------
| Copyright (c) 2014-2016, Jupyter Development Team.
|
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-MainAreaWidget > :focus {
  outline: none;
}

/**
 * google-material-color v1.2.6
 * https://github.com/danlevan/google-material-color
 */
:root {
  --md-red-50: #ffebee;
  --md-red-100: #ffcdd2;
  --md-red-200: #ef9a9a;
  --md-red-300: #e57373;
  --md-red-400: #ef5350;
  --md-red-500: #f44336;
  --md-red-600: #e53935;
  --md-red-700: #d32f2f;
  --md-red-800: #c62828;
  --md-red-900: #b71c1c;
  --md-red-A100: #ff8a80;
  --md-red-A200: #ff5252;
  --md-red-A400: #ff1744;
  --md-red-A700: #d50000;

  --md-pink-50: #fce4ec;
  --md-pink-100: #f8bbd0;
  --md-pink-200: #f48fb1;
  --md-pink-300: #f06292;
  --md-pink-400: #ec407a;
  --md-pink-500: #e91e63;
  --md-pink-600: #d81b60;
  --md-pink-700: #c2185b;
  --md-pink-800: #ad1457;
  --md-pink-900: #880e4f;
  --md-pink-A100: #ff80ab;
  --md-pink-A200: #ff4081;
  --md-pink-A400: #f50057;
  --md-pink-A700: #c51162;

  --md-purple-50: #f3e5f5;
  --md-purple-100: #e1bee7;
  --md-purple-200: #ce93d8;
  --md-purple-300: #ba68c8;
  --md-purple-400: #ab47bc;
  --md-purple-500: #9c27b0;
  --md-purple-600: #8e24aa;
  --md-purple-700: #7b1fa2;
  --md-purple-800: #6a1b9a;
  --md-purple-900: #4a148c;
  --md-purple-A100: #ea80fc;
  --md-purple-A200: #e040fb;
  --md-purple-A400: #d500f9;
  --md-purple-A700: #aa00ff;

  --md-deep-purple-50: #ede7f6;
  --md-deep-purple-100: #d1c4e9;
  --md-deep-purple-200: #b39ddb;
  --md-deep-purple-300: #9575cd;
  --md-deep-purple-400: #7e57c2;
  --md-deep-purple-500: #673ab7;
  --md-deep-purple-600: #5e35b1;
  --md-deep-purple-700: #512da8;
  --md-deep-purple-800: #4527a0;
  --md-deep-purple-900: #311b92;
  --md-deep-purple-A100: #b388ff;
  --md-deep-purple-A200: #7c4dff;
  --md-deep-purple-A400: #651fff;
  --md-deep-purple-A700: #6200ea;

  --md-indigo-50: #e8eaf6;
  --md-indigo-100: #c5cae9;
  --md-indigo-200: #9fa8da;
  --md-indigo-300: #7986cb;
  --md-indigo-400: #5c6bc0;
  --md-indigo-500: #3f51b5;
  --md-indigo-600: #3949ab;
  --md-indigo-700: #303f9f;
  --md-indigo-800: #283593;
  --md-indigo-900: #1a237e;
  --md-indigo-A100: #8c9eff;
  --md-indigo-A200: #536dfe;
  --md-indigo-A400: #3d5afe;
  --md-indigo-A700: #304ffe;

  --md-blue-50: #e3f2fd;
  --md-blue-100: #bbdefb;
  --md-blue-200: #90caf9;
  --md-blue-300: #64b5f6;
  --md-blue-400: #42a5f5;
  --md-blue-500: #2196f3;
  --md-blue-600: #1e88e5;
  --md-blue-700: #1976d2;
  --md-blue-800: #1565c0;
  --md-blue-900: #0d47a1;
  --md-blue-A100: #82b1ff;
  --md-blue-A200: #448aff;
  --md-blue-A400: #2979ff;
  --md-blue-A700: #2962ff;

  --md-light-blue-50: #e1f5fe;
  --md-light-blue-100: #b3e5fc;
  --md-light-blue-200: #81d4fa;
  --md-light-blue-300: #4fc3f7;
  --md-light-blue-400: #29b6f6;
  --md-light-blue-500: #03a9f4;
  --md-light-blue-600: #039be5;
  --md-light-blue-700: #0288d1;
  --md-light-blue-800: #0277bd;
  --md-light-blue-900: #01579b;
  --md-light-blue-A100: #80d8ff;
  --md-light-blue-A200: #40c4ff;
  --md-light-blue-A400: #00b0ff;
  --md-light-blue-A700: #0091ea;

  --md-cyan-50: #e0f7fa;
  --md-cyan-100: #b2ebf2;
  --md-cyan-200: #80deea;
  --md-cyan-300: #4dd0e1;
  --md-cyan-400: #26c6da;
  --md-cyan-500: #00bcd4;
  --md-cyan-600: #00acc1;
  --md-cyan-700: #0097a7;
  --md-cyan-800: #00838f;
  --md-cyan-900: #006064;
  --md-cyan-A100: #84ffff;
  --md-cyan-A200: #18ffff;
  --md-cyan-A400: #00e5ff;
  --md-cyan-A700: #00b8d4;

  --md-teal-50: #e0f2f1;
  --md-teal-100: #b2dfdb;
  --md-teal-200: #80cbc4;
  --md-teal-300: #4db6ac;
  --md-teal-400: #26a69a;
  --md-teal-500: #009688;
  --md-teal-600: #00897b;
  --md-teal-700: #00796b;
  --md-teal-800: #00695c;
  --md-teal-900: #004d40;
  --md-teal-A100: #a7ffeb;
  --md-teal-A200: #64ffda;
  --md-teal-A400: #1de9b6;
  --md-teal-A700: #00bfa5;

  --md-green-50: #e8f5e9;
  --md-green-100: #c8e6c9;
  --md-green-200: #a5d6a7;
  --md-green-300: #81c784;
  --md-green-400: #66bb6a;
  --md-green-500: #4caf50;
  --md-green-600: #43a047;
  --md-green-700: #388e3c;
  --md-green-800: #2e7d32;
  --md-green-900: #1b5e20;
  --md-green-A100: #b9f6ca;
  --md-green-A200: #69f0ae;
  --md-green-A400: #00e676;
  --md-green-A700: #00c853;

  --md-light-green-50: #f1f8e9;
  --md-light-green-100: #dcedc8;
  --md-light-green-200: #c5e1a5;
  --md-light-green-300: #aed581;
  --md-light-green-400: #9ccc65;
  --md-light-green-500: #8bc34a;
  --md-light-green-600: #7cb342;
  --md-light-green-700: #689f38;
  --md-light-green-800: #558b2f;
  --md-light-green-900: #33691e;
  --md-light-green-A100: #ccff90;
  --md-light-green-A200: #b2ff59;
  --md-light-green-A400: #76ff03;
  --md-light-green-A700: #64dd17;

  --md-lime-50: #f9fbe7;
  --md-lime-100: #f0f4c3;
  --md-lime-200: #e6ee9c;
  --md-lime-300: #dce775;
  --md-lime-400: #d4e157;
  --md-lime-500: #cddc39;
  --md-lime-600: #c0ca33;
  --md-lime-700: #afb42b;
  --md-lime-800: #9e9d24;
  --md-lime-900: #827717;
  --md-lime-A100: #f4ff81;
  --md-lime-A200: #eeff41;
  --md-lime-A400: #c6ff00;
  --md-lime-A700: #aeea00;

  --md-yellow-50: #fffde7;
  --md-yellow-100: #fff9c4;
  --md-yellow-200: #fff59d;
  --md-yellow-300: #fff176;
  --md-yellow-400: #ffee58;
  --md-yellow-500: #ffeb3b;
  --md-yellow-600: #fdd835;
  --md-yellow-700: #fbc02d;
  --md-yellow-800: #f9a825;
  --md-yellow-900: #f57f17;
  --md-yellow-A100: #ffff8d;
  --md-yellow-A200: #ffff00;
  --md-yellow-A400: #ffea00;
  --md-yellow-A700: #ffd600;

  --md-amber-50: #fff8e1;
  --md-amber-100: #ffecb3;
  --md-amber-200: #ffe082;
  --md-amber-300: #ffd54f;
  --md-amber-400: #ffca28;
  --md-amber-500: #ffc107;
  --md-amber-600: #ffb300;
  --md-amber-700: #ffa000;
  --md-amber-800: #ff8f00;
  --md-amber-900: #ff6f00;
  --md-amber-A100: #ffe57f;
  --md-amber-A200: #ffd740;
  --md-amber-A400: #ffc400;
  --md-amber-A700: #ffab00;

  --md-orange-50: #fff3e0;
  --md-orange-100: #ffe0b2;
  --md-orange-200: #ffcc80;
  --md-orange-300: #ffb74d;
  --md-orange-400: #ffa726;
  --md-orange-500: #ff9800;
  --md-orange-600: #fb8c00;
  --md-orange-700: #f57c00;
  --md-orange-800: #ef6c00;
  --md-orange-900: #e65100;
  --md-orange-A100: #ffd180;
  --md-orange-A200: #ffab40;
  --md-orange-A400: #ff9100;
  --md-orange-A700: #ff6d00;

  --md-deep-orange-50: #fbe9e7;
  --md-deep-orange-100: #ffccbc;
  --md-deep-orange-200: #ffab91;
  --md-deep-orange-300: #ff8a65;
  --md-deep-orange-400: #ff7043;
  --md-deep-orange-500: #ff5722;
  --md-deep-orange-600: #f4511e;
  --md-deep-orange-700: #e64a19;
  --md-deep-orange-800: #d84315;
  --md-deep-orange-900: #bf360c;
  --md-deep-orange-A100: #ff9e80;
  --md-deep-orange-A200: #ff6e40;
  --md-deep-orange-A400: #ff3d00;
  --md-deep-orange-A700: #dd2c00;

  --md-brown-50: #efebe9;
  --md-brown-100: #d7ccc8;
  --md-brown-200: #bcaaa4;
  --md-brown-300: #a1887f;
  --md-brown-400: #8d6e63;
  --md-brown-500: #795548;
  --md-brown-600: #6d4c41;
  --md-brown-700: #5d4037;
  --md-brown-800: #4e342e;
  --md-brown-900: #3e2723;

  --md-grey-50: #fafafa;
  --md-grey-100: #f5f5f5;
  --md-grey-200: #eeeeee;
  --md-grey-300: #e0e0e0;
  --md-grey-400: #bdbdbd;
  --md-grey-500: #9e9e9e;
  --md-grey-600: #757575;
  --md-grey-700: #616161;
  --md-grey-800: #424242;
  --md-grey-900: #212121;

  --md-blue-grey-50: #eceff1;
  --md-blue-grey-100: #cfd8dc;
  --md-blue-grey-200: #b0bec5;
  --md-blue-grey-300: #90a4ae;
  --md-blue-grey-400: #78909c;
  --md-blue-grey-500: #607d8b;
  --md-blue-grey-600: #546e7a;
  --md-blue-grey-700: #455a64;
  --md-blue-grey-800: #37474f;
  --md-blue-grey-900: #263238;
}

/*-----------------------------------------------------------------------------
| Copyright (c) 2017, Jupyter Development Team.
|
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-Spinner {
  position: absolute;
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 10;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: var(--jp-layout-color0);
  outline: none;
}

.jp-SpinnerContent {
  font-size: 10px;
  margin: 50px auto;
  text-indent: -9999em;
  width: 3em;
  height: 3em;
  border-radius: 50%;
  background: var(--jp-brand-color3);
  background: linear-gradient(
    to right,
    #f37626 10%,
    rgba(255, 255, 255, 0) 42%
  );
  position: relative;
  animation: load3 1s infinite linear, fadeIn 1s;
}

.jp-SpinnerContent:before {
  width: 50%;
  height: 50%;
  background: #f37626;
  border-radius: 100% 0 0 0;
  position: absolute;
  top: 0;
  left: 0;
  content: '';
}

.jp-SpinnerContent:after {
  background: var(--jp-layout-color0);
  width: 75%;
  height: 75%;
  border-radius: 50%;
  content: '';
  margin: auto;
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
}

@keyframes fadeIn {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}

@keyframes load3 {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

/*-----------------------------------------------------------------------------
| Copyright (c) 2014-2017, Jupyter Development Team.
|
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

button.jp-mod-styled {
  font-size: var(--jp-ui-font-size1);
  color: var(--jp-ui-font-color0);
  border: none;
  box-sizing: border-box;
  text-align: center;
  line-height: 32px;
  height: 32px;
  padding: 0px 12px;
  letter-spacing: 0.8px;
  outline: none;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
}

input.jp-mod-styled {
  background: var(--jp-input-background);
  height: 28px;
  box-sizing: border-box;
  border: var(--jp-border-width) solid var(--jp-border-color1);
  padding-left: 7px;
  padding-right: 7px;
  font-size: var(--jp-ui-font-size2);
  color: var(--jp-ui-font-color0);
  outline: none;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
}

input[type='checkbox'].jp-mod-styled {
  appearance: checkbox;
  -webkit-appearance: checkbox;
  -moz-appearance: checkbox;
  height: auto;
}

input.jp-mod-styled:focus {
  border: var(--jp-border-width) solid var(--md-blue-500);
  box-shadow: inset 0 0 4px var(--md-blue-300);
}

.jp-FileDialog-Checkbox {
  margin-top: 35px;
  display: flex;
  flex-direction: row;
  align-items: end;
  width: 100%;
}

.jp-FileDialog-Checkbox > label {
  flex: 1 1 auto;
}

.jp-select-wrapper {
  display: flex;
  position: relative;
  flex-direction: column;
  padding: 1px;
  background-color: var(--jp-layout-color1);
  height: 28px;
  box-sizing: border-box;
  margin-bottom: 12px;
}

.jp-select-wrapper.jp-mod-focused select.jp-mod-styled {
  border: var(--jp-border-width) solid var(--jp-input-active-border-color);
  box-shadow: var(--jp-input-box-shadow);
  background-color: var(--jp-input-active-background);
}

select.jp-mod-styled:hover {
  background-color: var(--jp-layout-color1);
  cursor: pointer;
  color: var(--jp-ui-font-color0);
  background-color: var(--jp-input-hover-background);
  box-shadow: inset 0 0px 1px rgba(0, 0, 0, 0.5);
}

select.jp-mod-styled {
  flex: 1 1 auto;
  height: 32px;
  width: 100%;
  font-size: var(--jp-ui-font-size2);
  background: var(--jp-input-background);
  color: var(--jp-ui-font-color0);
  padding: 0 25px 0 8px;
  border: var(--jp-border-width) solid var(--jp-input-border-color);
  border-radius: 0px;
  outline: none;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
}

/*-----------------------------------------------------------------------------
| Copyright (c) 2014-2016, Jupyter Development Team.
|
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

:root {
  --jp-private-toolbar-height: calc(
    28px + var(--jp-border-width)
  ); /* leave 28px for content */
}

.jp-Toolbar {
  color: var(--jp-ui-font-color1);
  flex: 0 0 auto;
  display: flex;
  flex-direction: row;
  border-bottom: var(--jp-border-width) solid var(--jp-toolbar-border-color);
  box-shadow: var(--jp-toolbar-box-shadow);
  background: var(--jp-toolbar-background);
  min-height: var(--jp-toolbar-micro-height);
  padding: 2px;
  z-index: 1;
  overflow-x: auto;
}

/* Toolbar items */

.jp-Toolbar > .jp-Toolbar-item.jp-Toolbar-spacer {
  flex-grow: 1;
  flex-shrink: 1;
}

.jp-Toolbar-item.jp-Toolbar-kernelStatus {
  display: inline-block;
  width: 32px;
  background-repeat: no-repeat;
  background-position: center;
  background-size: 16px;
}

.jp-Toolbar > .jp-Toolbar-item {
  flex: 0 0 auto;
  display: flex;
  padding-left: 1px;
  padding-right: 1px;
  font-size: var(--jp-ui-font-size1);
  line-height: var(--jp-private-toolbar-height);
  height: 100%;
}

/* Toolbar buttons */

/* This is the div we use to wrap the react component into a Widget */
div.jp-ToolbarButton {
  color: transparent;
  border: none;
  box-sizing: border-box;
  outline: none;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  padding: 0px;
  margin: 0px;
}

button.jp-ToolbarButtonComponent {
  background: var(--jp-layout-color1);
  border: none;
  box-sizing: border-box;
  outline: none;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  padding: 0px 6px;
  margin: 0px;
  height: 24px;
  border-radius: var(--jp-border-radius);
  display: flex;
  align-items: center;
  text-align: center;
  font-size: 14px;
  min-width: unset;
  min-height: unset;
}

button.jp-ToolbarButtonComponent:disabled {
  opacity: 0.4;
}

button.jp-ToolbarButtonComponent span {
  padding: 0px;
  flex: 0 0 auto;
}

button.jp-ToolbarButtonComponent .jp-ToolbarButtonComponent-label {
  font-size: var(--jp-ui-font-size1);
  line-height: 100%;
  padding-left: 2px;
  color: var(--jp-ui-font-color1);
}

#jp-main-dock-panel[data-mode='single-document']
  .jp-MainAreaWidget
  > .jp-Toolbar.jp-Toolbar-micro {
  padding: 0;
  min-height: 0;
}

#jp-main-dock-panel[data-mode='single-document']
  .jp-MainAreaWidget
  > .jp-Toolbar {
  border: none;
  box-shadow: none;
}

/*-----------------------------------------------------------------------------
| Copyright (c) 2014-2017, Jupyter Development Team.
|
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/


/* <DEPRECATED> */ body.p-mod-override-cursor *, /* </DEPRECATED> */
body.lm-mod-override-cursor * {
  cursor: inherit !important;
}

/*-----------------------------------------------------------------------------
| Copyright (c) 2014-2016, Jupyter Development Team.
|
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-JSONEditor {
  display: flex;
  flex-direction: column;
  width: 100%;
}

.jp-JSONEditor-host {
  flex: 1 1 auto;
  border: var(--jp-border-width) solid var(--jp-input-border-color);
  border-radius: 0px;
  background: var(--jp-layout-color0);
  min-height: 50px;
  padding: 1px;
}

.jp-JSONEditor.jp-mod-error .jp-JSONEditor-host {
  border-color: red;
  outline-color: red;
}

.jp-JSONEditor-header {
  display: flex;
  flex: 1 0 auto;
  padding: 0 0 0 12px;
}

.jp-JSONEditor-header label {
  flex: 0 0 auto;
}

.jp-JSONEditor-commitButton {
  height: 16px;
  width: 16px;
  background-size: 18px;
  background-repeat: no-repeat;
  background-position: center;
}

.jp-JSONEditor-host.jp-mod-focused {
  background-color: var(--jp-input-active-background);
  border: 1px solid var(--jp-input-active-border-color);
  box-shadow: var(--jp-input-box-shadow);
}

.jp-Editor.jp-mod-dropTarget {
  border: var(--jp-border-width) solid var(--jp-input-active-border-color);
  box-shadow: var(--jp-input-box-shadow);
}

/* BASICS */

.CodeMirror {
  /* Set height, width, borders, and global font properties here */
  font-family: monospace;
  height: 300px;
  color: black;
  direction: ltr;
}

/* PADDING */

.CodeMirror-lines {
  padding: 4px 0; /* Vertical padding around content */
}
.CodeMirror pre.CodeMirror-line,
.CodeMirror pre.CodeMirror-line-like {
  padding: 0 4px; /* Horizontal padding of content */
}

.CodeMirror-scrollbar-filler, .CodeMirror-gutter-filler {
  background-color: white; /* The little square between H and V scrollbars */
}

/* GUTTER */

.CodeMirror-gutters {
  border-right: 1px solid #ddd;
  background-color: #f7f7f7;
  white-space: nowrap;
}
.CodeMirror-linenumbers {}
.CodeMirror-linenumber {
  padding: 0 3px 0 5px;
  min-width: 20px;
  text-align: right;
  color: #999;
  white-space: nowrap;
}

.CodeMirror-guttermarker { color: black; }
.CodeMirror-guttermarker-subtle { color: #999; }

/* CURSOR */

.CodeMirror-cursor {
  border-left: 1px solid black;
  border-right: none;
  width: 0;
}
/* Shown when moving in bi-directional text */
.CodeMirror div.CodeMirror-secondarycursor {
  border-left: 1px solid silver;
}
.cm-fat-cursor .CodeMirror-cursor {
  width: auto;
  border: 0 !important;
  background: #7e7;
}
.cm-fat-cursor div.CodeMirror-cursors {
  z-index: 1;
}
.cm-fat-cursor-mark {
  background-color: rgba(20, 255, 20, 0.5);
  -webkit-animation: blink 1.06s steps(1) infinite;
  -moz-animation: blink 1.06s steps(1) infinite;
  animation: blink 1.06s steps(1) infinite;
}
.cm-animate-fat-cursor {
  width: auto;
  border: 0;
  -webkit-animation: blink 1.06s steps(1) infinite;
  -moz-animation: blink 1.06s steps(1) infinite;
  animation: blink 1.06s steps(1) infinite;
  background-color: #7e7;
}
@-moz-keyframes blink {
  0% {}
  50% { background-color: transparent; }
  100% {}
}
@-webkit-keyframes blink {
  0% {}
  50% { background-color: transparent; }
  100% {}
}
@keyframes blink {
  0% {}
  50% { background-color: transparent; }
  100% {}
}

/* Can style cursor different in overwrite (non-insert) mode */
.CodeMirror-overwrite .CodeMirror-cursor {}

.cm-tab { display: inline-block; text-decoration: inherit; }

.CodeMirror-rulers {
  position: absolute;
  left: 0; right: 0; top: -50px; bottom: 0;
  overflow: hidden;
}
.CodeMirror-ruler {
  border-left: 1px solid #ccc;
  top: 0; bottom: 0;
  position: absolute;
}

/* DEFAULT THEME */

.cm-s-default .cm-header {color: blue;}
.cm-s-default .cm-quote {color: #090;}
.cm-negative {color: #d44;}
.cm-positive {color: #292;}
.cm-header, .cm-strong {font-weight: bold;}
.cm-em {font-style: italic;}
.cm-link {text-decoration: underline;}
.cm-strikethrough {text-decoration: line-through;}

.cm-s-default .cm-keyword {color: #708;}
.cm-s-default .cm-atom {color: #219;}
.cm-s-default .cm-number {color: #164;}
.cm-s-default .cm-def {color: #00f;}
.cm-s-default .cm-variable,
.cm-s-default .cm-punctuation,
.cm-s-default .cm-property,
.cm-s-default .cm-operator {}
.cm-s-default .cm-variable-2 {color: #05a;}
.cm-s-default .cm-variable-3, .cm-s-default .cm-type {color: #085;}
.cm-s-default .cm-comment {color: #a50;}
.cm-s-default .cm-string {color: #a11;}
.cm-s-default .cm-string-2 {color: #f50;}
.cm-s-default .cm-meta {color: #555;}
.cm-s-default .cm-qualifier {color: #555;}
.cm-s-default .cm-builtin {color: #30a;}
.cm-s-default .cm-bracket {color: #997;}
.cm-s-default .cm-tag {color: #170;}
.cm-s-default .cm-attribute {color: #00c;}
.cm-s-default .cm-hr {color: #999;}
.cm-s-default .cm-link {color: #00c;}

.cm-s-default .cm-error {color: #f00;}
.cm-invalidchar {color: #f00;}

.CodeMirror-composing { border-bottom: 2px solid; }

/* Default styles for common addons */

div.CodeMirror span.CodeMirror-matchingbracket {color: #0b0;}
div.CodeMirror span.CodeMirror-nonmatchingbracket {color: #a22;}
.CodeMirror-matchingtag { background: rgba(255, 150, 0, .3); }
.CodeMirror-activeline-background {background: #e8f2ff;}

/* STOP */

/* The rest of this file contains styles related to the mechanics of
   the editor. You probably shouldn't touch them. */

.CodeMirror {
  position: relative;
  overflow: hidden;
  background: white;
}

.CodeMirror-scroll {
  overflow: scroll !important; /* Things will break if this is overridden */
  /* 50px is the magic margin used to hide the element's real scrollbars */
  /* See overflow: hidden in .CodeMirror */
  margin-bottom: -50px; margin-right: -50px;
  padding-bottom: 50px;
  height: 100%;
  outline: none; /* Prevent dragging from highlighting the element */
  position: relative;
}
.CodeMirror-sizer {
  position: relative;
  border-right: 50px solid transparent;
}

/* The fake, visible scrollbars. Used to force redraw during scrolling
   before actual scrolling happens, thus preventing shaking and
   flickering artifacts. */
.CodeMirror-vscrollbar, .CodeMirror-hscrollbar, .CodeMirror-scrollbar-filler, .CodeMirror-gutter-filler {
  position: absolute;
  z-index: 6;
  display: none;
  outline: none;
}
.CodeMirror-vscrollbar {
  right: 0; top: 0;
  overflow-x: hidden;
  overflow-y: scroll;
}
.CodeMirror-hscrollbar {
  bottom: 0; left: 0;
  overflow-y: hidden;
  overflow-x: scroll;
}
.CodeMirror-scrollbar-filler {
  right: 0; bottom: 0;
}
.CodeMirror-gutter-filler {
  left: 0; bottom: 0;
}

.CodeMirror-gutters {
  position: absolute; left: 0; top: 0;
  min-height: 100%;
  z-index: 3;
}
.CodeMirror-gutter {
  white-space: normal;
  height: 100%;
  display: inline-block;
  vertical-align: top;
  margin-bottom: -50px;
}
.CodeMirror-gutter-wrapper {
  position: absolute;
  z-index: 4;
  background: none !important;
  border: none !important;
}
.CodeMirror-gutter-background {
  position: absolute;
  top: 0; bottom: 0;
  z-index: 4;
}
.CodeMirror-gutter-elt {
  position: absolute;
  cursor: default;
  z-index: 4;
}
.CodeMirror-gutter-wrapper ::selection { background-color: transparent }
.CodeMirror-gutter-wrapper ::-moz-selection { background-color: transparent }

.CodeMirror-lines {
  cursor: text;
  min-height: 1px; /* prevents collapsing before first draw */
}
.CodeMirror pre.CodeMirror-line,
.CodeMirror pre.CodeMirror-line-like {
  /* Reset some styles that the rest of the page might have set */
  -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0;
  border-width: 0;
  background: transparent;
  font-family: inherit;
  font-size: inherit;
  margin: 0;
  white-space: pre;
  word-wrap: normal;
  line-height: inherit;
  color: inherit;
  z-index: 2;
  position: relative;
  overflow: visible;
  -webkit-tap-highlight-color: transparent;
  -webkit-font-variant-ligatures: contextual;
  font-variant-ligatures: contextual;
}
.CodeMirror-wrap pre.CodeMirror-line,
.CodeMirror-wrap pre.CodeMirror-line-like {
  word-wrap: break-word;
  white-space: pre-wrap;
  word-break: normal;
}

.CodeMirror-linebackground {
  position: absolute;
  left: 0; right: 0; top: 0; bottom: 0;
  z-index: 0;
}

.CodeMirror-linewidget {
  position: relative;
  z-index: 2;
  padding: 0.1px; /* Force widget margins to stay inside of the container */
}

.CodeMirror-widget {}

.CodeMirror-rtl pre { direction: rtl; }

.CodeMirror-code {
  outline: none;
}

/* Force content-box sizing for the elements where we expect it */
.CodeMirror-scroll,
.CodeMirror-sizer,
.CodeMirror-gutter,
.CodeMirror-gutters,
.CodeMirror-linenumber {
  -moz-box-sizing: content-box;
  box-sizing: content-box;
}

.CodeMirror-measure {
  position: absolute;
  width: 100%;
  height: 0;
  overflow: hidden;
  visibility: hidden;
}

.CodeMirror-cursor {
  position: absolute;
  pointer-events: none;
}
.CodeMirror-measure pre { position: static; }

div.CodeMirror-cursors {
  visibility: hidden;
  position: relative;
  z-index: 3;
}
div.CodeMirror-dragcursors {
  visibility: visible;
}

.CodeMirror-focused div.CodeMirror-cursors {
  visibility: visible;
}

.CodeMirror-selected { background: #d9d9d9; }
.CodeMirror-focused .CodeMirror-selected { background: #d7d4f0; }
.CodeMirror-crosshair { cursor: crosshair; }
.CodeMirror-line::selection, .CodeMirror-line > span::selection, .CodeMirror-line > span > span::selection { background: #d7d4f0; }
.CodeMirror-line::-moz-selection, .CodeMirror-line > span::-moz-selection, .CodeMirror-line > span > span::-moz-selection { background: #d7d4f0; }

.cm-searching {
  background-color: #ffa;
  background-color: rgba(255, 255, 0, .4);
}

/* Used to force a border model for a node */
.cm-force-border { padding-right: .1px; }

@media print {
  /* Hide the cursor when printing */
  .CodeMirror div.CodeMirror-cursors {
    visibility: hidden;
  }
}

/* See issue #2901 */
.cm-tab-wrap-hack:after { content: ''; }

/* Help users use markselection to safely style text background */
span.CodeMirror-selectedtext { background: none; }

.CodeMirror-dialog {
  position: absolute;
  left: 0; right: 0;
  background: inherit;
  z-index: 15;
  padding: .1em .8em;
  overflow: hidden;
  color: inherit;
}

.CodeMirror-dialog-top {
  border-bottom: 1px solid #eee;
  top: 0;
}

.CodeMirror-dialog-bottom {
  border-top: 1px solid #eee;
  bottom: 0;
}

.CodeMirror-dialog input {
  border: none;
  outline: none;
  background: transparent;
  width: 20em;
  color: inherit;
  font-family: monospace;
}

.CodeMirror-dialog button {
  font-size: 70%;
}

.CodeMirror-foldmarker {
  color: blue;
  text-shadow: #b9f 1px 1px 2px, #b9f -1px -1px 2px, #b9f 1px -1px 2px, #b9f -1px 1px 2px;
  font-family: arial;
  line-height: .3;
  cursor: pointer;
}
.CodeMirror-foldgutter {
  width: .7em;
}
.CodeMirror-foldgutter-open,
.CodeMirror-foldgutter-folded {
  cursor: pointer;
}
.CodeMirror-foldgutter-open:after {
  content: "\25BE";
}
.CodeMirror-foldgutter-folded:after {
  content: "\25B8";
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.CodeMirror {
  line-height: var(--jp-code-line-height);
  font-size: var(--jp-code-font-size);
  font-family: var(--jp-code-font-family);
  border: 0;
  border-radius: 0;
  height: auto;
  /* Changed to auto to autogrow */
}

.CodeMirror pre {
  padding: 0 var(--jp-code-padding);
}

.jp-CodeMirrorEditor[data-type='inline'] .CodeMirror-dialog {
  background-color: var(--jp-layout-color0);
  color: var(--jp-content-font-color1);
}

/* This causes https://github.com/jupyter/jupyterlab/issues/522 */
/* May not cause it not because we changed it! */
.CodeMirror-lines {
  padding: var(--jp-code-padding) 0;
}

.CodeMirror-linenumber {
  padding: 0 8px;
}

.jp-CodeMirrorEditor {
  cursor: text;
}

.jp-CodeMirrorEditor[data-type='inline'] .CodeMirror-cursor {
  border-left: var(--jp-code-cursor-width0) solid var(--jp-editor-cursor-color);
}

/* When zoomed out 67% and 33% on a screen of 1440 width x 900 height */
@media screen and (min-width: 2138px) and (max-width: 4319px) {
  .jp-CodeMirrorEditor[data-type='inline'] .CodeMirror-cursor {
    border-left: var(--jp-code-cursor-width1) solid
      var(--jp-editor-cursor-color);
  }
}

/* When zoomed out less than 33% */
@media screen and (min-width: 4320px) {
  .jp-CodeMirrorEditor[data-type='inline'] .CodeMirror-cursor {
    border-left: var(--jp-code-cursor-width2) solid
      var(--jp-editor-cursor-color);
  }
}

.CodeMirror.jp-mod-readOnly .CodeMirror-cursor {
  display: none;
}

.CodeMirror-gutters {
  border-right: 1px solid var(--jp-border-color2);
  background-color: var(--jp-layout-color0);
}

.jp-CollaboratorCursor {
  border-left: 5px solid transparent;
  border-right: 5px solid transparent;
  border-top: none;
  border-bottom: 3px solid;
  background-clip: content-box;
  margin-left: -5px;
  margin-right: -5px;
}

.CodeMirror-selectedtext.cm-searching {
  background-color: var(--jp-search-selected-match-background-color) !important;
  color: var(--jp-search-selected-match-color) !important;
}

.cm-searching {
  background-color: var(
    --jp-search-unselected-match-background-color
  ) !important;
  color: var(--jp-search-unselected-match-color) !important;
}

.CodeMirror-focused .CodeMirror-selected {
  background-color: var(--jp-editor-selected-focused-background);
}

.CodeMirror-selected {
  background-color: var(--jp-editor-selected-background);
}

.jp-CollaboratorCursor-hover {
  position: absolute;
  z-index: 1;
  transform: translateX(-50%);
  color: white;
  border-radius: 3px;
  padding-left: 4px;
  padding-right: 4px;
  padding-top: 1px;
  padding-bottom: 1px;
  text-align: center;
  font-size: var(--jp-ui-font-size1);
  white-space: nowrap;
}

.jp-CodeMirror-ruler {
  border-left: 1px dashed var(--jp-border-color2);
}

/**
 * Here is our jupyter theme for CodeMirror syntax highlighting
 * This is used in our marked.js syntax highlighting and CodeMirror itself
 * The string "jupyter" is set in ../codemirror/widget.DEFAULT_CODEMIRROR_THEME
 * This came from the classic notebook, which came form highlight.js/GitHub
 */

/**
 * CodeMirror themes are handling the background/color in this way. This works
 * fine for CodeMirror editors outside the notebook, but the notebook styles
 * these things differently.
 */
.CodeMirror.cm-s-jupyter {
  background: var(--jp-layout-color0);
  color: var(--jp-content-font-color1);
}

/* In the notebook, we want this styling to be handled by its container */
.jp-CodeConsole .CodeMirror.cm-s-jupyter,
.jp-Notebook .CodeMirror.cm-s-jupyter {
  background: transparent;
}

.cm-s-jupyter .CodeMirror-cursor {
  border-left: var(--jp-code-cursor-width0) solid var(--jp-editor-cursor-color);
}
.cm-s-jupyter span.cm-keyword {
  color: var(--jp-mirror-editor-keyword-color);
  font-weight: bold;
}
.cm-s-jupyter span.cm-atom {
  color: var(--jp-mirror-editor-atom-color);
}
.cm-s-jupyter span.cm-number {
  color: var(--jp-mirror-editor-number-color);
}
.cm-s-jupyter span.cm-def {
  color: var(--jp-mirror-editor-def-color);
}
.cm-s-jupyter span.cm-variable {
  color: var(--jp-mirror-editor-variable-color);
}
.cm-s-jupyter span.cm-variable-2 {
  color: var(--jp-mirror-editor-variable-2-color);
}
.cm-s-jupyter span.cm-variable-3 {
  color: var(--jp-mirror-editor-variable-3-color);
}
.cm-s-jupyter span.cm-punctuation {
  color: var(--jp-mirror-editor-punctuation-color);
}
.cm-s-jupyter span.cm-property {
  color: var(--jp-mirror-editor-property-color);
}
.cm-s-jupyter span.cm-operator {
  color: var(--jp-mirror-editor-operator-color);
  font-weight: bold;
}
.cm-s-jupyter span.cm-comment {
  color: var(--jp-mirror-editor-comment-color);
  font-style: italic;
}
.cm-s-jupyter span.cm-string {
  color: var(--jp-mirror-editor-string-color);
}
.cm-s-jupyter span.cm-string-2 {
  color: var(--jp-mirror-editor-string-2-color);
}
.cm-s-jupyter span.cm-meta {
  color: var(--jp-mirror-editor-meta-color);
}
.cm-s-jupyter span.cm-qualifier {
  color: var(--jp-mirror-editor-qualifier-color);
}
.cm-s-jupyter span.cm-builtin {
  color: var(--jp-mirror-editor-builtin-color);
}
.cm-s-jupyter span.cm-bracket {
  color: var(--jp-mirror-editor-bracket-color);
}
.cm-s-jupyter span.cm-tag {
  color: var(--jp-mirror-editor-tag-color);
}
.cm-s-jupyter span.cm-attribute {
  color: var(--jp-mirror-editor-attribute-color);
}
.cm-s-jupyter span.cm-header {
  color: var(--jp-mirror-editor-header-color);
}
.cm-s-jupyter span.cm-quote {
  color: var(--jp-mirror-editor-quote-color);
}
.cm-s-jupyter span.cm-link {
  color: var(--jp-mirror-editor-link-color);
}
.cm-s-jupyter span.cm-error {
  color: var(--jp-mirror-editor-error-color);
}
.cm-s-jupyter span.cm-hr {
  color: #999;
}

.cm-s-jupyter span.cm-tab {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAMCAYAAAAkuj5RAAAAAXNSR0IArs4c6QAAAGFJREFUSMft1LsRQFAQheHPowAKoACx3IgEKtaEHujDjORSgWTH/ZOdnZOcM/sgk/kFFWY0qV8foQwS4MKBCS3qR6ixBJvElOobYAtivseIE120FaowJPN75GMu8j/LfMwNjh4HUpwg4LUAAAAASUVORK5CYII=);
  background-position: right;
  background-repeat: no-repeat;
}

.cm-s-jupyter .CodeMirror-activeline-background,
.cm-s-jupyter .CodeMirror-gutter {
  background-color: var(--jp-layout-color2);
}

/* Styles for shared cursors (remote cursor locations and selected ranges) */
.jp-CodeMirrorEditor .remote-caret {
  position: relative;
  border-left: 2px solid black;
  margin-left: -1px;
  margin-right: -1px;
  box-sizing: border-box;
}

.jp-CodeMirrorEditor .remote-caret > div {
  white-space: nowrap;
  position: absolute;
  top: -1.15em;
  padding-bottom: 0.05em;
  left: -2px;
  font-size: 0.95em;
  background-color: rgb(250, 129, 0);
  font-family: var(--jp-ui-font-family);
  font-weight: bold;
  line-height: normal;
  user-select: none;
  color: white;
  padding-left: 2px;
  padding-right: 2px;
  z-index: 3;
  transition: opacity 0.3s ease-in-out;
}

.jp-CodeMirrorEditor .remote-caret.hide-name > div {
  transition-delay: 0.7s;
  opacity: 0;
}

.jp-CodeMirrorEditor .remote-caret:hover > div {
  opacity: 1;
  transition-delay: 0s;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| RenderedText
|----------------------------------------------------------------------------*/

:root {
  /* This is the padding value to fill the gaps between lines containing spans with background color. */
  --jp-private-code-span-padding: calc(
    (var(--jp-code-line-height) - 1) * var(--jp-code-font-size) / 2
  );
}

.jp-RenderedText {
  text-align: left;
  padding-left: var(--jp-code-padding);
  line-height: var(--jp-code-line-height);
  font-family: var(--jp-code-font-family);
}

.jp-RenderedText pre,
.jp-RenderedJavaScript pre,
.jp-RenderedHTMLCommon pre {
  color: var(--jp-content-font-color1);
  font-size: var(--jp-code-font-size);
  border: none;
  margin: 0px;
  padding: 0px;
}

.jp-RenderedText pre a:link {
  text-decoration: none;
  color: var(--jp-content-link-color);
}
.jp-RenderedText pre a:hover {
  text-decoration: underline;
  color: var(--jp-content-link-color);
}
.jp-RenderedText pre a:visited {
  text-decoration: none;
  color: var(--jp-content-link-color);
}

/* console foregrounds and backgrounds */
.jp-RenderedText pre .ansi-black-fg {
  color: #3e424d;
}
.jp-RenderedText pre .ansi-red-fg {
  color: #e75c58;
}
.jp-RenderedText pre .ansi-green-fg {
  color: #00a250;
}
.jp-RenderedText pre .ansi-yellow-fg {
  color: #ddb62b;
}
.jp-RenderedText pre .ansi-blue-fg {
  color: #208ffb;
}
.jp-RenderedText pre .ansi-magenta-fg {
  color: #d160c4;
}
.jp-RenderedText pre .ansi-cyan-fg {
  color: #60c6c8;
}
.jp-RenderedText pre .ansi-white-fg {
  color: #c5c1b4;
}

.jp-RenderedText pre .ansi-black-bg {
  background-color: #3e424d;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-red-bg {
  background-color: #e75c58;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-green-bg {
  background-color: #00a250;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-yellow-bg {
  background-color: #ddb62b;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-blue-bg {
  background-color: #208ffb;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-magenta-bg {
  background-color: #d160c4;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-cyan-bg {
  background-color: #60c6c8;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-white-bg {
  background-color: #c5c1b4;
  padding: var(--jp-private-code-span-padding) 0;
}

.jp-RenderedText pre .ansi-black-intense-fg {
  color: #282c36;
}
.jp-RenderedText pre .ansi-red-intense-fg {
  color: #b22b31;
}
.jp-RenderedText pre .ansi-green-intense-fg {
  color: #007427;
}
.jp-RenderedText pre .ansi-yellow-intense-fg {
  color: #b27d12;
}
.jp-RenderedText pre .ansi-blue-intense-fg {
  color: #0065ca;
}
.jp-RenderedText pre .ansi-magenta-intense-fg {
  color: #a03196;
}
.jp-RenderedText pre .ansi-cyan-intense-fg {
  color: #258f8f;
}
.jp-RenderedText pre .ansi-white-intense-fg {
  color: #a1a6b2;
}

.jp-RenderedText pre .ansi-black-intense-bg {
  background-color: #282c36;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-red-intense-bg {
  background-color: #b22b31;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-green-intense-bg {
  background-color: #007427;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-yellow-intense-bg {
  background-color: #b27d12;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-blue-intense-bg {
  background-color: #0065ca;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-magenta-intense-bg {
  background-color: #a03196;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-cyan-intense-bg {
  background-color: #258f8f;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-white-intense-bg {
  background-color: #a1a6b2;
  padding: var(--jp-private-code-span-padding) 0;
}

.jp-RenderedText pre .ansi-default-inverse-fg {
  color: var(--jp-ui-inverse-font-color0);
}
.jp-RenderedText pre .ansi-default-inverse-bg {
  background-color: var(--jp-inverse-layout-color0);
  padding: var(--jp-private-code-span-padding) 0;
}

.jp-RenderedText pre .ansi-bold {
  font-weight: bold;
}
.jp-RenderedText pre .ansi-underline {
  text-decoration: underline;
}

.jp-RenderedText[data-mime-type='application/vnd.jupyter.stderr'] {
  background: var(--jp-rendermime-error-background);
  padding-top: var(--jp-code-padding);
}

/*-----------------------------------------------------------------------------
| RenderedLatex
|----------------------------------------------------------------------------*/

.jp-RenderedLatex {
  color: var(--jp-content-font-color1);
  font-size: var(--jp-content-font-size1);
  line-height: var(--jp-content-line-height);
}

/* Left-justify outputs.*/
.jp-OutputArea-output.jp-RenderedLatex {
  padding: var(--jp-code-padding);
  text-align: left;
}

/*-----------------------------------------------------------------------------
| RenderedHTML
|----------------------------------------------------------------------------*/

.jp-RenderedHTMLCommon {
  color: var(--jp-content-font-color1);
  font-family: var(--jp-content-font-family);
  font-size: var(--jp-content-font-size1);
  line-height: var(--jp-content-line-height);
  /* Give a bit more R padding on Markdown text to keep line lengths reasonable */
  padding-right: 20px;
}

.jp-RenderedHTMLCommon em {
  font-style: italic;
}

.jp-RenderedHTMLCommon strong {
  font-weight: bold;
}

.jp-RenderedHTMLCommon u {
  text-decoration: underline;
}

.jp-RenderedHTMLCommon a:link {
  text-decoration: none;
  color: var(--jp-content-link-color);
}

.jp-RenderedHTMLCommon a:hover {
  text-decoration: underline;
  color: var(--jp-content-link-color);
}

.jp-RenderedHTMLCommon a:visited {
  text-decoration: none;
  color: var(--jp-content-link-color);
}

/* Headings */

.jp-RenderedHTMLCommon h1,
.jp-RenderedHTMLCommon h2,
.jp-RenderedHTMLCommon h3,
.jp-RenderedHTMLCommon h4,
.jp-RenderedHTMLCommon h5,
.jp-RenderedHTMLCommon h6 {
  line-height: var(--jp-content-heading-line-height);
  font-weight: var(--jp-content-heading-font-weight);
  font-style: normal;
  margin: var(--jp-content-heading-margin-top) 0
    var(--jp-content-heading-margin-bottom) 0;
}

.jp-RenderedHTMLCommon h1:first-child,
.jp-RenderedHTMLCommon h2:first-child,
.jp-RenderedHTMLCommon h3:first-child,
.jp-RenderedHTMLCommon h4:first-child,
.jp-RenderedHTMLCommon h5:first-child,
.jp-RenderedHTMLCommon h6:first-child {
  margin-top: calc(0.5 * var(--jp-content-heading-margin-top));
}

.jp-RenderedHTMLCommon h1:last-child,
.jp-RenderedHTMLCommon h2:last-child,
.jp-RenderedHTMLCommon h3:last-child,
.jp-RenderedHTMLCommon h4:last-child,
.jp-RenderedHTMLCommon h5:last-child,
.jp-RenderedHTMLCommon h6:last-child {
  margin-bottom: calc(0.5 * var(--jp-content-heading-margin-bottom));
}

.jp-RenderedHTMLCommon h1 {
  font-size: var(--jp-content-font-size5);
}

.jp-RenderedHTMLCommon h2 {
  font-size: var(--jp-content-font-size4);
}

.jp-RenderedHTMLCommon h3 {
  font-size: var(--jp-content-font-size3);
}

.jp-RenderedHTMLCommon h4 {
  font-size: var(--jp-content-font-size2);
}

.jp-RenderedHTMLCommon h5 {
  font-size: var(--jp-content-font-size1);
}

.jp-RenderedHTMLCommon h6 {
  font-size: var(--jp-content-font-size0);
}

/* Lists */

.jp-RenderedHTMLCommon ul:not(.list-inline),
.jp-RenderedHTMLCommon ol:not(.list-inline) {
  padding-left: 2em;
}

.jp-RenderedHTMLCommon ul {
  list-style: disc;
}

.jp-RenderedHTMLCommon ul ul {
  list-style: square;
}

.jp-RenderedHTMLCommon ul ul ul {
  list-style: circle;
}

.jp-RenderedHTMLCommon ol {
  list-style: decimal;
}

.jp-RenderedHTMLCommon ol ol {
  list-style: upper-alpha;
}

.jp-RenderedHTMLCommon ol ol ol {
  list-style: lower-alpha;
}

.jp-RenderedHTMLCommon ol ol ol ol {
  list-style: lower-roman;
}

.jp-RenderedHTMLCommon ol ol ol ol ol {
  list-style: decimal;
}

.jp-RenderedHTMLCommon ol,
.jp-RenderedHTMLCommon ul {
  margin-bottom: 1em;
}

.jp-RenderedHTMLCommon ul ul,
.jp-RenderedHTMLCommon ul ol,
.jp-RenderedHTMLCommon ol ul,
.jp-RenderedHTMLCommon ol ol {
  margin-bottom: 0em;
}

.jp-RenderedHTMLCommon hr {
  color: var(--jp-border-color2);
  background-color: var(--jp-border-color1);
  margin-top: 1em;
  margin-bottom: 1em;
}

.jp-RenderedHTMLCommon > pre {
  margin: 1.5em 2em;
}

.jp-RenderedHTMLCommon pre,
.jp-RenderedHTMLCommon code {
  border: 0;
  background-color: var(--jp-layout-color0);
  color: var(--jp-content-font-color1);
  font-family: var(--jp-code-font-family);
  font-size: inherit;
  line-height: var(--jp-code-line-height);
  padding: 0;
  white-space: pre-wrap;
}

.jp-RenderedHTMLCommon :not(pre) > code {
  background-color: var(--jp-layout-color2);
  padding: 1px 5px;
}

/* Tables */

.jp-RenderedHTMLCommon table {
  border-collapse: collapse;
  border-spacing: 0;
  border: none;
  color: var(--jp-ui-font-color1);
  font-size: 12px;
  table-layout: fixed;
  margin-left: auto;
  margin-right: auto;
}

.jp-RenderedHTMLCommon thead {
  border-bottom: var(--jp-border-width) solid var(--jp-border-color1);
  vertical-align: bottom;
}

.jp-RenderedHTMLCommon td,
.jp-RenderedHTMLCommon th,
.jp-RenderedHTMLCommon tr {
  vertical-align: middle;
  padding: 0.5em 0.5em;
  line-height: normal;
  white-space: normal;
  max-width: none;
  border: none;
}

.jp-RenderedMarkdown.jp-RenderedHTMLCommon td,
.jp-RenderedMarkdown.jp-RenderedHTMLCommon th {
  max-width: none;
}

:not(.jp-RenderedMarkdown).jp-RenderedHTMLCommon td,
:not(.jp-RenderedMarkdown).jp-RenderedHTMLCommon th,
:not(.jp-RenderedMarkdown).jp-RenderedHTMLCommon tr {
  text-align: right;
}

.jp-RenderedHTMLCommon th {
  font-weight: bold;
}

.jp-RenderedHTMLCommon tbody tr:nth-child(odd) {
  background: var(--jp-layout-color0);
}

.jp-RenderedHTMLCommon tbody tr:nth-child(even) {
  background: var(--jp-rendermime-table-row-background);
}

.jp-RenderedHTMLCommon tbody tr:hover {
  background: var(--jp-rendermime-table-row-hover-background);
}

.jp-RenderedHTMLCommon table {
  margin-bottom: 1em;
}

.jp-RenderedHTMLCommon p {
  text-align: left;
  margin: 0px;
}

.jp-RenderedHTMLCommon p {
  margin-bottom: 1em;
}

.jp-RenderedHTMLCommon img {
  -moz-force-broken-image-icon: 1;
}

/* Restrict to direct children as other images could be nested in other content. */
.jp-RenderedHTMLCommon > img {
  display: block;
  margin-left: 0;
  margin-right: 0;
  margin-bottom: 1em;
}

/* Change color behind transparent images if they need it... */
[data-jp-theme-light='false'] .jp-RenderedImage img.jp-needs-light-background {
  background-color: var(--jp-inverse-layout-color1);
}
[data-jp-theme-light='true'] .jp-RenderedImage img.jp-needs-dark-background {
  background-color: var(--jp-inverse-layout-color1);
}
/* ...or leave it untouched if they don't */
[data-jp-theme-light='false'] .jp-RenderedImage img.jp-needs-dark-background {
}
[data-jp-theme-light='true'] .jp-RenderedImage img.jp-needs-light-background {
}

.jp-RenderedHTMLCommon img,
.jp-RenderedImage img,
.jp-RenderedHTMLCommon svg,
.jp-RenderedSVG svg {
  max-width: 100%;
  height: auto;
}

.jp-RenderedHTMLCommon img.jp-mod-unconfined,
.jp-RenderedImage img.jp-mod-unconfined,
.jp-RenderedHTMLCommon svg.jp-mod-unconfined,
.jp-RenderedSVG svg.jp-mod-unconfined {
  max-width: none;
}

.jp-RenderedHTMLCommon .alert {
  padding: var(--jp-notebook-padding);
  border: var(--jp-border-width) solid transparent;
  border-radius: var(--jp-border-radius);
  margin-bottom: 1em;
}

.jp-RenderedHTMLCommon .alert-info {
  color: var(--jp-info-color0);
  background-color: var(--jp-info-color3);
  border-color: var(--jp-info-color2);
}
.jp-RenderedHTMLCommon .alert-info hr {
  border-color: var(--jp-info-color3);
}
.jp-RenderedHTMLCommon .alert-info > p:last-child,
.jp-RenderedHTMLCommon .alert-info > ul:last-child {
  margin-bottom: 0;
}

.jp-RenderedHTMLCommon .alert-warning {
  color: var(--jp-warn-color0);
  background-color: var(--jp-warn-color3);
  border-color: var(--jp-warn-color2);
}
.jp-RenderedHTMLCommon .alert-warning hr {
  border-color: var(--jp-warn-color3);
}
.jp-RenderedHTMLCommon .alert-warning > p:last-child,
.jp-RenderedHTMLCommon .alert-warning > ul:last-child {
  margin-bottom: 0;
}

.jp-RenderedHTMLCommon .alert-success {
  color: var(--jp-success-color0);
  background-color: var(--jp-success-color3);
  border-color: var(--jp-success-color2);
}
.jp-RenderedHTMLCommon .alert-success hr {
  border-color: var(--jp-success-color3);
}
.jp-RenderedHTMLCommon .alert-success > p:last-child,
.jp-RenderedHTMLCommon .alert-success > ul:last-child {
  margin-bottom: 0;
}

.jp-RenderedHTMLCommon .alert-danger {
  color: var(--jp-error-color0);
  background-color: var(--jp-error-color3);
  border-color: var(--jp-error-color2);
}
.jp-RenderedHTMLCommon .alert-danger hr {
  border-color: var(--jp-error-color3);
}
.jp-RenderedHTMLCommon .alert-danger > p:last-child,
.jp-RenderedHTMLCommon .alert-danger > ul:last-child {
  margin-bottom: 0;
}

.jp-RenderedHTMLCommon blockquote {
  margin: 1em 2em;
  padding: 0 1em;
  border-left: 5px solid var(--jp-border-color2);
}

a.jp-InternalAnchorLink {
  visibility: hidden;
  margin-left: 8px;
  color: var(--md-blue-800);
}

h1:hover .jp-InternalAnchorLink,
h2:hover .jp-InternalAnchorLink,
h3:hover .jp-InternalAnchorLink,
h4:hover .jp-InternalAnchorLink,
h5:hover .jp-InternalAnchorLink,
h6:hover .jp-InternalAnchorLink {
  visibility: visible;
}

.jp-RenderedHTMLCommon kbd {
  background-color: var(--jp-rendermime-table-row-background);
  border: 1px solid var(--jp-border-color0);
  border-bottom-color: var(--jp-border-color2);
  border-radius: 3px;
  box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.25);
  display: inline-block;
  font-size: 0.8em;
  line-height: 1em;
  padding: 0.2em 0.5em;
}

/* Most direct children of .jp-RenderedHTMLCommon have a margin-bottom of 1.0.
 * At the bottom of cells this is a bit too much as there is also spacing
 * between cells. Going all the way to 0 gets too tight between markdown and
 * code cells.
 */
.jp-RenderedHTMLCommon > *:last-child {
  margin-bottom: 0.5em;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-MimeDocument {
  outline: none;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Variables
|----------------------------------------------------------------------------*/

:root {
  --jp-private-filebrowser-button-height: 28px;
  --jp-private-filebrowser-button-width: 48px;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-FileBrowser {
  display: flex;
  flex-direction: column;
  color: var(--jp-ui-font-color1);
  background: var(--jp-layout-color1);
  /* This is needed so that all font sizing of children done in ems is
   * relative to this base size */
  font-size: var(--jp-ui-font-size1);
}

.jp-FileBrowser-toolbar.jp-Toolbar {
  border-bottom: none;
  height: auto;
  margin: var(--jp-toolbar-header-margin);
  box-shadow: none;
}

.jp-BreadCrumbs {
  flex: 0 0 auto;
  margin: 8px 12px 8px 12px;
}

.jp-BreadCrumbs-item {
  margin: 0px 2px;
  padding: 0px 2px;
  border-radius: var(--jp-border-radius);
  cursor: pointer;
}

.jp-BreadCrumbs-item:hover {
  background-color: var(--jp-layout-color2);
}

.jp-BreadCrumbs-item:first-child {
  margin-left: 0px;
}

.jp-BreadCrumbs-item.jp-mod-dropTarget {
  background-color: var(--jp-brand-color2);
  opacity: 0.7;
}

/*-----------------------------------------------------------------------------
| Buttons
|----------------------------------------------------------------------------*/

.jp-FileBrowser-toolbar.jp-Toolbar {
  padding: 0px;
  margin: 8px 12px 0px 12px;
}

.jp-FileBrowser-toolbar.jp-Toolbar {
  justify-content: flex-start;
}

.jp-FileBrowser-toolbar.jp-Toolbar .jp-Toolbar-item {
  flex: 0 0 auto;
  padding-left: 0px;
  padding-right: 2px;
}

.jp-FileBrowser-toolbar.jp-Toolbar .jp-ToolbarButtonComponent {
  width: 40px;
}

.jp-FileBrowser-toolbar.jp-Toolbar
  .jp-Toolbar-item:first-child
  .jp-ToolbarButtonComponent {
  width: 72px;
  background: var(--jp-brand-color1);
}

.jp-FileBrowser-toolbar.jp-Toolbar
  .jp-Toolbar-item:first-child
  .jp-ToolbarButtonComponent:focus-visible {
  background-color: var(--jp-brand-color0);
}

.jp-FileBrowser-toolbar.jp-Toolbar
  .jp-Toolbar-item:first-child
  .jp-ToolbarButtonComponent
  .jp-icon3 {
  fill: white;
}

/*-----------------------------------------------------------------------------
| Other styles
|----------------------------------------------------------------------------*/

.jp-FileDialog.jp-mod-conflict input {
  color: var(--jp-error-color1);
}

.jp-FileDialog .jp-new-name-title {
  margin-top: 12px;
}

.jp-LastModified-hidden {
  display: none;
}

.jp-FileBrowser-filterBox {
  padding: 0px;
  flex: 0 0 auto;
  margin: 8px 12px 0px 12px;
}

/*-----------------------------------------------------------------------------
| DirListing
|----------------------------------------------------------------------------*/

.jp-DirListing {
  flex: 1 1 auto;
  display: flex;
  flex-direction: column;
  outline: 0;
}

.jp-DirListing:focus-visible {
  border: 1px solid var(--jp-brand-color1);
}

.jp-DirListing-header {
  flex: 0 0 auto;
  display: flex;
  flex-direction: row;
  overflow: hidden;
  border-top: var(--jp-border-width) solid var(--jp-border-color2);
  border-bottom: var(--jp-border-width) solid var(--jp-border-color1);
  box-shadow: var(--jp-toolbar-box-shadow);
  z-index: 2;
}

.jp-DirListing-headerItem {
  padding: 4px 12px 2px 12px;
  font-weight: 500;
}

.jp-DirListing-headerItem:hover {
  background: var(--jp-layout-color2);
}

.jp-DirListing-headerItem.jp-id-name {
  flex: 1 0 84px;
}

.jp-DirListing-headerItem.jp-id-modified {
  flex: 0 0 112px;
  border-left: var(--jp-border-width) solid var(--jp-border-color2);
  text-align: right;
}

.jp-id-narrow {
  display: none;
  flex: 0 0 5px;
  padding: 4px 4px;
  border-left: var(--jp-border-width) solid var(--jp-border-color2);
  text-align: right;
  color: var(--jp-border-color2);
}

.jp-DirListing-narrow .jp-id-narrow {
  display: block;
}

.jp-DirListing-narrow .jp-id-modified,
.jp-DirListing-narrow .jp-DirListing-itemModified {
  display: none;
}

.jp-DirListing-headerItem.jp-mod-selected {
  font-weight: 600;
}

/* increase specificity to override bundled default */
.jp-DirListing-content {
  flex: 1 1 auto;
  margin: 0;
  padding: 0;
  list-style-type: none;
  overflow: auto;
  background-color: var(--jp-layout-color1);
}

.jp-DirListing-content mark {
  color: var(--jp-ui-font-color0);
  background-color: transparent;
  font-weight: bold;
}

.jp-DirListing-content .jp-DirListing-item.jp-mod-selected mark {
  color: var(--jp-ui-inverse-font-color0);
}

/* Style the directory listing content when a user drops a file to upload */
.jp-DirListing.jp-mod-native-drop .jp-DirListing-content {
  outline: 5px dashed rgba(128, 128, 128, 0.5);
  outline-offset: -10px;
  cursor: copy;
}

.jp-DirListing-item {
  display: flex;
  flex-direction: row;
  padding: 4px 12px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.jp-DirListing-item[data-is-dot] {
  opacity: 75%;
}

.jp-DirListing-item.jp-mod-selected {
  color: var(--jp-ui-inverse-font-color1);
  background: var(--jp-brand-color1);
}

.jp-DirListing-item.jp-mod-dropTarget {
  background: var(--jp-brand-color3);
}

.jp-DirListing-item:hover:not(.jp-mod-selected) {
  background: var(--jp-layout-color2);
}

.jp-DirListing-itemIcon {
  flex: 0 0 20px;
  margin-right: 4px;
}

.jp-DirListing-itemText {
  flex: 1 0 64px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  user-select: none;
}

.jp-DirListing-itemModified {
  flex: 0 0 125px;
  text-align: right;
}

.jp-DirListing-editor {
  flex: 1 0 64px;
  outline: none;
  border: none;
}

.jp-DirListing-item.jp-mod-running .jp-DirListing-itemIcon:before {
  color: var(--jp-success-color1);
  content: '\25CF';
  font-size: 8px;
  position: absolute;
  left: -8px;
}

.jp-DirListing-item.jp-mod-running.jp-mod-selected
  .jp-DirListing-itemIcon:before {
  color: var(--jp-ui-inverse-font-color1);
}

.jp-DirListing-item.lm-mod-drag-image,
.jp-DirListing-item.jp-mod-selected.lm-mod-drag-image {
  font-size: var(--jp-ui-font-size1);
  padding-left: 4px;
  margin-left: 4px;
  width: 160px;
  background-color: var(--jp-ui-inverse-font-color2);
  box-shadow: var(--jp-elevation-z2);
  border-radius: 0px;
  color: var(--jp-ui-font-color1);
  transform: translateX(-40%) translateY(-58%);
}

.jp-DirListing-deadSpace {
  flex: 1 1 auto;
  margin: 0;
  padding: 0;
  list-style-type: none;
  overflow: auto;
  background-color: var(--jp-layout-color1);
}

.jp-Document {
  min-width: 120px;
  min-height: 120px;
  outline: none;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Private CSS variables
|----------------------------------------------------------------------------*/

:root {
}

/*-----------------------------------------------------------------------------
| Main OutputArea
| OutputArea has a list of Outputs
|----------------------------------------------------------------------------*/

.jp-OutputArea {
  overflow-y: auto;
}

.jp-OutputArea-child {
  display: flex;
  flex-direction: row;
}

body[data-format='mobile'] .jp-OutputArea-child {
  flex-direction: column;
}

.jp-OutputPrompt {
  flex: 0 0 var(--jp-cell-prompt-width);
  color: var(--jp-cell-outprompt-font-color);
  font-family: var(--jp-cell-prompt-font-family);
  padding: var(--jp-code-padding);
  letter-spacing: var(--jp-cell-prompt-letter-spacing);
  line-height: var(--jp-code-line-height);
  font-size: var(--jp-code-font-size);
  border: var(--jp-border-width) solid transparent;
  opacity: var(--jp-cell-prompt-opacity);
  /* Right align prompt text, don't wrap to handle large prompt numbers */
  text-align: right;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  /* Disable text selection */
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

body[data-format='mobile'] .jp-OutputPrompt {
  flex: 0 0 auto;
  text-align: left;
}

.jp-OutputArea-output {
  height: auto;
  overflow: auto;
  user-select: text;
  -moz-user-select: text;
  -webkit-user-select: text;
  -ms-user-select: text;
}

.jp-OutputArea-child .jp-OutputArea-output {
  flex-grow: 1;
  flex-shrink: 1;
}

body[data-format='mobile'] .jp-OutputArea-child .jp-OutputArea-output {
  margin-left: var(--jp-notebook-padding);
}

/**
 * Isolated output.
 */
.jp-OutputArea-output.jp-mod-isolated {
  width: 100%;
  display: block;
}

/*
When drag events occur, `p-mod-override-cursor` is added to the body.
Because iframes steal all cursor events, the following two rules are necessary
to suppress pointer events while resize drags are occurring. There may be a
better solution to this problem.
*/
body.lm-mod-override-cursor .jp-OutputArea-output.jp-mod-isolated {
  position: relative;
}

body.lm-mod-override-cursor .jp-OutputArea-output.jp-mod-isolated:before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: transparent;
}

/* pre */

.jp-OutputArea-output pre {
  border: none;
  margin: 0px;
  padding: 0px;
  overflow-x: auto;
  overflow-y: auto;
  word-break: break-all;
  word-wrap: break-word;
  white-space: pre-wrap;
}

/* tables */

.jp-OutputArea-output.jp-RenderedHTMLCommon table {
  margin-left: 0;
  margin-right: 0;
}

/* description lists */

.jp-OutputArea-output dl,
.jp-OutputArea-output dt,
.jp-OutputArea-output dd {
  display: block;
}

.jp-OutputArea-output dl {
  width: 100%;
  overflow: hidden;
  padding: 0;
  margin: 0;
}

.jp-OutputArea-output dt {
  font-weight: bold;
  float: left;
  width: 20%;
  padding: 0;
  margin: 0;
}

.jp-OutputArea-output dd {
  float: left;
  width: 80%;
  padding: 0;
  margin: 0;
}

/* Hide the gutter in case of
 *  - nested output areas (e.g. in the case of output widgets)
 *  - mirrored output areas
 */
.jp-OutputArea .jp-OutputArea .jp-OutputArea-prompt {
  display: none;
}

/*-----------------------------------------------------------------------------
| executeResult is added to any Output-result for the display of the object
| returned by a cell
|----------------------------------------------------------------------------*/

.jp-OutputArea-output.jp-OutputArea-executeResult {
  margin-left: 0px;
  flex: 1 1 auto;
}

/* Text output with the Out[] prompt needs a top padding to match the
 * alignment of the Out[] prompt itself.
 */
.jp-OutputArea-executeResult .jp-RenderedText.jp-OutputArea-output {
  padding-top: var(--jp-code-padding);
  border-top: var(--jp-border-width) solid transparent;
}

/*-----------------------------------------------------------------------------
| The Stdin output
|----------------------------------------------------------------------------*/

.jp-OutputArea-stdin {
  line-height: var(--jp-code-line-height);
  padding-top: var(--jp-code-padding);
  display: flex;
}

.jp-Stdin-prompt {
  color: var(--jp-content-font-color0);
  padding-right: var(--jp-code-padding);
  vertical-align: baseline;
  flex: 0 0 auto;
}

.jp-Stdin-input {
  font-family: var(--jp-code-font-family);
  font-size: inherit;
  color: inherit;
  background-color: inherit;
  width: 42%;
  min-width: 200px;
  /* make sure input baseline aligns with prompt */
  vertical-align: baseline;
  /* padding + margin = 0.5em between prompt and cursor */
  padding: 0em 0.25em;
  margin: 0em 0.25em;
  flex: 0 0 70%;
}

.jp-Stdin-input:focus {
  box-shadow: none;
}

/*-----------------------------------------------------------------------------
| Output Area View
|----------------------------------------------------------------------------*/

.jp-LinkedOutputView .jp-OutputArea {
  height: 100%;
  display: block;
}

.jp-LinkedOutputView .jp-OutputArea-output:only-child {
  height: 100%;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-Collapser {
  flex: 0 0 var(--jp-cell-collapser-width);
  padding: 0px;
  margin: 0px;
  border: none;
  outline: none;
  background: transparent;
  border-radius: var(--jp-border-radius);
  opacity: 1;
}

.jp-Collapser-child {
  display: block;
  width: 100%;
  box-sizing: border-box;
  /* height: 100% doesn't work because the height of its parent is computed from content */
  position: absolute;
  top: 0px;
  bottom: 0px;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Header/Footer
|----------------------------------------------------------------------------*/

/* Hidden by zero height by default */
.jp-CellHeader,
.jp-CellFooter {
  height: 0px;
  width: 100%;
  padding: 0px;
  margin: 0px;
  border: none;
  outline: none;
  background: transparent;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Input
|----------------------------------------------------------------------------*/

/* All input areas */
.jp-InputArea {
  display: flex;
  flex-direction: row;
  overflow: hidden;
}

body[data-format='mobile'] .jp-InputArea {
  flex-direction: column;
}

.jp-InputArea-editor {
  flex: 1 1 auto;
  overflow: hidden;
}

.jp-InputArea-editor {
  /* This is the non-active, default styling */
  border: var(--jp-border-width) solid var(--jp-cell-editor-border-color);
  border-radius: 0px;
  background: var(--jp-cell-editor-background);
}

body[data-format='mobile'] .jp-InputArea-editor {
  margin-left: var(--jp-notebook-padding);
}

.jp-InputPrompt {
  flex: 0 0 var(--jp-cell-prompt-width);
  color: var(--jp-cell-inprompt-font-color);
  font-family: var(--jp-cell-prompt-font-family);
  padding: var(--jp-code-padding);
  letter-spacing: var(--jp-cell-prompt-letter-spacing);
  opacity: var(--jp-cell-prompt-opacity);
  line-height: var(--jp-code-line-height);
  font-size: var(--jp-code-font-size);
  border: var(--jp-border-width) solid transparent;
  opacity: var(--jp-cell-prompt-opacity);
  /* Right align prompt text, don't wrap to handle large prompt numbers */
  text-align: right;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  /* Disable text selection */
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

body[data-format='mobile'] .jp-InputPrompt {
  flex: 0 0 auto;
  text-align: left;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Placeholder
|----------------------------------------------------------------------------*/

.jp-Placeholder {
  display: flex;
  flex-direction: row;
  flex: 1 1 auto;
}

.jp-Placeholder-prompt {
  box-sizing: border-box;
}

.jp-Placeholder-content {
  flex: 1 1 auto;
  border: none;
  background: transparent;
  height: 20px;
  box-sizing: border-box;
}

.jp-Placeholder-content .jp-MoreHorizIcon {
  width: 32px;
  height: 16px;
  border: 1px solid transparent;
  border-radius: var(--jp-border-radius);
}

.jp-Placeholder-content .jp-MoreHorizIcon:hover {
  border: 1px solid var(--jp-border-color1);
  box-shadow: 0px 0px 2px 0px rgba(0, 0, 0, 0.25);
  background-color: var(--jp-layout-color0);
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Private CSS variables
|----------------------------------------------------------------------------*/

:root {
  --jp-private-cell-scrolling-output-offset: 5px;
}

/*-----------------------------------------------------------------------------
| Cell
|----------------------------------------------------------------------------*/

.jp-Cell {
  padding: var(--jp-cell-padding);
  margin: 0px;
  border: none;
  outline: none;
  background: transparent;
}

/*-----------------------------------------------------------------------------
| Common input/output
|----------------------------------------------------------------------------*/

.jp-Cell-inputWrapper,
.jp-Cell-outputWrapper {
  display: flex;
  flex-direction: row;
  padding: 0px;
  margin: 0px;
  /* Added to reveal the box-shadow on the input and output collapsers. */
  overflow: visible;
}

/* Only input/output areas inside cells */
.jp-Cell-inputArea,
.jp-Cell-outputArea {
  flex: 1 1 auto;
}

/*-----------------------------------------------------------------------------
| Collapser
|----------------------------------------------------------------------------*/

/* Make the output collapser disappear when there is not output, but do so
 * in a manner that leaves it in the layout and preserves its width.
 */
.jp-Cell.jp-mod-noOutputs .jp-Cell-outputCollapser {
  border: none !important;
  background: transparent !important;
}

.jp-Cell:not(.jp-mod-noOutputs) .jp-Cell-outputCollapser {
  min-height: var(--jp-cell-collapser-min-height);
}

/*-----------------------------------------------------------------------------
| Output
|----------------------------------------------------------------------------*/

/* Put a space between input and output when there IS output */
.jp-Cell:not(.jp-mod-noOutputs) .jp-Cell-outputWrapper {
  margin-top: 5px;
}

.jp-CodeCell.jp-mod-outputsScrolled .jp-Cell-outputArea {
  overflow-y: auto;
  max-height: 200px;
  box-shadow: inset 0 0 6px 2px rgba(0, 0, 0, 0.3);
  margin-left: var(--jp-private-cell-scrolling-output-offset);
}

.jp-CodeCell.jp-mod-outputsScrolled .jp-OutputArea-prompt {
  flex: 0 0
    calc(
      var(--jp-cell-prompt-width) -
        var(--jp-private-cell-scrolling-output-offset)
    );
}

/*-----------------------------------------------------------------------------
| CodeCell
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| MarkdownCell
|----------------------------------------------------------------------------*/

.jp-MarkdownOutput {
  flex: 1 1 auto;
  margin-top: 0;
  margin-bottom: 0;
  padding-left: var(--jp-code-padding);
}

.jp-MarkdownOutput.jp-RenderedHTMLCommon {
  overflow: auto;
}

.jp-showHiddenCellsButton {
  margin-left: calc(var(--jp-cell-prompt-width) + 2 * var(--jp-code-padding));
  margin-top: var(--jp-code-padding);
  border: 1px solid var(--jp-border-color2);
  background-color: var(--jp-border-color3) !important;
  color: var(--jp-content-font-color0) !important;
}

.jp-showHiddenCellsButton:hover {
  background-color: var(--jp-border-color2) !important;
}

.jp-collapseHeadingButton {
  display: none;
}

.jp-MarkdownCell:hover .jp-collapseHeadingButton {
  display: flex;
  min-height: var(--jp-cell-collapser-min-height);
  position: absolute;
  right: 0;
  top: 0;
  bottom: 0;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Variables
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------

/*-----------------------------------------------------------------------------
| Styles
|----------------------------------------------------------------------------*/

.jp-NotebookPanel-toolbar {
  padding: 2px;
}

.jp-Toolbar-item.jp-Notebook-toolbarCellType .jp-select-wrapper.jp-mod-focused {
  border: none;
  box-shadow: none;
}

.jp-Notebook-toolbarCellTypeDropdown select {
  height: 24px;
  font-size: var(--jp-ui-font-size1);
  line-height: 14px;
  border-radius: 0;
  display: block;
}

.jp-Notebook-toolbarCellTypeDropdown span {
  top: 5px !important;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Private CSS variables
|----------------------------------------------------------------------------*/

:root {
  --jp-private-notebook-dragImage-width: 304px;
  --jp-private-notebook-dragImage-height: 36px;
  --jp-private-notebook-selected-color: var(--md-blue-400);
  --jp-private-notebook-active-color: var(--md-green-400);
}

/*-----------------------------------------------------------------------------
| Imports
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Notebook
|----------------------------------------------------------------------------*/

.jp-NotebookPanel {
  display: block;
  height: 100%;
}

.jp-NotebookPanel.jp-Document {
  min-width: 240px;
  min-height: 120px;
}

.jp-Notebook {
  padding: var(--jp-notebook-padding);
  outline: none;
  overflow: auto;
  background: var(--jp-layout-color0);
}

.jp-Notebook.jp-mod-scrollPastEnd::after {
  display: block;
  content: '';
  min-height: var(--jp-notebook-scroll-padding);
}

.jp-MainAreaWidget-ContainStrict .jp-Notebook * {
  contain: strict;
}

.jp-Notebook-render * {
  contain: none !important;
}

.jp-Notebook .jp-Cell {
  overflow: visible;
}

.jp-Notebook .jp-Cell .jp-InputPrompt {
  cursor: move;
  float: left;
}

/*-----------------------------------------------------------------------------
| Notebook state related styling
|
| The notebook and cells each have states, here are the possibilities:
|
| - Notebook
|   - Command
|   - Edit
| - Cell
|   - None
|   - Active (only one can be active)
|   - Selected (the cells actions are applied to)
|   - Multiselected (when multiple selected, the cursor)
|   - No outputs
|----------------------------------------------------------------------------*/

/* Command or edit modes */

.jp-Notebook .jp-Cell:not(.jp-mod-active) .jp-InputPrompt {
  opacity: var(--jp-cell-prompt-not-active-opacity);
  color: var(--jp-cell-prompt-not-active-font-color);
}

.jp-Notebook .jp-Cell:not(.jp-mod-active) .jp-OutputPrompt {
  opacity: var(--jp-cell-prompt-not-active-opacity);
  color: var(--jp-cell-prompt-not-active-font-color);
}

/* cell is active */
.jp-Notebook .jp-Cell.jp-mod-active .jp-Collapser {
  background: var(--jp-brand-color1);
}

/* cell is dirty */
.jp-Notebook .jp-Cell.jp-mod-dirty .jp-InputPrompt {
  color: var(--jp-warn-color1);
}
.jp-Notebook .jp-Cell.jp-mod-dirty .jp-InputPrompt:before {
  color: var(--jp-warn-color1);
  content: '•';
}

.jp-Notebook .jp-Cell.jp-mod-active.jp-mod-dirty .jp-Collapser {
  background: var(--jp-warn-color1);
}

/* collapser is hovered */
.jp-Notebook .jp-Cell .jp-Collapser:hover {
  box-shadow: var(--jp-elevation-z2);
  background: var(--jp-brand-color1);
  opacity: var(--jp-cell-collapser-not-active-hover-opacity);
}

/* cell is active and collapser is hovered */
.jp-Notebook .jp-Cell.jp-mod-active .jp-Collapser:hover {
  background: var(--jp-brand-color0);
  opacity: 1;
}

/* Command mode */

.jp-Notebook.jp-mod-commandMode .jp-Cell.jp-mod-selected {
  background: var(--jp-notebook-multiselected-color);
}

.jp-Notebook.jp-mod-commandMode
  .jp-Cell.jp-mod-active.jp-mod-selected:not(.jp-mod-multiSelected) {
  background: transparent;
}

/* Edit mode */

.jp-Notebook.jp-mod-editMode .jp-Cell.jp-mod-active .jp-InputArea-editor {
  border: var(--jp-border-width) solid var(--jp-cell-editor-active-border-color);
  box-shadow: var(--jp-input-box-shadow);
  background-color: var(--jp-cell-editor-active-background);
}

/*-----------------------------------------------------------------------------
| Notebook drag and drop
|----------------------------------------------------------------------------*/

.jp-Notebook-cell.jp-mod-dropSource {
  opacity: 0.5;
}

.jp-Notebook-cell.jp-mod-dropTarget,
.jp-Notebook.jp-mod-commandMode
  .jp-Notebook-cell.jp-mod-active.jp-mod-selected.jp-mod-dropTarget {
  border-top-color: var(--jp-private-notebook-selected-color);
  border-top-style: solid;
  border-top-width: 2px;
}

.jp-dragImage {
  display: block;
  flex-direction: row;
  width: var(--jp-private-notebook-dragImage-width);
  height: var(--jp-private-notebook-dragImage-height);
  border: var(--jp-border-width) solid var(--jp-cell-editor-border-color);
  background: var(--jp-cell-editor-background);
  overflow: visible;
}

.jp-dragImage-singlePrompt {
  box-shadow: 2px 2px 4px 0px rgba(0, 0, 0, 0.12);
}

.jp-dragImage .jp-dragImage-content {
  flex: 1 1 auto;
  z-index: 2;
  font-size: var(--jp-code-font-size);
  font-family: var(--jp-code-font-family);
  line-height: var(--jp-code-line-height);
  padding: var(--jp-code-padding);
  border: var(--jp-border-width) solid var(--jp-cell-editor-border-color);
  background: var(--jp-cell-editor-background-color);
  color: var(--jp-content-font-color3);
  text-align: left;
  margin: 4px 4px 4px 0px;
}

.jp-dragImage .jp-dragImage-prompt {
  flex: 0 0 auto;
  min-width: 36px;
  color: var(--jp-cell-inprompt-font-color);
  padding: var(--jp-code-padding);
  padding-left: 12px;
  font-family: var(--jp-cell-prompt-font-family);
  letter-spacing: var(--jp-cell-prompt-letter-spacing);
  line-height: 1.9;
  font-size: var(--jp-code-font-size);
  border: var(--jp-border-width) solid transparent;
}

.jp-dragImage-multipleBack {
  z-index: -1;
  position: absolute;
  height: 32px;
  width: 300px;
  top: 8px;
  left: 8px;
  background: var(--jp-layout-color2);
  border: var(--jp-border-width) solid var(--jp-input-border-color);
  box-shadow: 2px 2px 4px 0px rgba(0, 0, 0, 0.12);
}

/*-----------------------------------------------------------------------------
| Cell toolbar
|----------------------------------------------------------------------------*/

.jp-NotebookTools {
  display: block;
  min-width: var(--jp-sidebar-min-width);
  color: var(--jp-ui-font-color1);
  background: var(--jp-layout-color1);
  /* This is needed so that all font sizing of children done in ems is
    * relative to this base size */
  font-size: var(--jp-ui-font-size1);
  overflow: auto;
}

.jp-NotebookTools-tool {
  padding: 0px 12px 0 12px;
}

.jp-ActiveCellTool {
  padding: 12px;
  background-color: var(--jp-layout-color1);
  border-top: none !important;
}

.jp-ActiveCellTool .jp-InputArea-prompt {
  flex: 0 0 auto;
  padding-left: 0px;
}

.jp-ActiveCellTool .jp-InputArea-editor {
  flex: 1 1 auto;
  background: var(--jp-cell-editor-background);
  border-color: var(--jp-cell-editor-border-color);
}

.jp-ActiveCellTool .jp-InputArea-editor .CodeMirror {
  background: transparent;
}

.jp-MetadataEditorTool {
  flex-direction: column;
  padding: 12px 0px 12px 0px;
}

.jp-RankedPanel > :not(:first-child) {
  margin-top: 12px;
}

.jp-KeySelector select.jp-mod-styled {
  font-size: var(--jp-ui-font-size1);
  color: var(--jp-ui-font-color0);
  border: var(--jp-border-width) solid var(--jp-border-color1);
}

.jp-KeySelector label,
.jp-MetadataEditorTool label {
  line-height: 1.4;
}

.jp-NotebookTools .jp-select-wrapper {
  margin-top: 4px;
  margin-bottom: 0px;
}

.jp-NotebookTools .jp-Collapse {
  margin-top: 16px;
}

/*-----------------------------------------------------------------------------
| Presentation Mode (.jp-mod-presentationMode)
|----------------------------------------------------------------------------*/

.jp-mod-presentationMode .jp-Notebook {
  --jp-content-font-size1: var(--jp-content-presentation-font-size1);
  --jp-code-font-size: var(--jp-code-presentation-font-size);
}

.jp-mod-presentationMode .jp-Notebook .jp-Cell .jp-InputPrompt,
.jp-mod-presentationMode .jp-Notebook .jp-Cell .jp-OutputPrompt {
  flex: 0 0 110px;
}

/*-----------------------------------------------------------------------------
| Placeholder
|----------------------------------------------------------------------------*/

.jp-Cell-Placeholder {
  padding-left: 55px;
}

.jp-Cell-Placeholder-wrapper {
  background: #fff;
  border: 1px solid;
  border-color: #e5e6e9 #dfe0e4 #d0d1d5;
  border-radius: 4px;
  -webkit-border-radius: 4px;
  margin: 10px 15px;
}

.jp-Cell-Placeholder-wrapper-inner {
  padding: 15px;
  position: relative;
}

.jp-Cell-Placeholder-wrapper-body {
  background-repeat: repeat;
  background-size: 50% auto;
}

.jp-Cell-Placeholder-wrapper-body div {
  background: #f6f7f8;
  background-image: -webkit-linear-gradient(
    left,
    #f6f7f8 0%,
    #edeef1 20%,
    #f6f7f8 40%,
    #f6f7f8 100%
  );
  background-repeat: no-repeat;
  background-size: 800px 104px;
  height: 104px;
  position: relative;
}

.jp-Cell-Placeholder-wrapper-body div {
  position: absolute;
  right: 15px;
  left: 15px;
  top: 15px;
}

div.jp-Cell-Placeholder-h1 {
  top: 20px;
  height: 20px;
  left: 15px;
  width: 150px;
}

div.jp-Cell-Placeholder-h2 {
  left: 15px;
  top: 50px;
  height: 10px;
  width: 100px;
}

div.jp-Cell-Placeholder-content-1,
div.jp-Cell-Placeholder-content-2,
div.jp-Cell-Placeholder-content-3 {
  left: 15px;
  right: 15px;
  height: 10px;
}

div.jp-Cell-Placeholder-content-1 {
  top: 100px;
}

div.jp-Cell-Placeholder-content-2 {
  top: 120px;
}

div.jp-Cell-Placeholder-content-3 {
  top: 140px;
}

</style>

    <style type="text/css">
/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*
The following CSS variables define the main, public API for styling JupyterLab.
These variables should be used by all plugins wherever possible. In other
words, plugins should not define custom colors, sizes, etc unless absolutely
necessary. This enables users to change the visual theme of JupyterLab
by changing these variables.

Many variables appear in an ordered sequence (0,1,2,3). These sequences
are designed to work well together, so for example, `--jp-border-color1` should
be used with `--jp-layout-color1`. The numbers have the following meanings:

* 0: super-primary, reserved for special emphasis
* 1: primary, most important under normal situations
* 2: secondary, next most important under normal situations
* 3: tertiary, next most important under normal situations

Throughout JupyterLab, we are mostly following principles from Google's
Material Design when selecting colors. We are not, however, following
all of MD as it is not optimized for dense, information rich UIs.
*/

:root {
  /* Elevation
   *
   * We style box-shadows using Material Design's idea of elevation. These particular numbers are taken from here:
   *
   * https://github.com/material-components/material-components-web
   * https://material-components-web.appspot.com/elevation.html
   */

  --jp-shadow-base-lightness: 0;
  --jp-shadow-umbra-color: rgba(
    var(--jp-shadow-base-lightness),
    var(--jp-shadow-base-lightness),
    var(--jp-shadow-base-lightness),
    0.2
  );
  --jp-shadow-penumbra-color: rgba(
    var(--jp-shadow-base-lightness),
    var(--jp-shadow-base-lightness),
    var(--jp-shadow-base-lightness),
    0.14
  );
  --jp-shadow-ambient-color: rgba(
    var(--jp-shadow-base-lightness),
    var(--jp-shadow-base-lightness),
    var(--jp-shadow-base-lightness),
    0.12
  );
  --jp-elevation-z0: none;
  --jp-elevation-z1: 0px 2px 1px -1px var(--jp-shadow-umbra-color),
    0px 1px 1px 0px var(--jp-shadow-penumbra-color),
    0px 1px 3px 0px var(--jp-shadow-ambient-color);
  --jp-elevation-z2: 0px 3px 1px -2px var(--jp-shadow-umbra-color),
    0px 2px 2px 0px var(--jp-shadow-penumbra-color),
    0px 1px 5px 0px var(--jp-shadow-ambient-color);
  --jp-elevation-z4: 0px 2px 4px -1px var(--jp-shadow-umbra-color),
    0px 4px 5px 0px var(--jp-shadow-penumbra-color),
    0px 1px 10px 0px var(--jp-shadow-ambient-color);
  --jp-elevation-z6: 0px 3px 5px -1px var(--jp-shadow-umbra-color),
    0px 6px 10px 0px var(--jp-shadow-penumbra-color),
    0px 1px 18px 0px var(--jp-shadow-ambient-color);
  --jp-elevation-z8: 0px 5px 5px -3px var(--jp-shadow-umbra-color),
    0px 8px 10px 1px var(--jp-shadow-penumbra-color),
    0px 3px 14px 2px var(--jp-shadow-ambient-color);
  --jp-elevation-z12: 0px 7px 8px -4px var(--jp-shadow-umbra-color),
    0px 12px 17px 2px var(--jp-shadow-penumbra-color),
    0px 5px 22px 4px var(--jp-shadow-ambient-color);
  --jp-elevation-z16: 0px 8px 10px -5px var(--jp-shadow-umbra-color),
    0px 16px 24px 2px var(--jp-shadow-penumbra-color),
    0px 6px 30px 5px var(--jp-shadow-ambient-color);
  --jp-elevation-z20: 0px 10px 13px -6px var(--jp-shadow-umbra-color),
    0px 20px 31px 3px var(--jp-shadow-penumbra-color),
    0px 8px 38px 7px var(--jp-shadow-ambient-color);
  --jp-elevation-z24: 0px 11px 15px -7px var(--jp-shadow-umbra-color),
    0px 24px 38px 3px var(--jp-shadow-penumbra-color),
    0px 9px 46px 8px var(--jp-shadow-ambient-color);

  /* Borders
   *
   * The following variables, specify the visual styling of borders in JupyterLab.
   */

  --jp-border-width: 1px;
  --jp-border-color0: var(--md-grey-400);
  --jp-border-color1: var(--md-grey-400);
  --jp-border-color2: var(--md-grey-300);
  --jp-border-color3: var(--md-grey-200);
  --jp-border-radius: 2px;

  /* UI Fonts
   *
   * The UI font CSS variables are used for the typography all of the JupyterLab
   * user interface elements that are not directly user generated content.
   *
   * The font sizing here is done assuming that the body font size of --jp-ui-font-size1
   * is applied to a parent element. When children elements, such as headings, are sized
   * in em all things will be computed relative to that body size.
   */

  --jp-ui-font-scale-factor: 1.2;
  --jp-ui-font-size0: 0.83333em;
  --jp-ui-font-size1: 13px; /* Base font size */
  --jp-ui-font-size2: 1.2em;
  --jp-ui-font-size3: 1.44em;

  --jp-ui-font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica,
    Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol';

  /*
   * Use these font colors against the corresponding main layout colors.
   * In a light theme, these go from dark to light.
   */

  /* Defaults use Material Design specification */
  --jp-ui-font-color0: rgba(0, 0, 0, 1);
  --jp-ui-font-color1: rgba(0, 0, 0, 0.87);
  --jp-ui-font-color2: rgba(0, 0, 0, 0.54);
  --jp-ui-font-color3: rgba(0, 0, 0, 0.38);

  /*
   * Use these against the brand/accent/warn/error colors.
   * These will typically go from light to darker, in both a dark and light theme.
   */

  --jp-ui-inverse-font-color0: rgba(255, 255, 255, 1);
  --jp-ui-inverse-font-color1: rgba(255, 255, 255, 1);
  --jp-ui-inverse-font-color2: rgba(255, 255, 255, 0.7);
  --jp-ui-inverse-font-color3: rgba(255, 255, 255, 0.5);

  /* Content Fonts
   *
   * Content font variables are used for typography of user generated content.
   *
   * The font sizing here is done assuming that the body font size of --jp-content-font-size1
   * is applied to a parent element. When children elements, such as headings, are sized
   * in em all things will be computed relative to that body size.
   */

  --jp-content-line-height: 1.6;
  --jp-content-font-scale-factor: 1.2;
  --jp-content-font-size0: 0.83333em;
  --jp-content-font-size1: 14px; /* Base font size */
  --jp-content-font-size2: 1.2em;
  --jp-content-font-size3: 1.44em;
  --jp-content-font-size4: 1.728em;
  --jp-content-font-size5: 2.0736em;

  /* This gives a magnification of about 125% in presentation mode over normal. */
  --jp-content-presentation-font-size1: 17px;

  --jp-content-heading-line-height: 1;
  --jp-content-heading-margin-top: 1.2em;
  --jp-content-heading-margin-bottom: 0.8em;
  --jp-content-heading-font-weight: 500;

  /* Defaults use Material Design specification */
  --jp-content-font-color0: rgba(0, 0, 0, 1);
  --jp-content-font-color1: rgba(0, 0, 0, 0.87);
  --jp-content-font-color2: rgba(0, 0, 0, 0.54);
  --jp-content-font-color3: rgba(0, 0, 0, 0.38);

  --jp-content-link-color: var(--md-blue-700);

  --jp-content-font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI',
    Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji',
    'Segoe UI Symbol';

  /*
   * Code Fonts
   *
   * Code font variables are used for typography of code and other monospaces content.
   */

  --jp-code-font-size: 13px;
  --jp-code-line-height: 1.3077; /* 17px for 13px base */
  --jp-code-padding: 5px; /* 5px for 13px base, codemirror highlighting needs integer px value */
  --jp-code-font-family-default: Menlo, Consolas, 'DejaVu Sans Mono', monospace;
  --jp-code-font-family: var(--jp-code-font-family-default);

  /* This gives a magnification of about 125% in presentation mode over normal. */
  --jp-code-presentation-font-size: 16px;

  /* may need to tweak cursor width if you change font size */
  --jp-code-cursor-width0: 1.4px;
  --jp-code-cursor-width1: 2px;
  --jp-code-cursor-width2: 4px;

  /* Layout
   *
   * The following are the main layout colors use in JupyterLab. In a light
   * theme these would go from light to dark.
   */

  --jp-layout-color0: white;
  --jp-layout-color1: white;
  --jp-layout-color2: var(--md-grey-200);
  --jp-layout-color3: var(--md-grey-400);
  --jp-layout-color4: var(--md-grey-600);

  /* Inverse Layout
   *
   * The following are the inverse layout colors use in JupyterLab. In a light
   * theme these would go from dark to light.
   */

  --jp-inverse-layout-color0: #111111;
  --jp-inverse-layout-color1: var(--md-grey-900);
  --jp-inverse-layout-color2: var(--md-grey-800);
  --jp-inverse-layout-color3: var(--md-grey-700);
  --jp-inverse-layout-color4: var(--md-grey-600);

  /* Brand/accent */

  --jp-brand-color0: var(--md-blue-900);
  --jp-brand-color1: var(--md-blue-700);
  --jp-brand-color2: var(--md-blue-300);
  --jp-brand-color3: var(--md-blue-100);
  --jp-brand-color4: var(--md-blue-50);

  --jp-accent-color0: var(--md-green-900);
  --jp-accent-color1: var(--md-green-700);
  --jp-accent-color2: var(--md-green-300);
  --jp-accent-color3: var(--md-green-100);

  /* State colors (warn, error, success, info) */

  --jp-warn-color0: var(--md-orange-900);
  --jp-warn-color1: var(--md-orange-700);
  --jp-warn-color2: var(--md-orange-300);
  --jp-warn-color3: var(--md-orange-100);

  --jp-error-color0: var(--md-red-900);
  --jp-error-color1: var(--md-red-700);
  --jp-error-color2: var(--md-red-300);
  --jp-error-color3: var(--md-red-100);

  --jp-success-color0: var(--md-green-900);
  --jp-success-color1: var(--md-green-700);
  --jp-success-color2: var(--md-green-300);
  --jp-success-color3: var(--md-green-100);

  --jp-info-color0: var(--md-cyan-900);
  --jp-info-color1: var(--md-cyan-700);
  --jp-info-color2: var(--md-cyan-300);
  --jp-info-color3: var(--md-cyan-100);

  /* Cell specific styles */

  --jp-cell-padding: 5px;

  --jp-cell-collapser-width: 8px;
  --jp-cell-collapser-min-height: 20px;
  --jp-cell-collapser-not-active-hover-opacity: 0.6;

  --jp-cell-editor-background: var(--md-grey-100);
  --jp-cell-editor-border-color: var(--md-grey-300);
  --jp-cell-editor-box-shadow: inset 0 0 2px var(--md-blue-300);
  --jp-cell-editor-active-background: var(--jp-layout-color0);
  --jp-cell-editor-active-border-color: var(--jp-brand-color1);

  --jp-cell-prompt-width: 64px;
  --jp-cell-prompt-font-family: var(--jp-code-font-family-default);
  --jp-cell-prompt-letter-spacing: 0px;
  --jp-cell-prompt-opacity: 1;
  --jp-cell-prompt-not-active-opacity: 0.5;
  --jp-cell-prompt-not-active-font-color: var(--md-grey-700);
  /* A custom blend of MD grey and blue 600
   * See https://meyerweb.com/eric/tools/color-blend/#546E7A:1E88E5:5:hex */
  --jp-cell-inprompt-font-color: #307fc1;
  /* A custom blend of MD grey and orange 600
   * https://meyerweb.com/eric/tools/color-blend/#546E7A:F4511E:5:hex */
  --jp-cell-outprompt-font-color: #bf5b3d;

  /* Notebook specific styles */

  --jp-notebook-padding: 10px;
  --jp-notebook-select-background: var(--jp-layout-color1);
  --jp-notebook-multiselected-color: var(--md-blue-50);

  /* The scroll padding is calculated to fill enough space at the bottom of the
  notebook to show one single-line cell (with appropriate padding) at the top
  when the notebook is scrolled all the way to the bottom. We also subtract one
  pixel so that no scrollbar appears if we have just one single-line cell in the
  notebook. This padding is to enable a 'scroll past end' feature in a notebook.
  */
  --jp-notebook-scroll-padding: calc(
    100% - var(--jp-code-font-size) * var(--jp-code-line-height) -
      var(--jp-code-padding) - var(--jp-cell-padding) - 1px
  );

  /* Rendermime styles */

  --jp-rendermime-error-background: #fdd;
  --jp-rendermime-table-row-background: var(--md-grey-100);
  --jp-rendermime-table-row-hover-background: var(--md-light-blue-50);

  /* Dialog specific styles */

  --jp-dialog-background: rgba(0, 0, 0, 0.25);

  /* Console specific styles */

  --jp-console-padding: 10px;

  /* Toolbar specific styles */

  --jp-toolbar-border-color: var(--jp-border-color1);
  --jp-toolbar-micro-height: 8px;
  --jp-toolbar-background: var(--jp-layout-color1);
  --jp-toolbar-box-shadow: 0px 0px 2px 0px rgba(0, 0, 0, 0.24);
  --jp-toolbar-header-margin: 4px 4px 0px 4px;
  --jp-toolbar-active-background: var(--md-grey-300);

  /* Statusbar specific styles */

  --jp-statusbar-height: 24px;

  /* Input field styles */

  --jp-input-box-shadow: inset 0 0 2px var(--md-blue-300);
  --jp-input-active-background: var(--jp-layout-color1);
  --jp-input-hover-background: var(--jp-layout-color1);
  --jp-input-background: var(--md-grey-100);
  --jp-input-border-color: var(--jp-border-color1);
  --jp-input-active-border-color: var(--jp-brand-color1);
  --jp-input-active-box-shadow-color: rgba(19, 124, 189, 0.3);

  /* General editor styles */

  --jp-editor-selected-background: #d9d9d9;
  --jp-editor-selected-focused-background: #d7d4f0;
  --jp-editor-cursor-color: var(--jp-ui-font-color0);

  /* Code mirror specific styles */

  --jp-mirror-editor-keyword-color: #008000;
  --jp-mirror-editor-atom-color: #88f;
  --jp-mirror-editor-number-color: #080;
  --jp-mirror-editor-def-color: #00f;
  --jp-mirror-editor-variable-color: var(--md-grey-900);
  --jp-mirror-editor-variable-2-color: #05a;
  --jp-mirror-editor-variable-3-color: #085;
  --jp-mirror-editor-punctuation-color: #05a;
  --jp-mirror-editor-property-color: #05a;
  --jp-mirror-editor-operator-color: #aa22ff;
  --jp-mirror-editor-comment-color: #408080;
  --jp-mirror-editor-string-color: #ba2121;
  --jp-mirror-editor-string-2-color: #708;
  --jp-mirror-editor-meta-color: #aa22ff;
  --jp-mirror-editor-qualifier-color: #555;
  --jp-mirror-editor-builtin-color: #008000;
  --jp-mirror-editor-bracket-color: #997;
  --jp-mirror-editor-tag-color: #170;
  --jp-mirror-editor-attribute-color: #00c;
  --jp-mirror-editor-header-color: blue;
  --jp-mirror-editor-quote-color: #090;
  --jp-mirror-editor-link-color: #00c;
  --jp-mirror-editor-error-color: #f00;
  --jp-mirror-editor-hr-color: #999;

  /* Vega extension styles */

  --jp-vega-background: white;

  /* Sidebar-related styles */

  --jp-sidebar-min-width: 250px;

  /* Search-related styles */

  --jp-search-toggle-off-opacity: 0.5;
  --jp-search-toggle-hover-opacity: 0.8;
  --jp-search-toggle-on-opacity: 1;
  --jp-search-selected-match-background-color: rgb(245, 200, 0);
  --jp-search-selected-match-color: black;
  --jp-search-unselected-match-background-color: var(
    --jp-inverse-layout-color0
  );
  --jp-search-unselected-match-color: var(--jp-ui-inverse-font-color0);

  /* Icon colors that work well with light or dark backgrounds */
  --jp-icon-contrast-color0: var(--md-purple-600);
  --jp-icon-contrast-color1: var(--md-green-600);
  --jp-icon-contrast-color2: var(--md-pink-600);
  --jp-icon-contrast-color3: var(--md-blue-600);
}
</style>

<style type="text/css">
/* Force rendering true colors when outputing to pdf */
* {
  -webkit-print-color-adjust: exact;
}

/* Misc */
a.anchor-link {
  display: none;
}

.highlight  {
  margin: 0.4em;
}

/* Input area styling */
.jp-InputArea {
  overflow: hidden;
}

.jp-InputArea-editor {
  overflow: hidden;
}

.CodeMirror pre {
  margin: 0;
  padding: 0;
}

/* Using table instead of flexbox so that we can use break-inside property */
/* CSS rules under this comment should not be required anymore after we move to the JupyterLab 4.0 CSS */


.jp-CodeCell.jp-mod-outputsScrolled .jp-OutputArea-prompt {
  min-width: calc(
    var(--jp-cell-prompt-width) - var(--jp-private-cell-scrolling-output-offset)
  );
}

.jp-OutputArea-child {
  display: table;
  width: 100%;
}

.jp-OutputPrompt {
  display: table-cell;
  vertical-align: top;
  min-width: var(--jp-cell-prompt-width);
}

body[data-format='mobile'] .jp-OutputPrompt {
  display: table-row;
}

.jp-OutputArea-output {
  display: table-cell;
  width: 100%;
}

body[data-format='mobile'] .jp-OutputArea-child .jp-OutputArea-output {
  display: table-row;
}

.jp-OutputArea-output.jp-OutputArea-executeResult {
  width: 100%;
}

/* Hiding the collapser by default */
.jp-Collapser {
  display: none;
}

@media print {
  .jp-Cell-inputWrapper,
  .jp-Cell-outputWrapper {
    display: block;
  }

  .jp-OutputArea-child {
    break-inside: avoid-page;
  }
}
</style>

<!-- Load mathjax -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/latest.js?config=TeX-AMS_CHTML-full,Safe"> </script>
    <!-- MathJax configuration -->
    <script type="text/x-mathjax-config">
    init_mathjax = function() {
        if (window.MathJax) {
        // MathJax loaded
            MathJax.Hub.Config({
                TeX: {
                    equationNumbers: {
                    autoNumber: "AMS",
                    useLabelIds: true
                    }
                },
                tex2jax: {
                    inlineMath: [ ['$','$'], ["\\(","\\)"] ],
                    displayMath: [ ['$$','$$'], ["\\[","\\]"] ],
                    processEscapes: true,
                    processEnvironments: true
                },
                displayAlign: 'center',
                CommonHTML: {
                    linebreaks: {
                    automatic: true
                    }
                }
            });

            MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
        }
    }
    init_mathjax();
    </script>
    <!-- End of mathjax configuration --></head>
<body class="jp-Notebook" data-jp-theme-light="true" data-jp-theme-name="JupyterLab Light">

<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<p><img src="https://insights.dice.com/wp-content/uploads/2018/01/Salary-Satisfaction-Dice.jpeg" alt=""></p>
<h1 id="Introduction">Introduction<a class="anchor-link" href="#Introduction">&#182;</a></h1><p>This week we are using SQLite3 to explore our SQL dataset.  Instead of using the provided CSV file, I think this is a great exercise to run some SQL queries and exercises. <strong>As a data analyst, SQL will be your primary language, not Python or R</strong>. You will hear me repeating this for the rest of your life so deal with it.</p>
<p>For this week's exercise, I will be combining SQL practices and the exploratory data analysis for this dataset. I have received feedbacks that the exercises I have created were too easy. Filling in the blanks was a piece of cake and you want to up the challenge. Alrighty! I have heard you loud and clear! Instead of filling in the blanks, I will guide you on your task and you will code from scratch for that section. For those that are struggling, feel free to message me for help. I have never stepped out of my house for the past 24 days, I will love to get some social interaction to regain back my sanity... and also here is the template to ask any question.</p>
<ol>
<li>Give me a summary of the question.</li>
<li>Tell me what you have done and what you think the possible reason for the issue is </li>
<li>What did Google, reddit, stackoverflow, quora say?</li>
<li>Start your question with 'Hi' and end it off with 'Thank you', I am not a big fan of self-entitled living beings. </li>
</ol>
<p><img src="https://media.giphy.com/media/yoJC2i270b1mQvcDdK/giphy.gif" alt="alt text"></p>
<p>Alright, let's start!</p>

</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="c1"># Importing required packages </span>
<span class="kn">import</span> <span class="nn">sqlite3</span>
<span class="kn">import</span> <span class="nn">numpy</span> <span class="k">as</span> <span class="nn">np</span>
<span class="kn">import</span> <span class="nn">pandas</span> <span class="k">as</span> <span class="nn">pd</span>
<span class="kn">import</span> <span class="nn">matplotlib.pyplot</span> <span class="k">as</span> <span class="nn">plt</span>
<span class="kn">import</span> <span class="nn">seaborn</span> <span class="k">as</span> <span class="nn">sns</span>
<span class="n">sns</span><span class="o">.</span><span class="n">set</span><span class="p">()</span> <span class="c1"># Making sns as default for plots </span>

<span class="c1"># Importing dataset into colab</span>
<span class="c1"># As we are working with colab, we will need to use the following code to import the dataset into this notebook</span>
<span class="kn">from</span> <span class="nn">google.colab</span> <span class="kn">import</span> <span class="n">files</span> 
<span class="n">uploaded</span> <span class="o">=</span> <span class="n">files</span><span class="o">.</span><span class="n">upload</span><span class="p">()</span> <span class="c1"># Here I need you to upload the database.sqlite file</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>


<div class="jp-RenderedText jp-OutputArea-output" data-mime-type="application/vnd.jupyter.stderr">
<pre>/usr/local/lib/python3.6/dist-packages/statsmodels/tools/_testing.py:19: FutureWarning: pandas.util.testing is deprecated. Use the functions in the public API at pandas.testing instead.
  import pandas.util.testing as tm
</pre>
</div>
</div>

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>



<div class="jp-RenderedHTMLCommon jp-RenderedHTML jp-OutputArea-output " data-mime-type="text/html">

     <input type="file" id="files-573d5f4b-7a07-4252-8171-07f183a820bd" name="files[]" multiple disabled />
     <output id="result-573d5f4b-7a07-4252-8171-07f183a820bd">
      Upload widget is only available when the cell has been executed in the
      current browser session. Please rerun this cell to enable.
      </output>
      <script src="/nbextensions/google.colab/files.js"></script> 
</div>

</div>

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>


<div class="jp-RenderedText jp-OutputArea-output" data-mime-type="text/plain">
<pre>Saving database.sqlite to database.sqlite
</pre>
</div>
</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Creating-a-database-connection">Creating a database connection<a class="anchor-link" href="#Creating-a-database-connection">&#182;</a></h2><p><img src="https://i.imgur.com/M54eUxK.png" alt="alt text"></p>
<ol>
<li>Click on that</li>
</ol>
<p><img src="https://i.imgur.com/RNzhq3a.png" alt="alt text"></p>
<ol>
<li>Right click and copy path on database.sqlite</li>
<li>Now, paste it on sqlite3.connect like did below.</li>
<li>To make any queries, you will need to use:<div class="highlight"><pre><span></span><span class="n">data</span> <span class="o">=</span> <span class="n">pd</span><span class="o">.</span><span class="n">read_sql_query</span><span class="p">(</span><span class="s2">&quot;Select blah blah;&quot;</span><span class="p">,</span> <span class="n">con</span><span class="p">)</span>
<span class="nb">print</span><span class="p">(</span><span class="n">data</span><span class="p">)</span>
</pre></div>
</li>
</ol>
<p>In this example, I will show the first 5 rows of data. Execute the code below to see.</p>

</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="n">con</span> <span class="o">=</span> <span class="n">sqlite3</span><span class="o">.</span><span class="n">connect</span><span class="p">(</span><span class="s1">&#39;/content/database.sqlite&#39;</span><span class="p">)</span> 
<span class="n">data</span> <span class="o">=</span> <span class="n">pd</span><span class="o">.</span><span class="n">read_sql_query</span><span class="p">(</span><span class="s2">&quot;Select * from salaries limit 5;&quot;</span><span class="p">,</span> <span class="n">con</span><span class="p">)</span>
<span class="n">data</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt">Out[&nbsp;]:</div>



<div class="jp-RenderedHTMLCommon jp-RenderedHTML jp-OutputArea-output jp-OutputArea-executeResult" data-mime-type="text/html">
<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Id</th>
      <th>EmployeeName</th>
      <th>JobTitle</th>
      <th>BasePay</th>
      <th>OvertimePay</th>
      <th>OtherPay</th>
      <th>Benefits</th>
      <th>TotalPay</th>
      <th>TotalPayBenefits</th>
      <th>Year</th>
      <th>Notes</th>
      <th>Agency</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>NATHANIEL FORD</td>
      <td>GENERAL MANAGER-METROPOLITAN TRANSIT AUTHORITY</td>
      <td>167411.18</td>
      <td>0.00</td>
      <td>400184.25</td>
      <td></td>
      <td>567595.43</td>
      <td>567595.43</td>
      <td>2011</td>
      <td></td>
      <td>San Francisco</td>
      <td></td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>GARY JIMENEZ</td>
      <td>CAPTAIN III (POLICE DEPARTMENT)</td>
      <td>155966.02</td>
      <td>245131.88</td>
      <td>137811.38</td>
      <td></td>
      <td>538909.28</td>
      <td>538909.28</td>
      <td>2011</td>
      <td></td>
      <td>San Francisco</td>
      <td></td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>ALBERT PARDINI</td>
      <td>CAPTAIN III (POLICE DEPARTMENT)</td>
      <td>212739.13</td>
      <td>106088.18</td>
      <td>16452.60</td>
      <td></td>
      <td>335279.91</td>
      <td>335279.91</td>
      <td>2011</td>
      <td></td>
      <td>San Francisco</td>
      <td></td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>CHRISTOPHER CHONG</td>
      <td>WIRE ROPE CABLE MAINTENANCE MECHANIC</td>
      <td>77916.00</td>
      <td>56120.71</td>
      <td>198306.90</td>
      <td></td>
      <td>332343.61</td>
      <td>332343.61</td>
      <td>2011</td>
      <td></td>
      <td>San Francisco</td>
      <td></td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>PATRICK GARDNER</td>
      <td>DEPUTY CHIEF OF DEPARTMENT,(FIRE DEPARTMENT)</td>
      <td>134401.60</td>
      <td>9737.00</td>
      <td>182234.59</td>
      <td></td>
      <td>326373.19</td>
      <td>326373.19</td>
      <td>2011</td>
      <td></td>
      <td>San Francisco</td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Exercise-1">Exercise 1<a class="anchor-link" href="#Exercise-1">&#182;</a></h2><p>Print the first 5 rows of EmployeeName</p>

</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="n">data</span> <span class="o">=</span> <span class="n">pd</span><span class="o">.</span><span class="n">read_sql_query</span><span class="p">(</span><span class="s2">&quot;Select employeename from salaries limit 5;&quot;</span><span class="p">,</span> <span class="n">con</span><span class="p">)</span>
<span class="n">data</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt">Out[&nbsp;]:</div>



<div class="jp-RenderedHTMLCommon jp-RenderedHTML jp-OutputArea-output jp-OutputArea-executeResult" data-mime-type="text/html">
<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>EmployeeName</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>NATHANIEL FORD</td>
    </tr>
    <tr>
      <th>1</th>
      <td>GARY JIMENEZ</td>
    </tr>
    <tr>
      <th>2</th>
      <td>ALBERT PARDINI</td>
    </tr>
    <tr>
      <th>3</th>
      <td>CHRISTOPHER CHONG</td>
    </tr>
    <tr>
      <th>4</th>
      <td>PATRICK GARDNER</td>
    </tr>
  </tbody>
</table>
</div>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Exercise-2">Exercise 2<a class="anchor-link" href="#Exercise-2">&#182;</a></h2><p>Print the name of the top 5 employees with the highest totalpay</p>

</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="n">data</span> <span class="o">=</span> <span class="n">pd</span><span class="o">.</span><span class="n">read_sql_query</span><span class="p">(</span><span class="s2">&quot;Select employeename from salaries order by totalpay limit 5;&quot;</span><span class="p">,</span> <span class="n">con</span><span class="p">)</span>
<span class="n">data</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt">Out[&nbsp;]:</div>



<div class="jp-RenderedHTMLCommon jp-RenderedHTML jp-OutputArea-output jp-OutputArea-executeResult" data-mime-type="text/html">
<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>EmployeeName</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Joe Lopez</td>
    </tr>
    <tr>
      <th>1</th>
      <td>PAULETTE ADAMS</td>
    </tr>
    <tr>
      <th>2</th>
      <td>KAUKAB MOHSIN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>JOSEPHINE MCCREARY</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Roland Baylon</td>
    </tr>
  </tbody>
</table>
</div>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Exercise-3">Exercise 3<a class="anchor-link" href="#Exercise-3">&#182;</a></h2><p>Print the average basepay round off to 2 decimal places</p>

</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="n">data</span> <span class="o">=</span> <span class="n">pd</span><span class="o">.</span><span class="n">read_sql_query</span><span class="p">(</span><span class="s2">&quot;Select round(avg(basepay),2) from salaries;&quot;</span><span class="p">,</span> <span class="n">con</span><span class="p">)</span>
<span class="n">data</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt">Out[&nbsp;]:</div>



<div class="jp-RenderedHTMLCommon jp-RenderedHTML jp-OutputArea-output jp-OutputArea-executeResult" data-mime-type="text/html">
<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>round(avg(basepay),2)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>66053.73</td>
    </tr>
  </tbody>
</table>
</div>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Exercise-4">Exercise 4<a class="anchor-link" href="#Exercise-4">&#182;</a></h2><p>Print name of employees with more than $20000 overtimepay in the year 2012</p>

</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="n">data</span> <span class="o">=</span> <span class="n">pd</span><span class="o">.</span><span class="n">read_sql_query</span><span class="p">(</span><span class="s2">&quot;Select employeename from salaries where overtimepay &gt; 20000 and year = 2012;&quot;</span><span class="p">,</span> <span class="n">con</span><span class="p">)</span>
<span class="n">data</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt">Out[&nbsp;]:</div>



<div class="jp-RenderedHTMLCommon jp-RenderedHTML jp-OutputArea-output jp-OutputArea-executeResult" data-mime-type="text/html">
<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>EmployeeName</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Gary Altenberg</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Khoa Trinh</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Frederick Binkley</td>
    </tr>
    <tr>
      <th>3</th>
      <td>David Franklin</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Brendan Ward</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
    </tr>
    <tr>
      <th>2738</th>
      <td>Romelio Perez</td>
    </tr>
    <tr>
      <th>2739</th>
      <td>Edith De Glover</td>
    </tr>
    <tr>
      <th>2740</th>
      <td>Nicholas Sepich</td>
    </tr>
    <tr>
      <th>2741</th>
      <td>Waynne Alday</td>
    </tr>
    <tr>
      <th>2742</th>
      <td>Jennifer Rose Que</td>
    </tr>
  </tbody>
</table>
<p>2743 rows × 1 columns</p>
</div>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Exercise-5">Exercise 5<a class="anchor-link" href="#Exercise-5">&#182;</a></h2><p>Print the number of people with 0 overtime pay</p>

</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="n">data</span> <span class="o">=</span> <span class="n">pd</span><span class="o">.</span><span class="n">read_sql_query</span><span class="p">(</span><span class="s2">&quot;Select count(*) from salaries where overtimepay = 0;&quot;</span><span class="p">,</span> <span class="n">con</span><span class="p">)</span>
<span class="n">data</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt">Out[&nbsp;]:</div>



<div class="jp-RenderedHTMLCommon jp-RenderedHTML jp-OutputArea-output jp-OutputArea-executeResult" data-mime-type="text/html">
<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>count(*)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>77321</td>
    </tr>
  </tbody>
</table>
</div>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Now,-let's-move-on-with-the-EDA.">Now, let's move on with the EDA.<a class="anchor-link" href="#Now,-let's-move-on-with-the-EDA.">&#182;</a></h2><ul>
<li>Create a function that print the following:<ul>
<li>Read a CSV file into a dataframe</li>
<li>Print 5 rows of data</li>
<li>Print number of rows and columns</li>
<li>Print datatype for each column</li>
<li>Print number of NULL/NaN values for each column</li>
<li>Print summary data using describe()</li>
<li>Assign the dataframe into a variable call df</li>
</ul>
</li>
</ul>

</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="k">def</span> <span class="nf">overview</span><span class="p">():</span>
    <span class="sd">&#39;&#39;&#39;</span>
<span class="sd">    Read a comma-separated values (csv) file into DataFrame.</span>
<span class="sd">    Print 5 rows of data</span>
<span class="sd">    Print number of rows and columns</span>
<span class="sd">    Print datatype for each column</span>
<span class="sd">    Print number of NULL/NaN values for each column</span>
<span class="sd">    Print summary data</span>
<span class="sd">    </span>
<span class="sd">    Return:</span>
<span class="sd">    data, rtype: DataFrame</span>
<span class="sd">    &#39;&#39;&#39;</span>
    <span class="n">data</span> <span class="o">=</span> <span class="n">pd</span><span class="o">.</span><span class="n">read_sql_query</span><span class="p">(</span><span class="s2">&quot;Select * from salaries;&quot;</span><span class="p">,</span> <span class="n">con</span><span class="p">)</span>
    <span class="nb">print</span><span class="p">(</span><span class="s2">&quot;The first 5 rows if data are:</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">,</span> <span class="n">data</span><span class="o">.</span><span class="n">head</span><span class="p">())</span>
    <span class="nb">print</span><span class="p">(</span><span class="s2">&quot;</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">)</span>
    <span class="nb">print</span><span class="p">(</span><span class="s2">&quot;The (Row,Column) is:</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">,</span> <span class="n">data</span><span class="o">.</span><span class="n">shape</span><span class="p">)</span>
    <span class="nb">print</span><span class="p">(</span><span class="s2">&quot;</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">)</span>
    <span class="nb">print</span><span class="p">(</span><span class="s2">&quot;Data type of each column:</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">,</span> <span class="n">data</span><span class="o">.</span><span class="n">dtypes</span><span class="p">)</span>
    <span class="nb">print</span><span class="p">(</span><span class="s2">&quot;</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">)</span>
    <span class="nb">print</span><span class="p">(</span><span class="s2">&quot;The number of null values in each column are:</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">,</span> <span class="n">data</span><span class="o">.</span><span class="n">isnull</span><span class="p">()</span><span class="o">.</span><span class="n">sum</span><span class="p">())</span>
    <span class="nb">print</span><span class="p">(</span><span class="s2">&quot;</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">)</span>
    <span class="nb">print</span><span class="p">(</span><span class="s2">&quot;Summary of all the test scores:</span><span class="se">\n</span><span class="s2">&quot;</span><span class="p">,</span> <span class="n">data</span><span class="o">.</span><span class="n">describe</span><span class="p">())</span>
    <span class="k">return</span> <span class="n">data</span>

<span class="n">df</span> <span class="o">=</span> <span class="n">overview</span><span class="p">()</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>


<div class="jp-RenderedText jp-OutputArea-output" data-mime-type="text/plain">
<pre>The first 5 rows if data are:
    Id       EmployeeName  ...         Agency Status
0   1     NATHANIEL FORD  ...  San Francisco       
1   2       GARY JIMENEZ  ...  San Francisco       
2   3     ALBERT PARDINI  ...  San Francisco       
3   4  CHRISTOPHER CHONG  ...  San Francisco       
4   5    PATRICK GARDNER  ...  San Francisco       

[5 rows x 13 columns]


The (Row,Column) is:
 (148654, 13)


Data type of each column:
 Id                    int64
EmployeeName         object
JobTitle             object
BasePay              object
OvertimePay          object
OtherPay             object
Benefits             object
TotalPay            float64
TotalPayBenefits    float64
Year                  int64
Notes                object
Agency               object
Status               object
dtype: object


The number of null values in each column are:
 Id                  0
EmployeeName        0
JobTitle            0
BasePay             0
OvertimePay         0
OtherPay            0
Benefits            0
TotalPay            0
TotalPayBenefits    0
Year                0
Notes               0
Agency              0
Status              0
dtype: int64


Summary of all the test scores:
                   Id       TotalPay  TotalPayBenefits           Year
count  148654.000000  148654.000000     148654.000000  148654.000000
mean    74327.500000   74768.321972      93692.554811    2012.522643
std     42912.857795   50517.005274      62793.533483       1.117538
min         1.000000    -618.130000       -618.130000    2011.000000
25%     37164.250000   36168.995000      44065.650000    2012.000000
50%     74327.500000   71426.610000      92404.090000    2013.000000
75%    111490.750000  105839.135000     132876.450000    2014.000000
max    148654.000000  567595.430000     567595.430000    2014.000000
</pre>
</div>
</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h3 id="What-do-we-see-here">What do we see here<a class="anchor-link" href="#What-do-we-see-here">&#182;</a></h3><ul>
<li>It seems like this data spans from 2011 to 2014</li>
<li>Although we do not see any NaN data, we do see that there are some fields with "Not Provided". We will need to replace these with NaN.</li>
</ul>

</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="n">df</span> <span class="o">=</span> <span class="n">df</span><span class="o">.</span><span class="n">replace</span><span class="p">(</span><span class="s1">&#39;Not Provided&#39;</span><span class="p">,</span> <span class="n">np</span><span class="o">.</span><span class="n">nan</span><span class="p">)</span>
<span class="n">df</span> <span class="o">=</span> <span class="n">df</span><span class="o">.</span><span class="n">dropna</span><span class="p">()</span>
<span class="n">df</span><span class="o">.</span><span class="n">isnull</span><span class="p">()</span><span class="o">.</span><span class="n">sum</span><span class="p">()</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt">Out[&nbsp;]:</div>




<div class="jp-RenderedText jp-OutputArea-output jp-OutputArea-executeResult" data-mime-type="text/plain">
<pre>Id                  0
EmployeeName        0
JobTitle            0
BasePay             0
OvertimePay         0
OtherPay            0
Benefits            0
TotalPay            0
TotalPayBenefits    0
Year                0
Notes               0
Agency              0
Status              0
dtype: int64</pre>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Converting-variables-with-object-types-to-numeric">Converting variables with object types to numeric<a class="anchor-link" href="#Converting-variables-with-object-types-to-numeric">&#182;</a></h2><ul>
<li>If we look into the data type of Basepay, Overtimepay, Otherpay and Benefits, we will notice that the data type for these variables is object. Since we will need to perform numerical analysis on these variables, we will need to convert them to a numeric type.</li>
</ul>

</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="c1"># Converting objects to numerics</span>
<span class="k">def</span> <span class="nf">convert</span><span class="p">(</span><span class="n">variable</span><span class="p">):</span>
  <span class="n">df</span><span class="p">[</span><span class="n">variable</span><span class="p">]</span> <span class="o">=</span> <span class="n">pd</span><span class="o">.</span><span class="n">to_numeric</span><span class="p">(</span><span class="n">df</span><span class="p">[</span><span class="n">variable</span><span class="p">])</span>

<span class="n">lst</span> <span class="o">=</span> <span class="p">[</span><span class="s1">&#39;BasePay&#39;</span><span class="p">,</span> <span class="s1">&#39;OvertimePay&#39;</span><span class="p">,</span> <span class="s1">&#39;OtherPay&#39;</span><span class="p">,</span> <span class="s1">&#39;Benefits&#39;</span><span class="p">]</span>
<span class="k">for</span> <span class="n">i</span> <span class="ow">in</span> <span class="n">lst</span><span class="p">:</span>
  <span class="n">convert</span><span class="p">(</span><span class="n">i</span><span class="p">)</span>
<span class="n">df</span><span class="o">.</span><span class="n">dtypes</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt">Out[&nbsp;]:</div>




<div class="jp-RenderedText jp-OutputArea-output jp-OutputArea-executeResult" data-mime-type="text/plain">
<pre>Id                    int64
EmployeeName         object
JobTitle             object
BasePay             float64
OvertimePay         float64
OtherPay            float64
Benefits            float64
TotalPay            float64
TotalPayBenefits    float64
Year                  int64
Notes                object
Agency               object
Status               object
dtype: object</pre>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Top-5-jobs-in-the-dataset">Top 5 jobs in the dataset<a class="anchor-link" href="#Top-5-jobs-in-the-dataset">&#182;</a></h2>
</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="n">df</span><span class="p">[</span><span class="s1">&#39;JobTitle&#39;</span><span class="p">]</span><span class="o">.</span><span class="n">value_counts</span><span class="p">()</span><span class="o">.</span><span class="n">head</span><span class="p">()</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt">Out[&nbsp;]:</div>




<div class="jp-RenderedText jp-OutputArea-output jp-OutputArea-executeResult" data-mime-type="text/plain">
<pre>Transit Operator                7036
Special Nurse                   4389
Registered Nurse                3736
Public Svc Aide-Public Works    2518
Police Officer 3                2421
Name: JobTitle, dtype: int64</pre>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Create-a-correlation-matrix-using-sns.heatmap">Create a correlation matrix using sns.heatmap<a class="anchor-link" href="#Create-a-correlation-matrix-using-sns.heatmap">&#182;</a></h2>
</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="n">corrMatrix</span> <span class="o">=</span> <span class="n">df</span><span class="o">.</span><span class="n">corr</span><span class="p">()</span>
<span class="n">sns</span><span class="o">.</span><span class="n">heatmap</span><span class="p">(</span><span class="n">corrMatrix</span><span class="p">,</span> <span class="n">annot</span><span class="o">=</span><span class="kc">True</span><span class="p">)</span>
<span class="n">plt</span><span class="o">.</span><span class="n">show</span><span class="p">()</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>




<div class="jp-RenderedImage jp-OutputArea-output ">
<img src="data:image/png;base64,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"
class="
jp-needs-light-background
"
>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Calculate-the-median-value-for-each-job-type">Calculate the median value for each job type<a class="anchor-link" href="#Calculate-the-median-value-for-each-job-type">&#182;</a></h2>
</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="nb">round</span><span class="p">(</span><span class="n">df</span><span class="o">.</span><span class="n">groupby</span><span class="p">([</span><span class="s1">&#39;JobTitle&#39;</span><span class="p">])[</span><span class="s1">&#39;BasePay&#39;</span><span class="p">]</span><span class="o">.</span><span class="n">median</span><span class="p">(),</span><span class="mi">3</span><span class="p">)</span><span class="o">.</span><span class="n">nlargest</span><span class="p">(</span><span class="mi">10</span><span class="p">)</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt">Out[&nbsp;]:</div>




<div class="jp-RenderedText jp-OutputArea-output jp-OutputArea-executeResult" data-mime-type="text/plain">
<pre>JobTitle
Chief of Police                           307450.040
Chief, Fire Department                    302068.000
Gen Mgr, Public Trnsp Dept                294000.180
CHIEF OF DEPARTMENT, (FIRE DEPARTMENT)    285262.000
Mayor                                     281537.170
Dep Dir for Investments, Ret              276153.765
Dept Head V                               270616.270
Adm, SFGH Medical Center                  268946.020
Controller                                267914.000
EXECUTIVE CONTRACT EMPLOYEE               264452.520
Name: BasePay, dtype: float64</pre>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Looking-into-the-distribution-of-total-pay-from-2011-to-2014">Looking into the distribution of total pay from 2011 to 2014<a class="anchor-link" href="#Looking-into-the-distribution-of-total-pay-from-2011-to-2014">&#182;</a></h2>
</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="n">g</span> <span class="o">=</span> <span class="n">sns</span><span class="o">.</span><span class="n">FacetGrid</span><span class="p">(</span><span class="n">df</span><span class="p">,</span> <span class="n">col</span><span class="o">=</span><span class="s2">&quot;Year&quot;</span><span class="p">,</span> <span class="n">col_wrap</span><span class="o">=</span><span class="mi">2</span><span class="p">,</span> <span class="n">size</span><span class="o">=</span><span class="mi">5</span><span class="p">)</span>
<span class="n">g</span><span class="o">.</span><span class="n">map</span><span class="p">(</span><span class="n">sns</span><span class="o">.</span><span class="n">distplot</span><span class="p">,</span> <span class="s1">&#39;TotalPay&#39;</span><span class="p">)</span>
<span class="n">g</span><span class="o">.</span><span class="n">fig</span><span class="o">.</span><span class="n">suptitle</span><span class="p">(</span><span class="s1">&#39;Graph showing distribution of total pay from 2011 to 2014&#39;</span><span class="p">,</span> <span class="n">fontsize</span> <span class="o">=</span> <span class="mi">20</span><span class="p">)</span>
<span class="n">g</span><span class="o">.</span><span class="n">fig</span><span class="o">.</span><span class="n">subplots_adjust</span><span class="p">(</span><span class="n">top</span><span class="o">=</span> <span class="mf">0.9</span><span class="p">)</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>


<div class="jp-RenderedText jp-OutputArea-output" data-mime-type="application/vnd.jupyter.stderr">
<pre>/usr/local/lib/python3.6/dist-packages/seaborn/axisgrid.py:243: UserWarning: The `size` parameter has been renamed to `height`; please update your code.
  warnings.warn(msg, UserWarning)
</pre>
</div>
</div>

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>




<div class="jp-RenderedImage jp-OutputArea-output ">
<img src="data:image/png;base64,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O+YCf9/t/farNC8G/qVs3c8DLw0reBFZn9bpPvW9uCni7gts+73W2veGeg9kXViV07wZY3bjRsDeaYx5Jq7ie0lI2x7ETSOTtNYWw9imiIiIiKwd3XCikJ8AZxtjLvcXGGMeY4yJ1LjOAmNM3BizJbDohcCvlByLiIiISCWrqoJsjPk48Hu4+RePARPW2ocbYx4DfAAYBZK4eRufVU+S6008fqN3vQju9JOvs9ba9twLEREREelmqypBFhERERHptG5osRARERERWTGrJUGO486e1w2zaoiIrHbap4qItGC17DzPAHZNTMxQLLan5WN0tI8TJ9Jt2fZK6Ob4uzl26O74uzl26O74l4t9bGywroHGTdI+dRndHH83xw6Kv5O6OXaoHX/Y+9TVUkFuu3g8tvxKq1g3x9/NsUN3x9/NsUN3x9/Nsdej2+9fN8ffzbGD4u+kbo4dVjb+dZMgi4iIiIjUQwmyiIiIiEiAEmQRERERkQAlyCIiIiIiAUqQRUREREQClCCLiIiIiAQoQRYRERERCVCCLCIiIiISoARZRERERCRACbKIiIiISIASZBERERGRACXIIiIiIiIBSpBFRERERALi9axkjPkg8FxgB3CetfbOGusa4DbgU9bavwojSBERERGRlVJvBfla4BJgT62VjDEx4CpvfRERERGRrlNXBdla+yMAVxyu6U3A14EB70dEREREpKuE1oNsjHkk8DTgI2FtU0RERERkpdVVQV6OMSYBfAZ4mbW2UEeluaKNG9tbdB4bG2zr9tutm+Pv5tihu+Pv5tihu+PvdOzap9bWzfF3c+yg+Dupm2OHlYs/lAQZOA14CHC9lxyPABFjzJC19pX1bmRiYoZisRRSSKcaGxvk6NHptmx7JXRz/N0cO3R3/N0cO3R3/MvFvhI7ee1Tq+vm+Ls5dlD8ndTNsUPt+MPep4aSIFtr9wKb/P+NMVcCA5rFQkRERES6TV09yMaYjxtj9gNnAN81xvzaW369MeaidgYoIiIiIrKS6p3F4rXAayssv6LK+le2FpaIiIiISGfoTHoiIiIiIgFKkEVEREREApQgi4iIiIgEKEEWEREREQlQgiwiIiIiEqAEWUREREQkQAmyiIiIiEiAEmQRERERkQAlyCIiIiIiAUqQRUREREQClCCLiIiIiAQoQRYRERERCVCCLCIiIiISoARZRERE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"
class="
jp-needs-light-background
"
>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h3 id="What-do-we-see-here?">What do we see here?<a class="anchor-link" href="#What-do-we-see-here?">&#182;</a></h3><ul>
<li>It seems like distribution of pay is consistent from 2011 to 2014. </li>
<li>We do observe 2 huge peaks in this plot. This could represent a group of high paying jobs.</li>
</ul>

</div>
</div>
</div>
</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Looking-into-total-pay-distribution-in-part-time-and-full-time-jobs">Looking into total pay distribution in part time and full time jobs<a class="anchor-link" href="#Looking-into-total-pay-distribution-in-part-time-and-full-time-jobs">&#182;</a></h2>
</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="n">fig</span><span class="p">,</span> <span class="n">ax</span> <span class="o">=</span> <span class="n">plt</span><span class="o">.</span><span class="n">subplots</span><span class="p">(</span><span class="n">figsize</span><span class="o">=</span><span class="p">(</span><span class="mi">10</span><span class="p">,</span> <span class="mi">5</span><span class="p">))</span>

<span class="n">full_time</span> <span class="o">=</span> <span class="n">df</span><span class="p">[</span><span class="n">df</span><span class="p">[</span><span class="s1">&#39;Status&#39;</span><span class="p">]</span> <span class="o">==</span> <span class="s1">&#39;FT&#39;</span><span class="p">]</span>
<span class="n">part_time</span> <span class="o">=</span> <span class="n">df</span><span class="p">[</span><span class="n">df</span><span class="p">[</span><span class="s1">&#39;Status&#39;</span><span class="p">]</span> <span class="o">==</span> <span class="s1">&#39;PT&#39;</span><span class="p">]</span>

<span class="n">sns</span><span class="o">.</span><span class="n">kdeplot</span><span class="p">(</span><span class="n">full_time</span><span class="p">[</span><span class="s1">&#39;TotalPay&#39;</span><span class="p">],</span> <span class="n">label</span><span class="o">=</span><span class="s2">&quot;Full-Time&quot;</span><span class="p">,</span> <span class="n">shade</span><span class="o">=</span><span class="kc">True</span><span class="p">,</span> <span class="n">ax</span><span class="o">=</span><span class="n">ax</span><span class="p">)</span>
<span class="n">sns</span><span class="o">.</span><span class="n">kdeplot</span><span class="p">(</span><span class="n">part_time</span><span class="p">[</span><span class="s1">&#39;TotalPay&#39;</span><span class="p">],</span> <span class="n">label</span><span class="o">=</span><span class="s2">&quot;Part-Time&quot;</span><span class="p">,</span> <span class="n">shade</span><span class="o">=</span><span class="kc">True</span><span class="p">,</span> <span class="n">ax</span><span class="o">=</span><span class="n">ax</span><span class="p">)</span>

<span class="n">plt</span><span class="o">.</span><span class="n">xlabel</span><span class="p">(</span><span class="s1">&#39;Total Pay&#39;</span><span class="p">)</span>
<span class="n">plt</span><span class="o">.</span><span class="n">ylabel</span><span class="p">(</span><span class="s1">&#39;Density&#39;</span><span class="p">)</span>
<span class="n">title</span> <span class="o">=</span> <span class="n">plt</span><span class="o">.</span><span class="n">title</span><span class="p">(</span><span class="s1">&#39;Total Pay Distribution among part time and full time jobs&#39;</span><span class="p">)</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>




<div class="jp-RenderedImage jp-OutputArea-output ">
<img src="data:image/png;base64,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"
class="
jp-needs-light-background
"
>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h3 id="What-do-we-see-here?">What do we see here?<a class="anchor-link" href="#What-do-we-see-here?">&#182;</a></h3><ul>
<li>It seems that full time jobs are much better paid as compared to part time jobs.</li>
</ul>

</div>
</div>
</div>
</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Looking-into-OvertimePay-distribution-between-Full-time-and-part-time-jobs">Looking into OvertimePay distribution between Full time and part time jobs<a class="anchor-link" href="#Looking-into-OvertimePay-distribution-between-Full-time-and-part-time-jobs">&#182;</a></h2>
</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="n">fig</span><span class="p">,</span> <span class="n">ax</span> <span class="o">=</span> <span class="n">plt</span><span class="o">.</span><span class="n">subplots</span><span class="p">(</span><span class="n">figsize</span><span class="o">=</span><span class="p">(</span><span class="mi">9</span><span class="p">,</span> <span class="mi">6</span><span class="p">))</span>

<span class="n">sns</span><span class="o">.</span><span class="n">kdeplot</span><span class="p">(</span><span class="n">full_time</span><span class="p">[</span><span class="s1">&#39;OvertimePay&#39;</span><span class="p">],</span> <span class="n">label</span><span class="o">=</span><span class="s2">&quot;Full-Time&quot;</span><span class="p">,</span> <span class="n">shade</span><span class="o">=</span><span class="kc">True</span><span class="p">,</span> <span class="n">ax</span><span class="o">=</span><span class="n">ax</span><span class="p">)</span>
<span class="n">sns</span><span class="o">.</span><span class="n">kdeplot</span><span class="p">(</span><span class="n">part_time</span><span class="p">[</span><span class="s1">&#39;OvertimePay&#39;</span><span class="p">],</span> <span class="n">label</span><span class="o">=</span><span class="s2">&quot;Part-Time&quot;</span><span class="p">,</span> <span class="n">shade</span><span class="o">=</span><span class="kc">True</span><span class="p">,</span> <span class="n">ax</span><span class="o">=</span><span class="n">ax</span><span class="p">)</span>

<span class="n">plt</span><span class="o">.</span><span class="n">xlabel</span><span class="p">(</span><span class="s1">&#39;Overtime Pay&#39;</span><span class="p">)</span>
<span class="n">plt</span><span class="o">.</span><span class="n">ylabel</span><span class="p">(</span><span class="s1">&#39;Density&#39;</span><span class="p">)</span>
<span class="n">title</span> <span class="o">=</span> <span class="n">plt</span><span class="o">.</span><span class="n">title</span><span class="p">(</span><span class="s1">&#39;OvertimePay Distribution between part-time and full-time jobs&#39;</span><span class="p">)</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>




<div class="jp-RenderedImage jp-OutputArea-output ">
<img src="data:image/png;base64,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"
class="
jp-needs-light-background
"
>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h3 id="What-do-we-see-here?">What do we see here?<a class="anchor-link" href="#What-do-we-see-here?">&#182;</a></h3><ul>
<li>It seems that full time job offer a much higher OT pay but we are glad to see that a huge proportion of OT pay is 0. This means there isn't much OT required to do.</li>
</ul>

</div>
</div>
</div>
</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Looking-into-distribution-of-Benefits-between-part-time-and-full-time-job">Looking into distribution of Benefits between part time and full time job<a class="anchor-link" href="#Looking-into-distribution-of-Benefits-between-part-time-and-full-time-job">&#182;</a></h2>
</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="n">fig</span><span class="p">,</span> <span class="n">ax</span> <span class="o">=</span> <span class="n">plt</span><span class="o">.</span><span class="n">subplots</span><span class="p">(</span><span class="n">figsize</span><span class="o">=</span><span class="p">(</span><span class="mi">9</span><span class="p">,</span> <span class="mi">6</span><span class="p">))</span>

<span class="n">sns</span><span class="o">.</span><span class="n">kdeplot</span><span class="p">(</span><span class="n">full_time</span><span class="p">[</span><span class="s1">&#39;Benefits&#39;</span><span class="p">],</span> <span class="n">label</span><span class="o">=</span><span class="s2">&quot;Full-Time&quot;</span><span class="p">,</span> <span class="n">shade</span><span class="o">=</span><span class="kc">True</span><span class="p">,</span> <span class="n">ax</span><span class="o">=</span><span class="n">ax</span><span class="p">)</span>
<span class="n">sns</span><span class="o">.</span><span class="n">kdeplot</span><span class="p">(</span><span class="n">part_time</span><span class="p">[</span><span class="s1">&#39;Benefits&#39;</span><span class="p">],</span> <span class="n">label</span><span class="o">=</span><span class="s2">&quot;Part-Time&quot;</span><span class="p">,</span> <span class="n">shade</span><span class="o">=</span><span class="kc">True</span><span class="p">,</span> <span class="n">ax</span><span class="o">=</span><span class="n">ax</span><span class="p">)</span>

<span class="n">plt</span><span class="o">.</span><span class="n">xlabel</span><span class="p">(</span><span class="s1">&#39;Benefits&#39;</span><span class="p">)</span>
<span class="n">plt</span><span class="o">.</span><span class="n">ylabel</span><span class="p">(</span><span class="s1">&#39;Density&#39;</span><span class="p">)</span>
<span class="n">title</span> <span class="o">=</span> <span class="n">plt</span><span class="o">.</span><span class="n">title</span><span class="p">(</span><span class="s1">&#39;Benefits Distribution between part-time and full-time jobs&#39;</span><span class="p">)</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>




<div class="jp-RenderedImage jp-OutputArea-output ">
<img src="data:image/png;base64,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"
class="
jp-needs-light-background
"
>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h3 id="What-do-we-see-here?">What do we see here?<a class="anchor-link" href="#What-do-we-see-here?">&#182;</a></h3><ul>
<li>It seems obvious that full time workers have higher benefits and given that most part-time jobs are short-term (depending on employment contracts), we see majority of the part-time job without any form of benefits.</li>
</ul>

</div>
</div>
</div>
</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Now-let's-have-a-look-into-pay-distribution-among-genders">Now let's have a look into pay distribution among genders<a class="anchor-link" href="#Now-let's-have-a-look-into-pay-distribution-among-genders">&#182;</a></h2>
</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="c1"># Importing data</span>
<span class="kn">from</span> <span class="nn">google.colab</span> <span class="kn">import</span> <span class="n">files</span> 
<span class="n">uploaded</span> <span class="o">=</span> <span class="n">files</span><span class="o">.</span><span class="n">upload</span><span class="p">()</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>



<div class="jp-RenderedHTMLCommon jp-RenderedHTML jp-OutputArea-output " data-mime-type="text/html">

     <input type="file" id="files-c517adb2-ae71-4d05-ad13-b01c12d0f356" name="files[]" multiple disabled />
     <output id="result-c517adb2-ae71-4d05-ad13-b01c12d0f356">
      Upload widget is only available when the cell has been executed in the
      current browser session. Please rerun this cell to enable.
      </output>
      <script src="/nbextensions/google.colab/files.js"></script> 
</div>

</div>

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>


<div class="jp-RenderedText jp-OutputArea-output" data-mime-type="text/plain">
<pre>Saving gender.csv to gender.csv
</pre>
</div>
</div>

</div>

</div>

</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="c1"># Assign the data into a variable call gender_data</span>
<span class="n">gender_data</span> <span class="o">=</span> <span class="n">pd</span><span class="o">.</span><span class="n">read_csv</span><span class="p">(</span><span class="s1">&#39;gender.csv&#39;</span><span class="p">)</span>
<span class="n">gender_data</span><span class="o">.</span><span class="n">head</span><span class="p">()</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt">Out[&nbsp;]:</div>



<div class="jp-RenderedHTMLCommon jp-RenderedHTML jp-OutputArea-output jp-OutputArea-executeResult" data-mime-type="text/html">
<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>id</th>
      <th>name</th>
      <th>gender</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>4</td>
      <td>A YING</td>
      <td>Unisex</td>
    </tr>
    <tr>
      <th>1</th>
      <td>16</td>
      <td>AA</td>
      <td>Female</td>
    </tr>
    <tr>
      <th>2</th>
      <td>28</td>
      <td>AABAN</td>
      <td>Male</td>
    </tr>
    <tr>
      <th>3</th>
      <td>40</td>
      <td>AABHA</td>
      <td>Unisex</td>
    </tr>
    <tr>
      <th>4</th>
      <td>52</td>
      <td>AABHEER</td>
      <td>Male</td>
    </tr>
  </tbody>
</table>
</div>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<ul>
<li>I have obtained this namelist from a random notebook I have chanced upon previously. We do see that the names are all in CAPS. We will need to do the same for our SQLite data. This can be done using the .str.upper() method. We will then use .split() to get the first name from EmployeeName. </li>
</ul>

</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell jp-mod-noOutputs  ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="c1"># Split employeename and capitalise it. Then assign it to a new column call &#39;name&#39;.</span>
<span class="n">df</span> <span class="o">=</span> <span class="n">df</span><span class="o">.</span><span class="n">assign</span><span class="p">(</span><span class="n">name</span> <span class="o">=</span> <span class="n">df</span><span class="p">[</span><span class="s1">&#39;EmployeeName&#39;</span><span class="p">]</span><span class="o">.</span><span class="n">apply</span><span class="p">(</span><span class="k">lambda</span> <span class="n">x</span><span class="p">:</span> <span class="n">x</span><span class="o">.</span><span class="n">split</span><span class="p">()[</span><span class="mi">0</span><span class="p">]</span><span class="o">.</span><span class="n">upper</span><span class="p">()))</span>
<span class="n">final_df</span> <span class="o">=</span> <span class="n">pd</span><span class="o">.</span><span class="n">merge</span><span class="p">(</span><span class="n">gender_data</span><span class="p">,</span><span class="n">df</span><span class="p">,</span> <span class="n">how</span><span class="o">=</span><span class="s1">&#39;inner&#39;</span><span class="p">,</span> <span class="n">on</span> <span class="o">=</span> <span class="s1">&#39;name&#39;</span><span class="p">)</span>
</pre></div>

     </div>
</div>
</div>
</div>

</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="c1"># Looking into new data</span>
<span class="n">final_df</span><span class="o">.</span><span class="n">head</span><span class="p">()</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt">Out[&nbsp;]:</div>



<div class="jp-RenderedHTMLCommon jp-RenderedHTML jp-OutputArea-output jp-OutputArea-executeResult" data-mime-type="text/html">
<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>id</th>
      <th>name</th>
      <th>gender</th>
      <th>Id</th>
      <th>EmployeeName</th>
      <th>JobTitle</th>
      <th>BasePay</th>
      <th>OvertimePay</th>
      <th>OtherPay</th>
      <th>Benefits</th>
      <th>TotalPay</th>
      <th>TotalPayBenefits</th>
      <th>Year</th>
      <th>Notes</th>
      <th>Agency</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1492</td>
      <td>AALIYAH</td>
      <td>Female</td>
      <td>71328</td>
      <td>AALIYAH HOGUE</td>
      <td>Public Svc Aide-Public Works</td>
      <td>2493.61</td>
      <td>0.00</td>
      <td>0.00</td>
      <td>212.71</td>
      <td>2493.61</td>
      <td>2706.32</td>
      <td>2012</td>
      <td></td>
      <td>San Francisco</td>
      <td></td>
    </tr>
    <tr>
      <th>1</th>
      <td>1492</td>
      <td>AALIYAH</td>
      <td>Female</td>
      <td>100915</td>
      <td>AALIYAH V HOGUE</td>
      <td>Junior Clerk</td>
      <td>33271.68</td>
      <td>0.00</td>
      <td>0.00</td>
      <td>17859.80</td>
      <td>33271.68</td>
      <td>51131.48</td>
      <td>2013</td>
      <td></td>
      <td>San Francisco</td>
      <td></td>
    </tr>
    <tr>
      <th>2</th>
      <td>1492</td>
      <td>AALIYAH</td>
      <td>Female</td>
      <td>141683</td>
      <td>AALIYAH V HOGUE</td>
      <td>Junior Clerk</td>
      <td>12451.74</td>
      <td>0.00</td>
      <td>991.99</td>
      <td>7627.47</td>
      <td>13443.73</td>
      <td>21071.20</td>
      <td>2014</td>
      <td></td>
      <td>San Francisco</td>
      <td>PT</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1492</td>
      <td>AALIYAH</td>
      <td>Female</td>
      <td>146943</td>
      <td>AALIYAH JAVAE'MERCEDES O'NEAL</td>
      <td>Publ Svc Aide-Asst to Prof</td>
      <td>2596.36</td>
      <td>0.00</td>
      <td>0.00</td>
      <td>25.96</td>
      <td>2596.36</td>
      <td>2622.32</td>
      <td>2014</td>
      <td></td>
      <td>San Francisco</td>
      <td>PT</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2404</td>
      <td>AARAN</td>
      <td>Male</td>
      <td>50915</td>
      <td>AARAN LUO</td>
      <td>Transit Operator</td>
      <td>64947.24</td>
      <td>12726.06</td>
      <td>445.66</td>
      <td>36539.64</td>
      <td>78118.96</td>
      <td>114658.60</td>
      <td>2012</td>
      <td></td>
      <td>San Francisco</td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Look-into-the-distribution-of-gender-in-the-dataset">Look into the distribution of gender in the dataset<a class="anchor-link" href="#Look-into-the-distribution-of-gender-in-the-dataset">&#182;</a></h2>
</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="n">sns</span><span class="o">.</span><span class="n">countplot</span><span class="p">(</span><span class="n">data</span> <span class="o">=</span> <span class="n">final_df</span><span class="p">,</span> <span class="n">x</span> <span class="o">=</span> <span class="s1">&#39;gender&#39;</span><span class="p">)</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt">Out[&nbsp;]:</div>




<div class="jp-RenderedText jp-OutputArea-output jp-OutputArea-executeResult" data-mime-type="text/plain">
<pre>&lt;matplotlib.axes._subplots.AxesSubplot at 0x7f732da6d4a8&gt;</pre>
</div>

</div>

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>




<div class="jp-RenderedImage jp-OutputArea-output ">
<img src="data:image/png;base64,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"
class="
jp-needs-light-background
"
>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<ul>
<li>We do not need unisex data for our analysis. </li>
<li>We will drop it in the next step!</li>
</ul>

</div>
</div>
</div>
</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Removing-rows-with-unisex-gender">Removing rows with unisex gender<a class="anchor-link" href="#Removing-rows-with-unisex-gender">&#182;</a></h2>
</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="n">final_df</span> <span class="o">=</span> <span class="n">final_df</span><span class="p">[</span><span class="n">final_df</span><span class="o">.</span><span class="n">gender</span> <span class="o">!=</span> <span class="s1">&#39;Unisex&#39;</span><span class="p">]</span>
<span class="n">sns</span><span class="o">.</span><span class="n">countplot</span><span class="p">(</span><span class="n">data</span> <span class="o">=</span> <span class="n">final_df</span><span class="p">,</span> <span class="n">x</span> <span class="o">=</span> <span class="s1">&#39;gender&#39;</span><span class="p">)</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt">Out[&nbsp;]:</div>




<div class="jp-RenderedText jp-OutputArea-output jp-OutputArea-executeResult" data-mime-type="text/plain">
<pre>&lt;matplotlib.axes._subplots.AxesSubplot at 0x7f732961df60&gt;</pre>
</div>

</div>

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>




<div class="jp-RenderedImage jp-OutputArea-output ">
<img src="data:image/png;base64,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"
class="
jp-needs-light-background
"
>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Comparing-totalpay-among-sex-using-a-boxplot">Comparing totalpay among sex using a boxplot<a class="anchor-link" href="#Comparing-totalpay-among-sex-using-a-boxplot">&#182;</a></h2>
</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="n">plt</span><span class="o">.</span><span class="n">figure</span><span class="p">(</span><span class="n">figsize</span><span class="o">=</span><span class="p">(</span><span class="mi">5</span><span class="p">,</span> <span class="mi">8</span><span class="p">))</span>

<span class="n">sns</span><span class="o">.</span><span class="n">boxplot</span><span class="p">(</span><span class="n">data</span> <span class="o">=</span> <span class="n">final_df</span><span class="p">,</span> <span class="n">x</span><span class="o">=</span><span class="s1">&#39;gender&#39;</span><span class="p">,</span><span class="n">y</span><span class="o">=</span><span class="s1">&#39;TotalPay&#39;</span><span class="p">)</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt">Out[&nbsp;]:</div>




<div class="jp-RenderedText jp-OutputArea-output jp-OutputArea-executeResult" data-mime-type="text/plain">
<pre>&lt;matplotlib.axes._subplots.AxesSubplot at 0x7f732ac2a4a8&gt;</pre>
</div>

</div>

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>




<div class="jp-RenderedImage jp-OutputArea-output ">
<img src="data:image/png;base64,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"
class="
jp-needs-light-background
"
>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<ul>
<li>It seems like the median pay for males is slightly higher than females.</li>
</ul>

</div>
</div>
</div>
</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Comparing-benefits-among-gender">Comparing benefits among gender<a class="anchor-link" href="#Comparing-benefits-among-gender">&#182;</a></h2>
</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="n">plt</span><span class="o">.</span><span class="n">figure</span><span class="p">(</span><span class="n">figsize</span><span class="o">=</span><span class="p">(</span><span class="mi">5</span><span class="p">,</span> <span class="mi">8</span><span class="p">))</span>

<span class="n">sns</span><span class="o">.</span><span class="n">boxplot</span><span class="p">(</span><span class="n">data</span> <span class="o">=</span> <span class="n">final_df</span><span class="p">,</span> <span class="n">x</span><span class="o">=</span><span class="s1">&#39;gender&#39;</span><span class="p">,</span><span class="n">y</span><span class="o">=</span><span class="s1">&#39;Benefits&#39;</span><span class="p">)</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt">Out[&nbsp;]:</div>




<div class="jp-RenderedText jp-OutputArea-output jp-OutputArea-executeResult" data-mime-type="text/plain">
<pre>&lt;matplotlib.axes._subplots.AxesSubplot at 0x7f732ae34fd0&gt;</pre>
</div>

</div>

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>




<div class="jp-RenderedImage jp-OutputArea-output ">
<img src="data:image/png;base64,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"
class="
jp-needs-light-background
"
>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<ul>
<li>Males are higher once again</li>
</ul>

</div>
</div>
</div>
</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h2 id="Lastly,-we-will-use-a-scatterplot-to-show-the-relationship-between-basepay-and-overtimepay-among-sexes.">Lastly, we will use a scatterplot to show the relationship between basepay and overtimepay among sexes.<a class="anchor-link" href="#Lastly,-we-will-use-a-scatterplot-to-show-the-relationship-between-basepay-and-overtimepay-among-sexes.">&#182;</a></h2>
</div>
</div>
</div>
</div><div class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[&nbsp;]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-python"><pre><span></span><span class="n">sns</span><span class="o">.</span><span class="n">lmplot</span><span class="p">(</span><span class="n">x</span><span class="o">=</span><span class="s1">&#39;BasePay&#39;</span><span class="p">,</span> <span class="n">y</span><span class="o">=</span><span class="s1">&#39;OvertimePay&#39;</span><span class="p">,</span> <span class="n">hue</span><span class="o">=</span><span class="s1">&#39;gender&#39;</span><span class="p">,</span> <span class="n">data</span><span class="o">=</span><span class="n">final_df</span><span class="p">,</span> <span class="n">fit_reg</span><span class="o">=</span> <span class="kc">False</span><span class="p">,</span> <span class="n">height</span><span class="o">=</span><span class="mi">7</span><span class="p">,</span> <span class="n">aspect</span><span class="o">=</span><span class="mf">1.4</span><span class="p">)</span>
<span class="n">plt</span><span class="o">.</span><span class="n">show</span><span class="p">()</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">

<div class="jp-OutputArea-child">

    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>




<div class="jp-RenderedImage jp-OutputArea-output ">
<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAwYAAAHwCAYAAAAcknj5AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEgAACxIB0t1+/AAAADh0RVh0U29mdHdhcmUAbWF0cGxvdGxpYiB2ZXJzaW9uMy4yLjEsIGh0dHA6Ly9tYXRwbG90bGliLm9yZy+j8jraAAAgAElEQVR4nOzde3wkV33n/U9V9UXXkcYjgW2MsD3gA0lQsP3CExhzi0OY2ZgQIBBuZgmbPIGQOwSzSXY3T7JJMDgJT4AACbCByWAuYROIkxmvITHEA4wJtiObB86Y8UW+W5oZaaTWqLu66uwfVd3q1kijbk136/Z9v156SV1V3XV0ZIbzq/P7neM55xARERERka3NX+sGiIiIiIjI2lNgICIiIiIiCgxERERERESBgYiIiIiIoMCgWRngwvS7iIiIiMimoQFucy4A7jt2bJY47sxqTtu393DixFxH7rWVqF/bR33bPurb9lHftof6tX22Yt8OD/d7a92GzU4zButcJhOsdRM2JfVr+6hv20d92z7q2/ZQv7aP+lbaQYGBiIiIiIgoMBAREREREQUGIiIiIiKCAgMREREREUGBgYiIiIiIoMBARERERERQYCAiIiIiInRogzNjzA5gH7ATKAH3AL9krZ0wxjjgLiBOL7/GWntX+r6XA+9P2/kd4OettXPtOiciIiIislV1asbAAe+z1hpr7bOBo8B7a84/31r7nPSrEhT0AX8NvNxa+3RgBnhXu86JiIiIiGxlHQkMrLXHrbW31Bz6FvC0Fd62F/h3a+096euPAj/XxnMiIiIiIltWR1KJahljfODtwJdrDt9ijMkAB4Dft9YWgRHggZprxoGnpj+345yIiIiIyJbV8cAA+CAwC3wofT1irX3QGLONpA7hvwG/twbtatiOHX0dvd/wcH9H77dVqF/bR33bPurb9lHftof6tX3Ut9JqHQ0MjDHXA88gyfGPAay1D6bfTxpjPg78Vnr5OPCSmrePAA+28VzDjh2bJY5ds29bleHhfiYmZjpyr61E/do+6tv2Ud+2j/q2PdSv7bMV+1aBUPt1bLlSY8wfA5cDP5OmCmGM2W6M6U5/zgA/C9yZvuUg8FxjzDPS128DPt/GcyIiIiIiW1ZHAgNjzA8D/xU4H/iGMeZOY8zfA88EDhtj/gMYA0KSVCKstTPA/wPcaIz5ATAAXN+ucyIiIiIiW5nnXGdSYjaJC4H7lEq08alf20d92z7q2/ZR37aH+rV9tmLfDg/3e2vdhs1uLYqPRUSkDcLxMcKxA8QzE/j9w2RH95IdGV3rZomIyAbRsRoDERFpn3B8jOKhfcSFKcj1EhemKB7aRzg+ttZNExGRDUKBgYjIJhCOHQA/g5fN43keXjYPfiY5LiIi0gAFBiIim0A8MwGZXP3BTC45LiIi0gAFBiIim4DfPwzlUv3Bcik5LiIi0gAFBiIim0B2dC/EZVxYxDmHC4sQl5PjIiIiDVBgICKyCWRHRsnvvga/dxBKBfzeQfK7r9GqRCIi0jAtVyoisklkR0YVCIiIyKppxkBERERERBQYiIiIiIiIAgMREREREUGBgYiIiIiIoMBARERERERQYCAiIiIiIigwEBERERERFBiIiIiIiAgKDEREREREBAUGIiIiIiKCAgMREREREUGBgYiIiIiIoMBARERERERQYCAiIiIiIigwEBERERERFBiIiIiIiAgKDEREREREBAUGIiIiIiKCAgMREREREUGBgYiIiIiIoMBARERERERQYCAiIiIiIigwEBERERERFBiIiIiIiAgKDEREREREBAUGIiIiIiKCAgMREREREUGBgYiIiIiIoMBARERERERQYCAiIiIiIigwEBERERERFBiIiIiIiAiQWesGiIisJ+H4GOHYAeKZCfz+YbKje8mOjK51s0RERNpOMwYiIqlwfIzioX3EhSnI9RIXpige2kc4PrbWTRMREWk7BQYiIqlw7AD4GbxsHs/z8LJ58DPJcRERkU1OgYGISCqemYBMrv5gJpccFxER2eQUGIiIpPz+YSiX6g+WS8lxERGRTU6BgYhIKju6F+IyLizinMOFRYjLyXEREZFNToGBiEgqOzJKfvc1+L2DUCrg9w6S332NViUSEZEtQcuViojUyI6MKhAQEZEtSTMGIiIiIiKiwEBERERERBQYiIiIiIgICgxERERERAQFBiIiIiIiggIDERERERFBgYGIiIiIiKDAQEREREREUGAgIiIiIiIoMBARERERERQYiIiIiIgICgxERERERAQFBiIiIiIiggIDERERERFBgYGIiIiIiKDAQEREREREUGAgIiIiIiIoMBARERERERQYiIiIiIgICgxERERERAQFBiIiIiIiggIDERER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"
class="
jp-needs-light-background
"
>
</div>

</div>

</div>

</div>

</div>
<div class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<ul>
<li>We do not observe any relationship between basepay and overtime pay.</li>
</ul>

</div>
</div>
</div>
</div>
</body>







</html>
