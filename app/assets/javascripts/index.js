"use strict";

var _react = require("react");

var _react2 = _interopRequireDefault(_react);

var _reactDom = require("react-dom");

var _reactDom2 = _interopRequireDefault(_reactDom);

var _BlogCardsList = require("./components/BlogCardsList");

var _BlogCardsList2 = _interopRequireDefault(_BlogCardsList);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

_reactDom2.default.render(_react2.default.createElement(
	"div",
	null,
	_react2.default.createElement(_BlogCardsList2.default, null)
), document.getElementById("app"));