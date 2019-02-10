"use strict";

Object.defineProperty(exports, "__esModule", {
	value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _react = require("react");

var _react2 = _interopRequireDefault(_react);

var _reactDom = require("react-dom");

var _reactDom2 = _interopRequireDefault(_reactDom);

var _reactstrap = require("reactstrap");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var BlogCardsList = function (_React$Component) {
	_inherits(BlogCardsList, _React$Component);

	function BlogCardsList() {
		_classCallCheck(this, BlogCardsList);

		var _this = _possibleConstructorReturn(this, (BlogCardsList.__proto__ || Object.getPrototypeOf(BlogCardsList)).call(this));

		_this.state = {
			blogs: [{}],
			img_path: ""
		};
		var that = _this;
		fetch('/api/v1/blogs').then(function (resp) {
			return resp.json();
		}).then(function (json) {
			that.setState({
				blogs: json.blogs,
				img_path: json.blog_default_img_path
			});
		});
		return _this;
	}

	_createClass(BlogCardsList, [{
		key: "render",
		value: function render() {
			var _this2 = this;

			var cards = this.state.blogs.map(function (v, i) {
				return _react2.default.createElement(
					_reactstrap.Card,
					{ style: { width: '350px', height: '500px', float: "left" }, key: i },
					_react2.default.createElement(_reactstrap.CardImg, { top: true,
						width: "200px", height: "200px",
						src: _this2.state.img_path }),
					_react2.default.createElement(
						_reactstrap.CardBody,
						null,
						_react2.default.createElement(_reactstrap.CardTitle, {
							title: v.title
						}),
						_react2.default.createElement(
							_reactstrap.CardSubtitle,
							null,
							"\u30BF\u30B0:",
							v.tags_string || "no contents"
						),
						_react2.default.createElement(
							_reactstrap.CardText,
							null,
							"\u672C\u6587:",
							(v.body || "no contents").substring(0, 20)
						),
						_react2.default.createElement(
							"a",
							{ href: "/page/" + v.id },
							"\u7D9A\u304D\u3092\u898B\u308B"
						)
					)
				);
			});
			return _react2.default.createElement(
				"div",
				null,
				cards
			);
		}
	}]);

	return BlogCardsList;
}(_react2.default.Component);

exports.default = BlogCardsList;