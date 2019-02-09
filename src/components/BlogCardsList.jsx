import React from "react"
import ReactDOM from "react-dom"
import { Card, CardImg, CardText, CardBody,
		 CardTitle, CardSubtitle, Button } from 'reactstrap';

class BlogCardsList extends React.Component{
	constructor(){
		super();
		this.state = {
			blogs: [{}],
			img_path: ""
		}
		let that = this;
		fetch('/api/v1/blogs').then((resp) =>(
			resp.json()
		)).then((json) => {
			that.setState({
				blogs: json.blogs,
				img_path: json.blog_default_img_path
			});
		});
	}
	render(){
		let cards = this.state.blogs.map((v, i) => (
			<a href={"/page/" + v.id}>
				<Card style={{width: '350px', display: "left"}} key={i}>
					<CardImg top width="300px" height="300px" src={this.state.img_path}	/>
					<CardTitle
					title={v.title}
					/>
					<CardText>{(v.body || "no contents")}</CardText>
				</Card>
			</a>
		));
		return (
			<div>
				{cards}
			</div>
		);
	}
}
export default BlogCardsList;
